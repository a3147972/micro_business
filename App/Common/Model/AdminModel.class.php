<?php
/**
 * 管理员
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;
use Common\Tools\ArrayHelper;

class AdminModel extends BaseModel
{
    protected $tableName = 'admin';

    //自动验证
    protected $_validate = array(
        array('group_id', 'require', '请选择管理组'),
        array('username', 'require', '请输入用户名'),
        array('password', 'require', '请输入密码'),
        array('username', '', '用户名已存在', 1, 'unique'),
        array('password', '6,16', '密码最短6位，最长16位', 'length'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );
    /**
     * 根据Username查询管理员信息
     * @param  string $username 用户名
     * @return array           查询出的数据
     */
    public function getInfoByUsername($username)
    {
        $map['username'] = $username;

        return $this->get($map);
    }

    /**
     * 根据Id查询管理员信息
     * @param  int $id      管理员id
     * @return array        查询数据
     */
    public function getInfoById($id)
    {
        $map['id'] = $id;

        return $this->get($map);
    }

    /**
     * 获取管理员列表
     * @param  array   $map       查询条件
     * @param  string  $order     排序规则
     * @param  integer $page      页数
     * @param  integer $page_size 每页条数
     * @return array              查询出的数据
     */
    public function lists($map = array(), $order = '', $page = 1, $page_size = 10)
    {
        //获取管理员列表
        $field = 'id,group_id,username,password,nickname,ctime';

        $list = $this->_list($map, $field, $order, $page, $page_size);

        if (empty($list)) {
            return array();
        }

        //获取组列表
        $group_id = array_column($list, 'group_id');
        $group_map['id'] = array('in', $group_id);

        $group_list = D('Group')->lists($group_map);
        $group_list = ArrayHelper::ArrayKeyReplace($group_list, 'id', 'group_id');
        $group_list = array_column($group_list, null, 'group_id');

        //合并数据
        foreach ($list as $_k => $_v) {
            $list[$_k] = array_merge($_v, $group_list[$_v['group_id']]);
        }

        return $list;
    }

    /**
     * 查询单个管理员数组
     * @param  array  $map   查询条件
     * @param  string $order 排序规则
     * @return array         查询出的数据
     */
    public function get($map = array(), $order = '')
    {
        $field = 'id,group_id,username,password,nickname,ctime';

        $info = $this->_get($map, $field, $order);

        return $info;
    }
}
