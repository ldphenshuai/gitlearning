<?php
namespace app\index\controller;

use think\Controller;
use think\facade\Request;
use think\Db;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function check()
    {
    	$pwd=$_POST['pwd'];
    	$username = Request::post('username');
    	$conn = mysqli_connect('localhost','root','','pxscj');
    	$sql = "select * from users where userid='".$username."' and pwd='".$pwd."'";
        $rs=mysqli_query($conn,$sql);
        if ($rs!==false) {
        	# code...
        	if (mysqli_num_rows($rs)>0) {
        		//session_start();
        		session('username',$username);
                session('userType',"管理员");
        		echo "<script type='text/javascript'>";
        		echo "window.location='http://localhost/lab08/public/index.php/index/index/main'";
        		 echo "</script>";
        	}
        	else{
        		echo "<script type='text/javascript'>";
        		echo "alert('用户名或密码错');";
        		echo "window.location='http://localhost/lab08/public/index.php/index/index/index'";
        		echo "</script>";
        	}
        }
    }
    public function main(){
    	session_start();
    	//echo "<div style='color:red;text-align:center;font-weight:bold;'>欢迎".$_SESSION['username']."访问我们的网站</div>";

        return $this->fetch();
    }
    public function qryStu()
    {
        $sno=request()->post('sno');
        $sname=request()->post('sname');
        $sp=request()->post('sltSp');
        $rs = Db::table('xsb')->where('XH','like',"%$sno%")->where('XM','like',"%$sname%")->where('ZY','like',"%$sp%")->order('XH')->select();
        //dump($rs);
        $this->assign('sno',$sno);
        $this->assign('sname',$sname);
        $this->assign('sp',$sp);
        $this->assign('ss',$rs);
        return $this->fetch();
    }
    public function addStu(){
        
        return $this->fetch();
    }
    public function addStuInput()
    {
        $xh =Request::post('xh','','htmlspecialchars');
        $xm =Request::post('xm');
        $xb =Request::post('xb');
        $zy =Request::post('zy');
        $cssj =Request::post('cssj');
        $zxf =Request::post('zxf');
        $bz =Request::post('bz');
        
        $data = ['XH'=>$xh, 'XM'=>$xm, 'XB'=>$xb,'CSSJ'=>$cssj,'ZY'=>$zy,'ZXF'=>$zxf,'BZ'=>$bz];
        $rs = Db::name('xsb')->data($data)->insert();
        if ($rs == 1) {
            # code...
            $this->success('添加学生成功');
        }
        else{
            $this->error('添加学生失败');
        }
    }
       public function delStu()
    {
        $xh=Request::post('XH','');
        $xm=Request::post('XM','');
        
        $rs=Db::name('xsb')->where([['XH','like',"%$xh%"],['XM','like',"%$xm%"]])->select();
        //dump($rs);
        //exit;
        $this->assign('ss',$rs);
        $this->assign('xh',$xh);
        $this->assign('xm',$xm);

        return $this->fetch();
    }
    public function delStuInput()
    {
        $xh=Request::param('sno','');
        if($xh=="")
        {
            $this->error("不确定要删除哪位学生，不能删除！");
        }
        else
        {
            $rs1=Db::name('xsb')->where('XH',$xh)->delete();
            $rs2=Db::name('cjb')->where('XH',$xh)->delete();
            if($rs1!==false && $rs2!==false)
            {
                $this->success('删除学生成功！');
            }
            else
            {
                $this->error('删除学生失败！');
            }
        }
    }
     public function mdfStu()
    {
        $xh=Request::param('sno');
        if(!isset($xh) || $xh=="")
        {
            return $this->error('学号不存在！');
        }
        else
        {
            $rs=Db::name('xsb')->where('XH',$xh)->find();
            if($rs!=false)
            {
                $this->assign('stu',$rs);
                return $this->fetch();
            }
            else
            {
                return $this->error('没有要修改的学生！');
            }
        }        
    }

    //修改学生入库
    public function mdfStuInput()
    {
        $data=[];
        $data['XH']=Request::post('XH');
        $data['XM']=Request::post('XM');
        $data['XB']=Request::post('XB');
        $data['CSSJ']=Request::post('CSSJ');
        $data['ZY']=Request::post('ZY');
        $data['ZXF']=Request::post('ZXF');
        $data['BZ']=Request::post('BZ');

        $rs=Db::name('xsb')->data($data)->update();
        if($rs!==false)
        {
             return $this->success('修改学生成功！');
        }
        else
        {
            return $this->error('修改学生失败！');
        }
    }
    public function inputScore(){
        return $this->fetch();
    }
    public function addScore(){
        $xh =Request::post('xh','','htmlspecialchars');
        $cj =Request::post('cj');
        $kch =Request::post('kch');
        
        $data = ['XH'=>$xh, 'KCH'=>$kch, 'CJ'=>$cj];
        $rs = Db::name('cjb')->data($data)->insert();
        if ($rs == 1) {
            # code...
            $this->success('添加学生成绩成功');
        }
        else{
            $this->error('添加学生成绩失败');
        }
    }
    public function queryScore(){
        $sno=request()->post('sno');
        $sname=request()->post('sname');
        $kch=request()->post('kch');
        $rs = Db::table('cjb')->where('XH','=',"$sno")->where('KCH','like',"%$kch%")->order('XH')->select();
        //dump($rs);
        $this->assign('sno',$sno);
        $this->assign('sname',$sname);
        $this->assign('kch',$kch);
        $this->assign('result',$rs);
        return $this->fetch();
    }
}
?>