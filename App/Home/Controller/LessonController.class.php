<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class LessonController extends BaseController
{
    public function index()
    {
        $list = D('Lesson')->_list(array(), '', 'id asc');
        $this->assign('list', $list);
        $this->assign('header_title', '课程列表');
        $this->display();
    }
}
