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
    protected $_validate = array(
        array('name', 'require', '请输入您的姓名'),
        array('mobile', 'require', '请输入您的手机号'),
        array('wechat_number', 'require', '请输入您的微信号'),
        array('reason', 'require', '请输入申请理由'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
}
