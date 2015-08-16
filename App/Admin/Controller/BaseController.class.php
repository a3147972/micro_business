<?php
/**
 * 后台公共类
 *
 * @package Controller
 * @author guolei <2387813033@qq.com>
 */
namespace Admin\Controller;

use Common\Tools\ArrayHelper;
use Common\Tools\Page;
use Think\Controller;

class BaseController extends Controller
{
    public function _initialize()
    {
        //权限判断
        if (session('gid') !== 1) {
            $node = CONTROLLER_NAME . '/' . ACTION_NAME;
            $node_list = session('node_list');
            $node_list = array_column($node_list, 'node');

            if (is_null(array_search($node, $node_list))) {
                redirect(U('Login/logout')); //没有权限直接退出
            }
        }
        //获取左侧菜单列表
        $menu_list = $this->menu();
        // dump($menu_list);exit();
        $this->assign('menu_list', $menu_list);
    }

    /**
     * 默认首页
     */
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
        $list = $model->_list($map, '', $order, $page, $page_size);
        $count = $model->_count($map);

        //分页处理
        $page_list = $this->page($count, $page, $page_size);

        $this->assign('page_list', $page_list);
        $this->assign('count', $count);
        $this->assign('list', $list);
        $this->display();
    }

    /**
     * 分页处理
     * @param  int  $count     总条数
     * @param  integer $page      当前页
     * @param  integer $page_size 每页条数
     * @return array              分页数据
     */
    public function page($count, $page = 1, $page_size = 10)
    {
        $Page = new Page($count, $page, $page_size);

        $page_list = $Page->show();
        $get = I('get.');
        foreach ($page_list as $_k => $_v) {
            $page_list[$_k]['url'] = U(CONTROLLER_NAME . '/index', array_merge($get, array('page' => $_v['page'], 'page_size' => $page_size, 'order' => $order)));
        }

        return $page_list;
    }

    public function add()
    {
        $this->assign('action', 'add');
        $this->display();
    }

    /**
     * 默认新增
     */
    public function insert()
    {
        $model = D(CONTROLLER_NAME);

        if (!$model->create()) {
            $this->error($model->getError());
        }
        $insert_result = $model->add();

        if ($insert_result) {
            $this->success('新增成功', U(CONTROLLER_NAME . '/index'));
        } else {
            $this->error('新增失败');
        }
    }

    public function edit()
    {
        $model = D(CONTROLLER_NAME);

        $pk = $model->getPk();

        $map[$pk] = I('get.' . $pk);

        $info = $model->_get($map);

        $this->assign('vo', $info);
        $this->assign('action', 'edit');
        $this->display('add');
    }

    /**
     * 默认更新数据
     */
    public function update()
    {
        $model = D(CONTROLLER_NAME);

        if (!$model->create()) {
            $this->error($model->getError());
        }

        $pk = $model->getPk();

        $map[$pk] = I($pk);
        $update_result = $model->where($map)->save();

        if ($update_result !== false) {
            $this->success('修改成功', U(CONTROLLER_NAME . '/index'));
        } else {
            $this->error('修改失败');
        }
    }

    /**
     * 默认删除
     */
    public function del()
    {
        $model = D(CONTROLLER_NAME);

        $pk = $model->getPk();

        $map[$pk] = I($pk);

        $del_result = $model->where($map)->delete();

        if ($del_result) {
            $this->success('删除成功', U(CONTROLLER_NAME . '/index'));
        } else {
            $this->error('删除失败');
        }
    }

    /**
     * 获取左侧菜单列表
     * @method menu
     * @return array 菜单列表
     */
    private function menu()
    {
        $node_list = session('node_list');
        $node_list = ArrayHelper::array2_filter($node_list, 'is_show', 0);
        $node_list = array_column($node_list, null, 'id');

        $list = array();
        foreach ($node_list as $_k => $_v) {
            if (intval($_v['pid']) === 0) {
                $list[$_k] = $_v;
            } else {
                $list[$_v['pid']]['child_list'][] = $_v;
            }
        }
        $list = ArrayHelper::array_number_key($list);

        return $list;
    }
}
