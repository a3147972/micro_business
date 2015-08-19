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
