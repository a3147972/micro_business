<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class SinglepageController extends BaseController
{
    public function index()
    {
        $id = I('id');

        $map['id'] = $id;

        $info = D('Singlepage')->_get($map);
        $this->assign('vo', $info);
        $this->assign('header_title', $info['title']);
        $this->display();
    }
}
