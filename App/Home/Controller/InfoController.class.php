<?php
namespace Home\Controller;

use Home\Controller\BaseController;

class InfoController extends BaseController
{
    /**
     * 新闻中心列表页
     * @method index
     */
    public function index()
    {
        $list = D('Info')->_list();
        $this->assign('list', $list);
        $this->display();
    }

    /**
     * 新闻中心内容页
     * @method content
     * @return [type]  [description]
     */
    public function content()
    {
        $id = I('get.id');

        $map['id'] = $id;
        $info = D('Info')->_get($map);

        $this->assign('vo', $info);
        $this->display();
    }
}