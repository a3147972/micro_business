<?php
/**
 * 管理员
 * @package Controller;
 * @author guolei <2387813033@qq.com>
 */
namespace Admin\Controller;

use Admin\Controller\BaseController;

class AdminController extends BaseController
{
    /**
     * 首页
     */
    public function index()
    {
        $model = D('Admin');

        $page = I('page', 1);
        $page_size = I('page_size', 10);

        $list = $model->lists(array(), 'id desc', $page, $page_size);
        $count = $model->_count();

        $page_list = $this->page($count, $page, $page_size);

        $this->assign('list', $list);
        $this->assign('page_list', $page_list);

        $this->display();
    }

    /**
     * 新增之前获取组列表
     */
    public function _before_add()
    {
        $group_list = D('Group')->lists();
        $this->assign('group_list', $group_list);
    }

    /**
     * 编辑之前获取组列表
     */
    public function _before_edit()
    {
        $this->_before_edit();
    }

    public function _before_del()
    {
        $id = I('get.id');

        if ($id == 1) {
            $this->error('默认管理员不可被删除');
        }
    }
}
