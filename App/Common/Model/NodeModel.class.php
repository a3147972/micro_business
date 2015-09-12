<?php
/**
 * 后台节点权限
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class NodeModel extends BaseModel
{
    protected $tableName = 'node';

    /**
     * 获取节点列表
     * @param  array  $map   查询条件
     * @param  string $order 排序规则
     * @return array         节点数据
     */
    public function lists($map = array(), $order = 'sort desc,id desc')
    {
        $field = 'id,pid,name,node,is_show';
        $list = $this->_list($map, $field, $order, 0);

        return $list;
    }

    /**
     * 获取组拥有的权限
     * @param  int $group_id 组id
     * @return array         权限列表
     */
    public function getGroupNodeList($group_id)
    {
        if ($group_id == 1) {
            //超级管理员返回所有节点
            $list = $this->lists(array(), 'pid asc,sort desc,id asc');

            return $list;
        }
        $map['group_id'] = $group_id;
        $node_list = D('GroupNodeMap')->_list($map, 'node_id');

        if (empty($node_list)) {
            return array();
        }
        $node_list = array_column($node_list, 'node_id');
        $where['id'] = array('in', $node_list);

        $list = $this->lists($where, 'id asc');

        return $list;
    }
}
