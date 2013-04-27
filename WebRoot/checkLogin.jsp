<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String mid=(String)session.getAttribute("mgrid");
	
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>管理员窗口</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/application.js"></script>
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<script src="js/alertify.min.js"></script>
<style>
div{
	border-radius: 0.3em;
}
div.alertify-dialog h4{
    text-align:center;
}
div#man{
	margin: 10px auto;
	width: 95%;
	background-color: #EBEBEB;
	height: 600px;
	position: relative;
}
div#head{
	position: relative;
	width: 100%;
	padding-top: 5px;
	background-color: #848484;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
	height: 40px;
}
div#head h4{
	position: absolute;
	left: 2%;
	color: #f5f5f5;
	font-family: Arial;
}
div#head h4 small{
	color: rgb(171,171,171);
}
div#menu{
	width: 100%;
	position: relative;
}
div#menu ul li ul{
	display: none;
}
div#menu ul{
	list-style-type: none;
	width: 100%;
	background-color: #F5F5DC;
	position: absolute;
	left: -25px;
	height: 30px;
}
div#menu ul li{
	float: left;
	width: 16.66%;
	padding-top: 5px;
	padding-bottom: 5px;
	position: relative;
	text-align: center;
	border-radius: 0.3em;
}
div#menu ul li:hover{
	background-color: #EEE8CD;
	cursor:default;
}
div#menu ul li a{
	color:#757575;
}
div#menu ul li a:hover{
	text-decoration: none;
	color:#4D4D4D;
}
div#menu ul li:hover ul{
	display: block;
	width: 200%;
	position: absolute;
	top:100%;
	z-index: 1;
}
div#menu ul li ul li{
	float: left;
	width: 50%;
}
div#main{
	clear: both;
	background-color: #EAEAEA;
	width: 100%;
	position: absolute;
	top: 13%;
	z-index: 0;
	height: 550px;
}
div#main iframe{
overflow: hidden;
	overflow-y: hidden;
}
</style>
</head>
<body>
	<div id="man">
		<div id="head">
			<h4>管理窗口<small>完成一切事务 图书和读者管理均包含了增删改。</small></h4>
		</div>
		<div id="menu">
			<ul>
				<li>
				<a><span class="add-on"><i class="icon icon-book"></i></span>图书管理</a>
					<ul>
					<li><a href="newBook.jsp" target="onlyframe"><span class="add-on"><i class="icon icon-plus-sign"></i></span>添加图书</a></li>
					<li><a href="mgr_book.jsp" target="onlyframe"><span class="add-on"><i class="icon icon-retweet"></i></span>删改图书</a></li>
					</ul>
				</li>
				<li>
				<a><span class="add-on"><i class="icon icon-user"></i></span>读者管理</a>
					<ul>
					<li><a href="newReader.jsp" target="onlyframe"><span class="add-on"><i class="icon icon-plus"></i></span>添加读者</a></li>
					<li><a href="mgr_reader.jsp" target="onlyframe"><span class="add-on"><i class="icon icon-edit"></i></span>删改读者</a></li>
					</ul>
				</li>
				<li>
					<a href="borrow.jsp" target="onlyframe"><span class="add-on"><i class="icon icon-arrow-right"></i></span>借书管理</a>
				</li>
				<li>
					<a href="back.jsp" target="onlyframe"><span class="add-on"><i class="icon icon-arrow-left"></i></span>还书管理</a>
				</li>
				<li>
					<a href="releasenews.jsp" target="onlyframe"><span class="add-on"><i class="icon icon-text-height"></i></span>新闻发布</a>
				</li>
				<li><a onclick="return conf()"><span class="add-on"><i class="icon icon-off"></i></span>退出系统</a>
				</li>
			</ul>
		</div>
		<div id="main">
			<iframe src="newBook.jsp" frameborder="no" allowtransparency=true
			width="100%" height="93%" name="onlyframe" 
			></iframe>
		</div>
	</div>
	<script>
	$('#myModal').modal( {
		backdrop : true,
		keyboard : false,
		show : true
	});
	function conf(){
	   alertify.confirm("<h4>确认退出系统?</h4>",function (e){
	   if(e){
	    window.location.href="mgr_exit.action";
	   }else{
	   alertify.error("<h3>取消退出!</h3>");
	   }
	   });
	   return false;
	}
</script>
</body>
</html>
		