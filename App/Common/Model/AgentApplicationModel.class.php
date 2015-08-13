<?php
/**
 * 代理申请
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class AgentApplicationModel extends BaseModel
{
    protected $tableName = 'agent_application';

    //自动验证
    protected $_validate = array();

    //自动完成
    protected $_auto = array();
}
