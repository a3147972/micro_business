<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class MaterialController extends BaseController
{
    public function index()
    {
        $list = D('Material')->_list();

        $this->assign('list', $list);
        $this->display();
    }

    public function content()
    {
        $id = I('id');

        $map['id'] = $id;

        $info = D('Material')->_get($map);
        $this->assign('vo', $info);
        $this->assign('header_title', msubstr($info['title'], 0, 19));
        $this->display();
    }
}
