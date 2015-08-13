<?php
/**
 * 组节点权限
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class GroupNodeMapModel extends BaseModel
{
    protected $tableName = 'group_node_map';

    //自动验证
    protected $_validate = array(
        array('group_id', 'require', '请选择用户组'),
        array('node_id', 'require', '请选择权限id'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
    );
}
