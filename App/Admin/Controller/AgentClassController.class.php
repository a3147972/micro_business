<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;

class AgentClassController extends BaseController
{
    public function _before_del()
    {
        $id = I('id');
        $info = D('AgentApplication')->_get();
        if (!empty($info)) {
            $this->error('请删除代理申请里相关数据后再执行删除');
        }

        $agent_info = D('Agent')->_get();

        if (!empty($agent_info)) {
            $this->error('请删除相关代理商数据后再执行删除操作');
        }
    }
}
