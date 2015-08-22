<?php
namespace Home\Controller;

use Think\Controller;

class BaseController extends Controller
{
    protected $is_mobile = 0;
    public function _initialize()
    {
        //判断是否是手机访问
        $check_platforms = is_mobile_request();

        if ($check_platforms) {
            $this->is_mobile = 1;
            C('DEFAULT_THEME', 'm');
        }
    }
}
