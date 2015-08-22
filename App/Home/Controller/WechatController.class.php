<?php
namespace Home\Controller;

use Common\Tools\Wechat;
use Home\Controller\BaseController;

class WechatController extends BaseController
{
    private $wechat = '';

    /**
     * 初始化操作,接口验证以及判断消息类型
     * @method _initialize
     */
    public function _initialize()
    {
        $options = array(
            'token' => C('TOKEN'), //填写你设定的key
            'encodingaeskey' => C('ENCODINGAESKEY'), //填写加密用的EncodingAESKey
            'appid' => C('APPID'), //填写高级调用功能的app id
            'appsecret' => C('APPSECRET'), //填写高级调用功能的密钥
        );

        $this->wechat = new Wechat($options);
        $this->wechat->valid();

        $type = $this->wechat->getRevType();

        switch ($type) {
            //文本回复
            case Wechat::MSGTYPE_TEXT:
                $this->_text();
                break;
            //事件
            case Wechat::MSGTYPE_EVENT:
                $this->_event();
                break;
            //关注
            case Wechat::EVENT_SUBSCRIBE:
                $this->_subscribe();
                break;
        }
    }

    /**
     * 文本类型
     * @method _text
     */
    public function _text($content = '')
    {
        $content = empty($content) ? $this->wechat->getRevData() : $content;

        $map['name'] = $content;

        $info = D('Keywords')->_get($map);

        if (empty($info)) {
            die();
        }

        if ($info['type'] == 1) {
            $this->wechat->text($info['content'])->reply();
            die();
        }

        //图文回复
        $list = $this->getNews($info['id']);
        if (!empty($list)) {
            $this->wechat->news($list)->reply();
        }
        die();
    }

    /**
     * 事件类型处理
     * @method _event
     */
    public function _event()
    {
        $eventInfo = $this->wechat->getRevEvent();
        $event = $eventInfo['event'];
        $key = $eventInfo['key'];

        switch ($event) {
            case Wechat::EVENT_MENU_CLICK:
                $this->_text($key);
                break;
            case Wechat::EVENT_MENU_VIEW:
                break;
        }
    }

    /**
     * 关注回复
     * @method _subscribe
     */
    public function _subscribe()
    {
        $content = C('WEIXIN_SUBSCRIBE');
        $this->wechat->text($content)->reply();
        die();
    }

    /**
     * 根据key获取要返回的图文信息
     * @method getNews
     * @param  int  $key_id 关键词id
     * @return array          查询出得数据
     */
    private function getNews($key_id)
    {
        $where['key_id'] = $key_id;

        $list = D('News')->_list($where, 'title,desc,pic,url', 'id desc', 1, 10);

        if (empty($list)) {
            return array();
        }
        $_list = array();
        foreach ($list as $_k => $_v) {
            $_list[$_k]['Title'] = $_v['title'];
            $_list[$_k]['Description'] = $_v['desc'];
            $_list[$_k]['PicUrl'] = $_v['pic'];
            $_list[$_k]['Url'] = $_v['url'];
        }

        return $_list;
    }
}
