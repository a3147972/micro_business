<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;

class AgentApplicationController extends BaseController
{
    /**
     * 状态审核
     * @method status
     */
    public function status()
    {
        $status = I('get.status');
        $id = I('get.id');

        $map['id'] = $id;
        $map['is_approve'] = 0;
        $result = D('AgentApplication')->where($map)->setFielc('is_approve', $id);

        if ($result) {
            $this->success('操作成功');
        } else {
            $this->error('操作失败');
        }
    }
}
