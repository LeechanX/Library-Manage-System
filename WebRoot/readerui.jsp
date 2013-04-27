<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String id = (String)session.getAttribute("rdrid");//贯穿整个Reader操作网页
 %>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
		<title>读者页面</title>
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/application.js"></script>
		<link rel="stylesheet" style="text/css" href="CSS/bootstrap.css" />
		<link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<script src="js/alertify.min.js"></script>
		<style>
		input.span3{height:30px;}
		.modal{width:400px;height:300px;}
				.rightlong{
 float: left;
 width: 150px;
}
.rightlong:focus{
 width: 230px;
}input.search-query{
height:30px;
}
ul.nav{
position:relative;
width:100%;
}
ul#yahh > li:first-child{
padding-left:60px;
}
ul.nav li.dropdown{
position:absolute;
left:70%;
}
		</style>
	</head>
	<body>
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				 
					<ul class="nav" id="yahh">
					<li><a class="brand" href="#"><span class="add-on"><i
									class="icon-home icon-white"></i> </span>
            哈工大社区图书馆
          </a></li>
							<li>
								<a href="topten.action" target="readerframe" ><span class="add-on"><i
										class="icon-align-justify icon-white"></i> </span>人气图书Top10</a>
							</li>
							<li>
								<a href="showlikelist.action?like.readerid=${sessionScope.rdrid}" target="readerframe"><span class="add-on"><i
										class="icon-shopping-cart icon-white"></i> </span>我的选书车</a>
							</li>
							<li>
								<a href="showborrowlist.action?borrow.readerid=<%=id %>" target="readerframe"><span
									class="add-on"><i class="icon-file icon-white"></i> </span>我的借书单</a>
							</li>
							<li>
								<a href="queryUI.jsp" target="readerframe"><span class="add-on"><i
										class="icon-search icon-white"></i> </span>图书搜索</a>
							</li>
							<li><a href="showNews.action" target="readerframe"><span class="add-on"><i
									class="icon-text-height icon-white"></i> </span>新闻浏览</a>
							</li>
							<li><a href="daohang.jsp" target="readerframe"><span class="add-on"><i
									class="icon-map-marker icon-white"></i> </span>本馆导航</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="add-on"><i
										class="icon-user icon-white"></i> </span><%=id %>的选项</a>
								<ul class="dropdown-menu">
  <li><a tabindex="-1" href="myinfor_.action?reader.readerid=<%=id %>" target=readerframe><span class="add-on"><i class="icon-file"></i></span>&nbsp;&nbsp;&nbsp;个人资料</a>
  </li>
  <li class="divider"></li>
  <li><a href="#" onclick="return rexit()"><span class="add-on"><i class="icon-off"></i></span>&nbsp;&nbsp;&nbsp;退出登录</a>
  </li>
</ul>
							</li>
						</ul>
				
			</div>
			<script>
			function rexit(){
	   alertify.confirm("<h4 align='center'>确认退出系统?</h4>",function (e){
	   if(e){
	      window.location.href="reader_exit.action";	      
	   }else{
	   alertify.error("<h4 class='wryh'>取消退出!</h4>");
	   }
	   });
	   return false;
	}
			</script>
			</div>
		<!-- Title Over -->
		<div class="container">
		<div class="container">
		<br/><br/>
		</div>
		
		</div>
<iframe src="queryUI.jsp" name="readerframe" width="100%" height="600px" frameborder="0" allowtransparency=tru>
		</iframe>
	</body>
</html>