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
            'token' => C('WX_TOKEN'), //填写你设定的key
            'encodingaeskey' => C('ENCODINGAESKEY'), //填写加密用的EncodingAESKey
            'appid' => C('APPID'), //填写高级调用功能的app id
            'appsecret' => C('APPSECRET'), //填写高级调用功能的密钥
        );

        $this->wechat = new Wechat($options);
        $this->wechat->valid();
        $type = $this->wechat->getRev()->getRevType();

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

        switch ($content) {
            case 'sucai':
                $this->_text_sucai();
                exit();
                break;
            case 'agent_search':
                $text = '请直接在微信公众平台输入姓名,手机号,微信号或授权编码查询';
                $this->wechat->text($text)->reply();
                exit();
                break;
        }

        $map['name'] = $content;

        $info = D('Keywords')->_get($map);

        if (empty($info)) {
            $this->agent_search($content); //代理商查询
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

    /**
     * 微信自定义菜单输出素材包
     * @method _text_sucai
     * @return [type]      [description]
     */
    private function _text_sucai()
    {
        $list = D('Material')->field('date_format(ctime, "%Y-%m-%d") as ctime')->group('date_format(ctime, "%y-%m-%d")')->order('ctime desc')->limit(0, 10)->select();
        $list = array_column($list, 'ctime');

        $str = "请点击链接查看产品素材: \n";
        foreach ($list as $_k => $_v) {
            $str .= '[' . ($_k + 1) . ']<a href="' . UR('Material', 'index', array('date' => $_v)) . '">朋友圈素材' . date('m月d日', strtotime($_v)) . '</a>' . "\n";
        }
        $str .= '[' . (count($list) + 1) . ']<a href="' . UR('Material', 'index') . '">查看更多素材</a>';

        $this->wechat->text($str)->reply();exit();
    }

    /**
     * 代理商查询
     * @method agent_search
     * @param  string       $content 查询内容
     * @return str                查询结果字符串
     */
    private function agent_search($content)
    {
        $model = D('Agent');
        $map['name|mobile|id_card|wechat_number|authorize_code'] = $content;

        $find = $model->where($map)->order('id desc')->$find();

        $str = "查询结果\n";
        $str .= '【姓名】 ' . $find['name'] . "\n";
        $str .= '【手机号】 ' . $find['mobile'] . "\n";
        $str .= '【微信号】 ' . $find['wechat_number'] . "\n";
        $str .= '【授权编码】 ' . $find['authorize_code'] . "\n";
        $str .= '【代理等级】 ' . $find['class'] . "\n";

        $this->wechat->text($str)->reply();exit();
    }
}
