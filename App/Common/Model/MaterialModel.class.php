<?php
/**
 * 素材包
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class MaterialModel extends BaseModel
{
    protected $tableName = 'material';

    //自动验证
    protected $_validate = array(
        array('title', 'require', '请输入课程标题'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
}
