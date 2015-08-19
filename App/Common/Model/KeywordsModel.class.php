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
        array('name', '', '关键词已存在', 3, 'unique'),
    );

    protected function validate_content($v)
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
}
