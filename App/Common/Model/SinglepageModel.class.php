<?php
/**
 * 单页文档
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class SinglepageModel extends BaseModel
{
    protected $tableName = 'singlepage';

    //自动验证
    protected $_validate = array(
        array('title', 'require', '请输入单页标题'),
        array('content', 'require', '请输入单页内容'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
}
