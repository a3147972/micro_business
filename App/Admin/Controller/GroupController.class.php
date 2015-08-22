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
        $map['is_show'] = 1;
        $node_list = D('Node')->lists($map, 'pid asc,id asc');
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
        // dump($list);exit();

        // 查询拥有的权限
        $has_map['group_id'] = I('id');
        $has_node_list = D('GroupNodeMap')->_list($has_map, 'node_id');
        $has_node_list = array_column($has_node_list, 'node_id');

        $this->assign('node_list', $list);
        $this->assign('has_node_list', $has_node_list);
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

        $model = D('GroupNodeMap');

        $del_result = $model->where($map)->delete();

        if ($del_result) {
            $this->success('删除组权限成功');
        } else {
            $this->error('删除组权限失败');
        }
    }
}
