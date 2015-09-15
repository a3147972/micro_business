<?php
/**
 * 代理商
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;
use Common\Tools\ArrayHelper;

class AgentModel extends BaseModel
{
    protected $tableName = 'agent';

    //自动验证
    protected $_validate = array(
        array('name', 'require', '请输入代理商姓名'),
        array('mobile', 'require', '请输入代理商手机号'),
        array('id_card', 'require', '请输入代理商身份证'),
        array('wechat_number', 'require', '请输入代理商微信号'),
        array('class', 'require', '请选择代理商类别'),
        array('authorize_code', 'require', '请选择授权编码'),
        array('authorize_code', '', '授权编码已存在', 1, 'unique'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );

    /**
     * 查询代理商列表信息
     * @method lists
     * @param  array   $map       查询条件
     * @param  string  $order     排序规则
     * @param  integer $page      当前页
     * @param  integer $page_size 每页条数
     * @return array              查到的数据
     */
    public function lists($map = array(), $order = '', $page = 1, $page_size = 10)
    {
        $field = 'id,name,mobile,id_card,wechat_number,class,authorize_code,ctime';

        $list = $this->_list($map, $field, $order, $page, $page_size);

        if (empty($list)) {
            return array();
        }

        return $list;
    }
}
