<?php
/**
 * 管理组
 * @package Model
 * @author guolei <2387813033@qq.com>
 */
namespace Common\Model;

use Common\Model\BaseModel;

class GroupModel extends BaseModel
{
    protected $tableName = 'group';

    //自动验证
    protected $_validate = array(
        array('name', 'require', '请输入管理组名称'),
    );

    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );

    /**
     * 查询组列表
     * @param  array $map       查询条件
     * @param  string $order    排序规则
     * @param  int $page        页数
     * @param  int $page_size   每页条数
     * @return array            查询出的数据
     */
    public function lists($map = array(), $order = '', $page = 0, $page_size = 10)
    {
        $field = 'id,name';

        $list = $this->_list($map, $field, $order, $page, $page_size);

        return $list;
    }

    /**
     * 查询管理组单条数据
     * @param  array $map    查询条件
     * @param  string $order 排序规则
     * @return array         查询出的数据
     */
    public function get($map = array(), $order = '')
    {
        $field = 'id,name,ctime';

        $info = $this->_get($map, $order);

        return $info;
    }
}
