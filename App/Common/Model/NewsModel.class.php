<?php
namespace Common\Model;

use Common\Model\BaseModel;
use Common\Tools\ArrayHelper;

class NewsModel extends BaseModel
{
    protected $tableName = 'news';

    //自动验证
    protected $_validate = array(
        array('title', 'require', '请输入图文标题'),
        array('desc', 'require', '请输入图文描述'),
        array('pic', 'require', '请上传图片缩略图'),
        array('url', 'require', '请输入图文跳转地址'),
    );
    //自动完成
    protected $_auto = array(
        array('ctime', 'now', 1, 'function'),
        array('mtime', 'now', 3, 'function'),
    );

    public function lists($map = array(), $order = '', $page = 1, $page_size = 10)
    {
        $field = 'id,key_id,title,desc,pic,url,ctime';
        $list = $this->_list($map, $field, $order, $page, $page_size);

        if (empty($list)) {
            return array();
        }
        //查询关键词
        $key_id = array_column($list, 'key_id');
        $key_map['id'] = array('in', $key_id);
        $key_field = 'id,name';

        $key_list = D('Keywords')->_list($key_map, $key_field);
        ArrayHelper::ArrayKeyReplace($key_list, 'id', 'key_id');
        ArrayHelper::ArrayKeyReplace($key_list, 'name', 'key_name');
        $key_list = array_column($key_list, null, 'key_id');

        //合并数据
        foreach ($list as $_k => $_v) {
            $list[$_k] = array_merge($_v, $key_list[$_v['key_id']]);
        }
        return $list;
    }
}
