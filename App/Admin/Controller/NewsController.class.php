<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;

class NewsController extends BaseController
{
    public function index()
    {
        $page = I('page', 1);
        $page_size = I('page_size', 10);
        $order = I('order', '');
        $key_id = I('key_id', '');

        $model = D('News');

        //查询值
        $pk = $model->getPk();
        $order = empty($order) ? $pk . ' desc' : $order;
        $map = method_exists($this, '_filter') ? $this->_filter() : array();

        if (!empty($key_id)) {
            $map['key_id'] = $key_id;
        }
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

    public function insert()
    {
        $model = D('News');

        if (!$model->create()) {
            $this->error($model->getError());
        }

        $insert_result = $model->add();

        if ($insert_result) {
            $this->success('新增成功', U('News/index', array('key_id' => I('key_id'))));
        } else {
            $this->error('新增失败');
        }
    }

    public function update()
    {
        $model = D();

        if (!$model->create()) {
            $this->error($model->getError());
        }

        $pk = $model->getPk();

        $map[$pk] = I($pk);
        $update_result = $model->where($map)->save();

        if ($update_result !== false) {
            $this->success('修改成功', U('News/index', array('key_id' => I('key_id'))));
        } else {
            $this->error('修改失败');
        }
    }
}
