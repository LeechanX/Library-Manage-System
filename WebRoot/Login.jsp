<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
	<style type="text/css">
	div#login{
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
		width: 50%;
		margin: 100px auto;
		height: 360px;
		background-color: #EEE9BF;
		text-align: right;
		position: relative;
	}
	input.span3{
		height: 30px;
	}
	label{
		font-size: 18px;
	}
	form{
		position: absolute;
		left: 23%;
		top: 45%;
	}
	form h4{
		position: absolute;
		left: 40%;
		top: -45%;
	}
	img{
		position: absolute;
		left: 35%;
		top: -10%;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
	}
	</style>
  </head>
  
  <body>
  <div id="login">
		<form action="jumplogin"><h4>读者入口</h4>
			<label for="reader.readerid">用户ID:
				<input class="span3" name="reader.readerid" type="text"/>
			</label>
			<label for="reader.password">用户密码:
				<input class="span3" name="reader.password" type="password" />
			</label>
			<button class="btn btn-large btn-danger"><span class="add-on"><i class="icon-user icon-white"></i></span>登录</button>
		</form>
		<img src="Images/tag.jpg" width="170px" height="170px">
	</div>
  </body>
</html>
