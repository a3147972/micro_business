<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class KnowController extends BaseController
{
    public function index()
    {
        $map = array();
        $class_id = I('class_id', '');

        if (!empty($class_id)) {
            $map['class_id'] = $class_id;
        }
        $list = D('Know')->_list($map, '', 'id desc', 0);

        $this->assign('list', $list);
        $this->assign('header_title', '知识列表');
        $this->display();
    }

    public function content()
    {
        $id = I('id');

        $map['id'] = $id;
        $info = D('Know')->_get($map);
        $this->display();
    }
}
