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
}
