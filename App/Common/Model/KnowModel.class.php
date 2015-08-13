<?php
/**
 * 知识管理
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

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
}
