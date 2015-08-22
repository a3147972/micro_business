<?php
/**
 * 课程管理
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class LessonModel extends BaseModel
{
    protected $tableName = 'lesson';

    //自动验证
    protected $_validate = array(
        array('title', 'require', '请输入课程标题'),
        array('start_time', 'require', '请输入课程开始时间'),
        array('speaker', 'require', '请输入演讲人'),
        array('type', 'require', '请输入演讲类型'),
        array('desc', 'require', '请输入课程描述'),
    );

    //自动完成
    protected $_auto = array(
        array('status', '0', 1, 'string'),
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
}
