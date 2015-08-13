<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;
use Common\Tools\ArrayHelper;

class GroupController extends BaseController
{
    /**
     * 禁止删除默认管理组
     */
    public function _before_del()
    {
        $id = I('get.id');

        if ($id == 1) {
            $this->error('默认管理组不可被删除');
        }
    }

    /**
     * 权限管理
     */
    public function permission()
    {
        $node_list = D('Node')->lists();
        $node_list = ArrayHelper::array_tree($node_list);

        $this->assign('node_list', $node_list);
        $this->display();
    }

    /**
     * 添加组权限
     */
    public function add_permission()
    {
        $group_id = I('group_id');
        $node_id = I('node_id');

        $data['group_id'] = $group_id;
        $data['node_id'] = $node_id;

        $model = D('GroupNodeMap');

        $info = $model->_get($data);

        if ($info) {
            $this->error('此管理组已有此权限');
        }

        $insert_result = $model->data($data)->add();

        if ($insert_result) {
            $this->success('添加权限成功');
        } else {
            $this->error('添加权限失败');
        }
    }

    /**
     * 删除组权限
     */
    public function del_permission()
    {
        $group_id = intval(I('group_id'));
        $node_id = intval(I('node_id'));

        $map['group_id'] = $group_id;
        $map['node_id'] = $node_id;

        $model = D('GroupNodeNap');

        $del_result = $model->where($map)->delete();

        if ($del_result) {
            $this->success('删除组权限成功');
        } else {
            $this->error('删除组权限失败');
        }
    }
}
