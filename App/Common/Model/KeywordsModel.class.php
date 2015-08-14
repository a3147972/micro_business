<?php
namespace Common\Model;

use Common\Model\BaseModel;

class KeywordsModel extends BaseModel
{
    protected $tableName = 'keywords';

    //自动验证
    protected $_validate = array(
        array('name', 'require', '请输入关键词'),
        array('type', 'require', '请选择回复的类型'),
        array('content', 'validate_content', '请输入文本消息', 3, 'callback'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
}
