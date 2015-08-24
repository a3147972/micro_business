<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;

class AgentApplicationController extends BaseController
{
    public function index()
    {
        $page = I('page', 1);
        $page_size = I('page_size', 10);
        $order = I('order', '');

        $model = D('AgentApplication');

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

    /**
     * 状态审核
     * @method status
     */
    public function status()
    {
        $status = I('get.status');
        $id = I('get.id');

        $map['id'] = $id;
        $map['is_approve'] = 0;
        $result = D('AgentApplication')->where($map)->setFielc('is_approve', $id);

        if ($result) {
            $this->success('操作成功');
        } else {
            $this->error('操作失败');
        }
    }
}
