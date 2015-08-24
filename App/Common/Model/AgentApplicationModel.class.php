<?php
/**
 * 代理申请
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;
use Common\Tools\ArrayHelper;

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
        if (trim($v) == '省份') {
            return false;
        }
        return true;
    }
    protected function validate_city($v)
    {
        if (trim($v) == '地级市') {
            return false;
        }
        return true;
    }
    protected function validate_county($v)
    {
        if (trim($v) == '市、县级市') {
            return false;
        }
        return true;
    }

    public function lists($map = array(), $order = '', $page = 1, $page_size = 10)
    {
        $field = 'id,class_id,name,mobile,wechat_number,recommend,work_date,month_sale,brand,reason,province,city,source,is_approve';
        $list = $this->_list($map, $field, $order, $page, $page_size);

        if (empty($list)) {
            return array();
        }

        //查询代理分类
        $class_id = array_column($list, 'class_id');
        $class_map['id'] = array('in', $class_id);
        $class_field = 'id,name,price';

        $class_list = D('AgentClass')->_list($class_map, $class_field);
        ArrayHelper::ArrayKeyReplace($class_list, 'id', 'class_id');
        ArrayHelper::ArrayKeyReplace($class_list, 'name', 'class_name');
        $class_list = array_column($class_list, null, 'class_id');
        foreach ($list as $_k => $_v) {
            $list[$_k] = array_merge($_v, $class_list[$_v['class_id']]);
        }

        return $list;
    }
}
