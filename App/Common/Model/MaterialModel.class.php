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
        array('title', 'require', '请输入素材标题'),
        array('text', 'require', '请输入素材内容'),
        array('ctime', 'require', '请选择发布时间')
    );

    //自动完成
    protected $_auto = array(
        array('mtime', 'now', 3, 'function'),
    );
}
