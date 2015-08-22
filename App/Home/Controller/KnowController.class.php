<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class KnowController extends BaseController
{
    public function index()
    {
        $list = D('Know')->lists(array(), 'id desc');
        $this->assign('list', $list);
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
