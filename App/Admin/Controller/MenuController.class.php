<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;
use Common\Tools\ArrayHelper;
use Common\Tools\Wechat;

class MenuController extends BaseController
{
    public function index()
    {
        $page = I('page', 1);
        $page_size = I('page_size', 10);
        $order = I('order', '');

        $model = D(CONTROLLER_NAME);

        //查询值
        $pk = $model->getPk();
        $order = empty($order) ? $pk . ' desc' : $order;
        $map = method_exists($this, '_filter') ? $this->_filter() : array();

        //查询数据
        $list = $model->lists($map, $order, $page, $page_size);

        $list = ArrayHelper::array_tree($list);

        $count = $model->_count($map);

        //分页处理
        $page_list = $this->page($count, $page, $page_size);

        $this->assign('page_list', $page_list);
        $this->assign('count', $count);
        $this->assign('list', $list);
        $this->display();
    }

    public function _before_add()
    {
        $level = I('level', 1);
        if ($level != 1) {
            $pid = I('pid');
            $map['pid'] = $pid;
        }
        $map['level'] = $level;

        $count = D('Menu')->_count($map);

        if ($level == 1 && $count >= 3) {
            $this->error('一级菜单已达到上限');
        } else if ($level == 2 && $count >= 5) {
            $this->error('二级菜单已达到上限');
        }
    }

    public function create()
    {
        $list = D('Menu')->lists(array(), 'pid asc');

        //构造自定义菜单数据
        foreach ($list as $_k => $_v) {
            if ($_v['pid'] == 0) {
                $_list[$_v['id']]['name'] = $_v['name'];
                switch ($_v['type']) {
                    case 1:
                        $_list[$_v['id']]['type'] = 'click';
                        $_list[$_v['id']]['key'] = $_v['key'];
                        break;
                    case 2:
                        $_list[$_v['id']]['type'] = 'view';
                        $_list[$_v['id']]['url'] = $_v['url'];
                        break;
                }
            } else {
                $_list[$_v['pid']]['sub_button'][$_v['id']]['name'] = $_v['name'];
                switch ($_v['type']) {
                    case 1:
                        $_list[$_v['pid']]['sub_button'][$_v['id']]['type'] = 'click';
                        $_list[$_v['pid']]['sub_button'][$_v['id']]['key'] = $_v['key'];
                        break;
                    case 2:
                        $_list[$_v['pid']]['sub_button'][$_v['id']]['type'] = 'view';
                        $_list[$_v['pid']]['sub_button'][$_v['id']]['url'] = htmlspecialchars_decode($_v['url']);
                        break;
                }
            }
        }
        $list = ArrayHelper::array_number_key($_list);
        foreach ($list as $_k => $_v) {
            if (isset($_v['sub_button'])) {
                $_temp = ArrayHelper::array_number_key($_v['sub_button']);
                $list[$_k]['sub_button'] = $_temp;
            }
        }
        //创建自定义菜单
        $options = array(
            'token' => C('TOKEN'), //填写你设定的key
            'encodingaeskey' => C('ENCODINGAESKEY'), //填写加密用的EncodingAESKey
            'appid' => C('APPID'), //填写高级调用功能的app id
            'appsecret' => C('APPSECRET'), //填写高级调用功能的密钥
        );
        $wechat = new Wechat($options);
        $wechat->valid(true);
        $lists['button'] = $list;
        $create_result = $wechat->createMenu($lists);

        if ($create_result) {
            $this->success('创建成功,24小时内生效');
        } else {
            $this->error($wechat->errMsg);
        }
    }
}
