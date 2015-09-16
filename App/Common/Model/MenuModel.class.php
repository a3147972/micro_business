<?php
namespace Common\Model;

use Common\Model\BaseModel;
use Common\Tools\ArrayHelper;

class MenuModel extends BaseModel
{
    protected $tableName = 'menu';

    //自动验证
    protected $_validate = array(
        array('name', 'require', '请输入菜单名称'),
        array('type', 'require', '请选择菜单类型'),
        array('url', 'validate_url', '请输入跳转链接', 3, 'callback'),
        array('key', 'validate_key', '请输入关键词', 3, 'callback'),
    );

    /**
     * 验证输入的url
     * @param  string $v 输入的url
     * @return bool      验证成功返回true,失败返回false
     */
    protected function validate_url($v)
    {
        $type = I('type');

        if ($type == 2 && empty($v)) {
            return false;
        }
        return true;
    }

    /**
     * 验证输入的key
     * @param  string $v 输入的key
     * @return bool       成功返回true，失败返回false
     */
    protected function validate_key($v)
    {
        $type = I('type');

        if ($type == 1 && empty($v)) {
            return false;
        }
        return true;
    }

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );

    public function lists($map = array(), $order = '', $page = 0, $page_size = 10)
    {
        $field = 'id,pid,name,type,url,key,level';
        $list = $this->_list($map, $field, $order, $page, $page_size);

        if (empty($list)) {
            return array();
        }
        //查询父栏目
        $pid = array_column($list, 'pid');
        $pid = array_filter($pid);

        if (empty($pid)) {
            return $list;
        }

        $parent_map['id'] = array('in', $pid);
        $parent_field = 'id,name';
        $parent_list = $this->_list($parent_map, $parent_field);

        ArrayHelper::ArrayKeyReplace($parent_list, 'id', 'pid');
        ArrayHelper::ArrayKeyReplace($parent_list, 'name', 'parent_name');
        $parent_list = array_column($parent_list, null, 'pid');

        //合并数据
        foreach ($list as $_k => $_v) {
            if ($_v['pid'] != 0) {
                $list[$_k] = array_merge($_v, $parent_list[$_v['pid']]);
            }

        }

        return $list;
    }
}
