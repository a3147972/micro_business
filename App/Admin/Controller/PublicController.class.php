<?php
/**
 * 后台公共资源
 * @package Controller
 * @author guolei <2387813033@qq.com>
 */
namespace Admin\Controller;

use Admin\Controller\BaseController;
use Common\Tools\Upload;

class PublicController extends BaseController
{
    /**
     * 图片上传
     */
    public function UploadThumb()
    {
        $size = 3145728;
        $exts = array('jpg', 'gif', 'png', 'jpeg');
        $info = $this->upload($size, $exts);

        if (file_exists($info)) {
            $ajaxInfo['status'] = 1;
            $ajaxInfo['info'] = $info;
            $ajaxInfo['review_info'] = imgFormat($info);
        } else {
            $ajaxInfo['status'] = 0;
            $ajaxInfo['info'] = $info;
        }

        die(json_encode($ajaxInfo));
    }

    /**
     * 上传excel
     * @method UploadExcel
     */
    public function UploadExcel()
    {
        $size = 3145728;
        $exts = array('xls', 'xlsx');

        $info = $this->upload($size, $exts);

        return $info;
    }

    /**
     * 上传文件方法
     * @method upload
     * @param  integer $size 允许上传文件大小
     * @param  array   $exts 允许上传文件格式
     * @return string        文件路径
     */
    private function upload($size = 3145728, $exts = array('jpg', 'gif', 'png', 'jpeg'))
    {
        $upload = new Upload();
        $upload->maxSize = $size;
        $upload->exts = $exts;

        $path = './Uploads/';
        $subName = array('date', 'Ymd');

        if (!file_exists($path)) {
            mkdir($path, 0777, true);
        }
        $upload->rootPath = $path;
        $upload->subName = $subName;
        $info = $upload->upload();

        if (is_array($info)) {
            $keys = array_keys($info);
            $info = $path . $info[$keys[0]]['savepath'] . $info[$keys[0]]['savename'];
        }
        return $info;
    }
}
