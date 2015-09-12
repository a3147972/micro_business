<?php
namespace Common\Model;

use Common\Model\BaseModel;

class InfoModel extends BaseModel
{
    protected $tableName = 'info';

    //自动验证
    protected $_validate = array(
        array('title', 'require', '请输入新闻标题'),
        array('desc', 'require', '请输入新闻描述'),
        array('thumb', 'require', '请上传图片缩略图'),
        array('content', 'require', '请输入新闻内容'),
    );
    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
}