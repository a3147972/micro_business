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

    public function _before_edit()
    {
        $this->_before_add();
    }

    public function index()
    {
        $page = I('page', 1);
        $page_size = I('page_size', 10);
        $order = I('order', '');

        $model = D('Agent');

        //查询值
        $pk = $model->getPk();
        $order = empty($order) ? $pk . ' desc' : $order;
        $map = method_exists($this, '_filter') ? $this->_filter() : array();

        //查询数据
        $list = $model->lists($map, $order, $page, $page_size);

        $count = $model->_count($map);
        //分页处理
        $page_list = $this->page($count, $page, $page_size);

        $this->assign('page_list', $page_list);
        $this->assign('count', $count);
        $this->assign('list', $list);
        $this->display();
    }
}
