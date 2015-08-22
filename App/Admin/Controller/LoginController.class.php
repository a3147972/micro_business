<?php
/**
 * 后台登陆
 * @package Controller;
 * @author guolei <2387813033@qq.com>
 */
namespace Admin\Controller;

use Think\Controller;

class LoginController extends Controller
{
    public function _empty()
    {
        redirect(U('Login/login'));
    }

    public function login()
    {
        $this->display();
    }

    /**
     * 检测登陆
     *
     * @param string $username 用户名
     * @param string $password 密码
     */
    public function checkLogin()
    {
        $username = I('post.username');
        $password = I('post.password');

        if (empty($username)) {
            $this->error('请输入用户名');
        }

        if (empty($password)) {
            $this->error('请输入密码');
        }
        $model = D('Admin');

        $info = $model->getInfoByUsername($username);

        if (empty($info)) {
            $this->error('管理员不存在');
        }

        if (md5($password) != $info['password']) {
            $this->error('用户名或密码不正确');
        }
        //写入session
        session('uid', $info['id']);
        session('gid', $info['group_id']);
        session('nickname', $info['nickname']);

        //获取权限列表
        $node_list = D('Node')->getGroupNodeList($info['group_id']);

        session('node_list', $node_list);
        $this->success('登陆成功', U('Index/index'));
    }

    /**
     * 退出登录
     */
    public function logout()
    {
        session(null); //清空session
        session_regenerate_id(); //重新赋值session_id;防止会话冲突
        redirect(U('Login/login'));
    }
}
