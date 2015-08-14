<?php
namespace Admin\Model;

use Admin\Model\BaseModel;

class NewsModel extends BaseModel
{
    protected $tableName = 'news';

    //自动验证
    protected $_validate = array(
        array('title', 'require', '请输入图文标题'),
        array('desc', 'require', '请输入图文描述'),
        array('pic', 'require', '请上传图片缩略图'),
        array('url', 'require', '请输入图文跳转地址'),
    );
    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function')
    );
}
