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
        array('province', 'validate_province', '请选择省份', 1, 'callback'),
        array('city', 'validate_city', '请选择市区', 1, 'callback'),
        array('county', 'validate_county', '请选择县/区', 1, 'callback'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );

    protected function validate_province($v)
    {
        if ($v == '省份') {
            return false;
        }
        return true;
    }
    protected function validate_city($v)
    {
        if ($v == '地级市') {
            return false;
        }
        return true;
    }
    protected function validate_county($v)
    {
        if ($v == '市、县级市') {
            return false;
        }
        return true;
    }
}
