<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;

class KnowClassController extends BaseController
{
    public function _before_del()
    {
        $id = I('id');

        $map['class_id'] = $id;

        $info = D('Know')->_get($map);

        if (!empty($info)) {
            $this->error('请先删除知识相关文章后再删除');
        }
    }
}
