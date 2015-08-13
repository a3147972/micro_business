<?php
/**
 * 代理商
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class AgentModel extends BaseModel
{
    protected $tableName = 'agent';

    //自动验证
    protected $_validate = array(
        array('name', 'require', '请输入代理商姓名'),
        array('mobile', 'require', '请输入代理商手机号'),
        array('id_card', 'require', '请输入代理商身份证'),
        array('wechat_number', 'require', '请输入代理商微信号'),
        array('class_id', 'require', '请选择代理商类别'),
        array('authorize_code', 'require', '请选择授权编码'),
        array('authorize_code', '', '授权编码已存在', 1, 'unique'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
}
