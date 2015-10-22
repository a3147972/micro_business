<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class AgentController extends BaseController
{
    /**
     * 授权查询结果页
     * @method result
     */
    public function result()
    {
        $k = I('k');

        $map['name|mobile|wechat_number|authorize_code'] = array('like', '%' . $k . '%');

        $list = D('Agent')->lists($map, 'id desc');
        $this->assign('list', $list);
        $this->assign('header_title', '授权查询');
        $this->display();
    }

    public function search()
    {
        $this->display();
    }
}
