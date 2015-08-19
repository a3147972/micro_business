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
        $upload = new Upload();
        $upload->maxSize = 3145728;
        $upload->exts = array('jpg', 'gif', 'png', 'jpeg');

        $path = './Uploads/';
        $subName = array('date', 'Ymd');

        if (!file_exists($path)) {
            mkdir($path, 0777, true);
        }
        $upload->rootPath = $path;
        $upload->subName = $subName;
        $info = $upload->upload();

        if (!$info) {
            $ajaxInfo['status'] = 0;
            $ajaxInfo['info'] = $upload->getError();
        } else {
            $keys = array_keys($info);
            $filepath = $path . $info[$keys[0]]['savepath'] . $info[$keys[0]]['savename'];
            $ajaxInfo['status'] = 1;
            $ajaxInfo['info'] = $filepath;
            $ajaxInfo['review_info'] = imgFormat($filepath);
        }
        die(json_encode($ajaxInfo));
    }
}
