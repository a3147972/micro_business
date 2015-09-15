<?php
namespace Admin\Controller;

use Admin\Controller\BaseController;

// use Common\Tools\PHPExcel\PHPExcel;

class AgentController extends BaseController
{
    public function _before_add()
    {
        $class_list = D('AgentClass')->_list();
        $this->assign('class_list', $class_list);
    }

    public function _before_edit()
    {
        $this->_before_add();
    }

    public function index()
    {
        $page = I('page', 1);
        $page_size = I('page_size', 10);
        $order = I('order', '');

        $model = D('Agent');

        //查询值
        $pk = $model->getPk();
        $order = empty($order) ? $pk . ' desc' : $order;
        $map = method_exists($this, '_filter') ? $this->_filter() : array();

        //查询数据
        $list = $model->lists($map, $order, $page, $page_size);

        $count = $model->_count($map);
        //分页处理
        $page_list = $this->page($count, $page, $page_size);

        $this->assign('page_list', $page_list);
        $this->assign('count', $count);
        $this->assign('list', $list);
        $this->display();
    }

    /**
     * 导入代理商信息
     * @method import
     */
    public function import()
    {
        $file_info = R('Public/UploadExcel');   //上传excel并返回上传路径

        if (!file_exists($file_info)) {    //上传失败则输出
            $error_info['status'] = 0;
            $error_info['info'] = $file_info;
            die(json_encode($error_info));
        }
        import('Common.Tools.PHPExcel.PHPExcel');
        $PHPExcel = new \PHPExcel();

        $PHPReader = new \PHPExcel_Reader_Excel2007();

        if (!$PHPReader->canRead($file_info)) {
            $PHPReader = new PHPExcel_Reader_Excel5();
        }
        if (!$PHPReader->canRead($file_info)) {
            $error_info['status'] = 0;
            $error_info['info'] = '无法读取文件';
            die(json_encode($error_info));
        }

        $PHPExcel = $PHPReader->load($file_info);
        $currentSheet = $PHPExcel->getSheet(0);

        $rowTotal = $currentSheet->getHighestRow(); //总行数
        $columnTotal = $currentSheet->getHighestColumn();   //总列数
        $columnTotal = \PHPExcel_Cell::columnIndexFromString($columnTotal);  //字母列转换为数字列

        $_list = array();
        for ($i = 1; $i <= $rowTotal; $i++) {
            for ($j = 0; $j <= $columnTotal; $j++) {
                $val = $currentSheet->getCellByColumnAndRow($j, $i)->getValue();
                if (!empty($val)) {
                    $_list[$i - 1][] = $val;
                }
            }
        }

        foreach ($_list as $_k => $_v) {
            $list[$_k]['name'] = $_v[0];
            $list[$_k]['mobile'] = $_v[1];
            $list[$_k]['id_card'] = $_v[2];
            $list[$_k]['wechat_number'] = $_v[3];
            $list[$_k]['class'] = $_v[4];
            $list[$_k]['authorize_code'] = $_v[5];
            $list[$_k]['ctime'] = now();
            $list[$_k]['mtime'] = now();
        }

        $result = D('Agent')->addAll($list);

        if ($result) {
            $error_info['status'] = 1;
            $error_info['info'] = '导入成功';
        } else {
            $error_info['status'] = 0;
            $error_info['info'] = '导入数据失败';
        }
        die(json_encode($error_info));
    }
}
