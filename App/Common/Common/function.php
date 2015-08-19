<?php
//获取当前时间，格式年-月-日 时:分:秒
function now()
{
    return date('Y-m-d H:i:s', time());
}

function imgFormat($path)
{
    $path = file_exists($path) ? __ROOT__ . '/' . ltrim($path, '.') : __ROOT__ . '/Public/assets/img/no-images.png';

    return $path;
}
//兼容array_column
if (!function_exists('array_column')) {
    function array_column(array $array, $column_key, $index_key = null)
    {
        $result = array();
        foreach ($array as $arr) {
            if (!is_array($arr)) {
                continue;
            }

            if (is_null($column_key)) {
                $value = $arr;
            } else {
                $value = $arr[$column_key];
            }

            if (!is_null($index_key)) {
                $key = $arr[$index_key];
                $result[$key] = $value;
            } else {
                $result[] = $value;
            }
        }
        return $result;
    }
}
