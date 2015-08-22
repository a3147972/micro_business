<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class AgentApplicationController extends BaseController
{
    /**
     * 代理申请
     * @method index
     */
    public function index()
    {
        $this->display();
    }

    public function insert()
    {
        $model = D('AgentApplication');

        if (!$model->create()) {
            $this->error($model->getError());
        }
        $insert_result = $model->add();

        if ($insert_result) {
            $this->success('提交申请成功,请等待审核');
        } else {
            $this->error('提交失败');
        }
    }
}
