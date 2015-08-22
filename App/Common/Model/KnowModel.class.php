<?php
/**
 * 知识管理
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;
use Common\Tools\ArrayHelper;

class KnowModel extends BaseModel
{
    protected $tableName = 'know';

    //自动验证
    protected $_validate = array(
        array('title', 'require', '请输入标题'),
        array('content', 'require', '请输入内容'),
        array('class_id', 'require', '请选择知识分类'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );

    public function lists($map = array(), $order = '', $page = 1, $page_size = 10)
    {
        $field = 'id,class_id,title,thumb,ctime';
        $list = $this->_list($map, $field, $order);

        if (empty($list)) {
            return array();
        }

        //查询知识分类
        $class_id = array_column($list, 'class_id');

        $class_map['id'] = array('in', $class_id);
        $class_field = 'id,name,thumb';

        $class_list = D('KnowClass')->_list($class_map, $class_field);

        if (empty($class_list)) {
            return array();
        }
        ArrayHelper::ArrayKeyReplace($class_list, 'id', 'class_id');
        ArrayHelper::ArrayKeyReplace($class_list, 'name', 'class_name');
        ArrayHelper::ArrayKeyReplace($class_list, 'thumb', 'class_thumb');

        $class_list = array_column($class_list, null, 'class_id');

        //合并数据
        foreach ($list as $_k => $_v) {
            $list[$_k] = array_merge($_v, $class_list[$_v['class_id']]);
        }

        return $list;
    }
}
