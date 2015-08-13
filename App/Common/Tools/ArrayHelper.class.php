<?php
namespace Common\Tools;

class ArrayHelper
{
    /**
     * 二维数组替换key
     * @param array &$array  要操作的数组
     * @param string $key     原key名
     * @param string $new_key 新key名
     */
    public static function ArrayKeyReplace(&$array, $key, $new_key)
    {
        array_walk($array, function (&$value) use ($key, $new_key) {
            $value[$new_key] = $value[$key];
            unset($value[$key]);
        });
    }

    /**
     * 无限极序列排序数据
     * 超过10级则返回错误
     * @method array_tree
     * @param  array     $data  要排序的数据
     * @param  integer    $pid   上级id
     * @param  integer    $level 层级
     * @return array            处理后的数据
     */
    public static function array_tree($data, $pid = 0, $level = 0)
    {
        if ($level >= 10) {
            return false;
        }
        static $list = array();
        foreach ($data as $_k => $_v) {
            if ($_v['pid'] == $pid) {
                $_v['_level'] = $level;
                $list[$_k] = $_v;
                unset($data[$_k]);
                self::tree($data, $_v['id'], $level + 1);
            }
        }
        return $list;
    }
}
