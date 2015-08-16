<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;

class AgentController extends BaseController
{
    public function _before_add()
    {
        $class_list = D('AgentClass')->_list();
        $this->assign('class_list', $class_list);
    }
}
