<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap-metro.css">
	<title>管理员入口</title>
	<style type="text/css">
	.apimg{
  opacity: 0.5;         
}
input.span3{
	height: 30px;
}
</style>
</head>
<body>
	<header class="jumbotron subhead" id="overview">
		<div class="container" style="padding-top:20px;background-color:#FFFAFA">
			<p style="font-size:23" class="apimg"><img style="filter:gray" src="Images/tag.jpg" width="64" height="64">管理员登录入口</p>
		</div>
	</header>
	<div class="container">
		<div class="row" style="clear:both">
			<div class="span8" style="float:left;padding-top:10px;padding-left:20px;padding-right:20px;">
				<h3 style="font-family:宋体;font-weight:normal;color:#f08080">图书馆管理员入口</h3>
				<p style="font-family:宋体;font-size:1">管理员登录本入口来处理本图书馆日常事务。请妥善保管您的管理员帐号，不得借给无关人士。
					<a href="index.jsp">返回主页 >></a>
				</p>
				<p>
					<a href="javascript:void(0)"><span class="add-on"><i class="icon-book"></i></span></a>
					<b>图书的管理</b>
				</p>
				<p>
					图书的日常维护，包括新增图书，删除图书和图书信息修改。
				</p>
				<p>
					<a href="javascript:void(0)"><span class="add-on"><i class="icon-user"></i></span></a>
					<b>读者的管理</b>
				</p>
				<p>
					读者信息的日常维护，包括新增读者，删除读者和读者信息修改，以及读者发送通知。
				</p>
				<p>
					<a href="javascript:void(0)"><span class="add-on"><i class="icon-file"></i></span></a>
					<b>事务的管理</b>
				</p>
				<p>
					发布新闻，借书还书事务的处理。
				</p>
			</div>
			<div class="span3" style="padding:20px;background-color:#FFFAFA">
				<form onsubmit="return check()" name="mForm" action="manager_log" method="POST" >
					<h3 style="font-family:宋体;font-weight:normal">登录</h3>
				    <p style="font-family:宋体;font-weight:bolder">账户</p>
				    <input type="text" name="manager.id" class="span3"><br/>
				    <span id="error1"></span>
				    <p style="font-family:宋体;font-weight:bolder">密码</p>
				    <input type="password" name="manager.password" class="span3"><br/>
                    <span id="error2"></span>
				    <br/>
				    <input type="submit" class="btn btn-primary" value="登录">
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function check(){
		if(document.getElementsByTagName("input")[0].value.length==0){
			document.mForm.username.style.borderColor="#F08080";
			document.getElementById("error1").innerHTML="<p style='color:#f08080'>请输入您的账户。</p>";
			return false;
		}
		document.mForm.username.style.borderColor="";
		document.getElementById("error1").innerHTML="";
		if(document.getElementsByTagName("input")[1].value.length==0){
			document.mForm.password.style.borderColor="#F08080";
			document.getElementById("error2").innerHTML="<p style='color:#f08080'>请输入您的密码。</p>";
			return false;
		}
		document.mForm.password.style.borderColor="";
		document.getElementById("error2").innerHTML="";
		return true;
	}
	</script>
</body>
</html>
