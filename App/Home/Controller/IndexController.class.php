<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class IndexController extends BaseController
{
    public function index()
    {
        $know_class_list = $this->getKnowClass();
        $this->assign('know_class_list', $know_class_list);
        $this->display();
    }

    private function getKnowClass()
    {
        $list = D('KnowClass')->_list(array(), '', '', 'id desc', 0);
        return $list;
    }
}
