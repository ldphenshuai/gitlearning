<?php
/**
 * 
 * @authors Your Name (you@example.org)
 * @date    2020-05-26 16:11:02
 * @version $Id$
 */

namespace app\index\controller;
use think\Controller;
use think\facade\Request;
use think\Db;

class User extends Controller {

	public function add()
	{
	return $this->fetch();
	}

	//用户入库

	public function userInput(){
		$data = [];
		$data['userid'] = Request::post('userid');
		$rs = Db::name('users')->where('userid',$data['userid'])->select();
		if (count($rs)>0) {
			# code...
			$this->error('用户名已存在，请使用其他用户名');
		}
		$data['pwd'] = Request::post('pwd');
		$data['xm'] = Request::post('xm');
		$data['usertype'] = Request::post('usertype');
		$file = Request::file('photo');
		$info = $file->validate(['ext'=>'jpg,png,gif,jpeg'])->move("../upload",$data['userid']);
		if ($info) {
			# code...
			$path = "../upload/".$info->getSaveName();	
			$handle = fopen($path,"r");
			$data['photo'] = addslashes(fread($handle,filesize($path)));
			$rs = Db::name('users')->data($data)->insert();
			if ($rs != false) {
					# code...
				$this->success('添加用户成功');
				}
				else{
					$this->error('添加用户失败');
				}	
		}
		else{
			echo $this->error('上传照片失败');
		}
	}
	public function mdf()
	{
		return $this->fetch();
	}

	public function searchUser()
	{
		$userid=Request::post('userid');
		$rs=Db::name('users')->where('userid',$userid)->find();
		if($rs===false || count($rs)==0)
		{
			$this->error('没有查找到您要修改的用户！');
		}
		else
		{
			$this->assign('user',$rs);
			return $this->fetch();
		}
	}
}
