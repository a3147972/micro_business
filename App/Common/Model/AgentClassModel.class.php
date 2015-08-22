<?php
/**
 * 代理类别
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class AgentClassModel extends BaseModel
{
    protected $tableName = 'agent_class';

    //自动验证
    protected $_validate = array(
        array('name', 'require', '请输入分类名称'),
        array('price', 'require', '请输入起点金额'),
        array('name', '', '分类已存在', 1, 'unique'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
}
