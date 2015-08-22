<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;

class LessonController extends BaseController
{
    /**
     * 状态更改
     * @method status
     * @param int $id 主键id
     * @param int $status 状态
     */
    public function status()
    {
        $id = I('id');
        $status = I('status');

        $map['id'] = $id;
        $map['status'] = array('neq', -1);

        $result = D('Lesson')->where($map)->setField('status', $status);

        if ($result) {
            $this->success('更改状态成功');
        } else {
            $this->error('更改状态失败');
        }
    }
}
