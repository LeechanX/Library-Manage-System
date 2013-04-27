<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			String id = (String)session.getAttribute("rdrid");
%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="CSS/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
    <script src="js/alertify.min.js"></script>
	<head>
		<title>砍工大图书馆借阅系统</title>
		<style>
		.modal{
		width:400px;
		}
		.rightlong{
 float: left;
 width: 150px;
}
.rightlong:focus{
 width: 230px;
}
input.span1,input.span2,input.span3{
height:30px;
}
input.span2{
	width: 160px;
}
input.search-query{
height:30px;
}
div.login{
background-color: rgba(0,0,0,.6);
z-index: 100;
width: 200px;
border-radius:0.5em;
height: 130px;
display:none;
position:absolute;
left:0%;
top:115%;
padding:10px 0px 0px 20px;
}
ul.nav{
position:relative;
width:100%;
}
ul#yahh > li:first-child{
padding-left:60px;
}
ul.nav > li.dropdown{
position:relative;
margin-left:50px;
}
div#mainly{
margin-top:45px;
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
								<a href="showlikelist.action?like.readerid=${sessionScope.rdrid}"><span class="add-on"><i
										class="icon-shopping-cart icon-white"></i> </span>我的选书车</a>
							</li>
							<li>
								<a href="showborrowlist.action?borrow.readerid=<%=id %>"><span
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
							<%if(id==null || id.equals("")){
							%>
			<input type="submit" class="btn btn-danger" id="readerlogin" value="登录/注册">
							<%
							}else{%>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="add-on"><i
										class="icon-user icon-white"></i> </span><%=id %>的选项</a>
								<ul class="dropdown-menu">
  <li><a tabindex="-1" href="myinfor_.action?reader.readerid=<%=id %>" target=readerframe><span class="add-on"><i class="icon-file"></i></span>&nbsp;&nbsp;&nbsp;个人资料</a>
  </li>
  <li class="divider"></li>
  <li><a href="#" onclick="return rexit()"><span class="add-on"><i class="icon-off"></i></span>&nbsp;&nbsp;&nbsp;退出登录</a>
  </li>
</ul>
							<%							
							} %>
								<div class="login">
		<form method="POST" action="reader_login" name="rdrForm">
				<input type="text" name="reader.readerid" class="span2" placeholder="输入用户名"><br>
				<input type="password" name="reader.password" class="span2" placeholder="输入密码"><br>
				<input type="submit" class="btn btn-primary"value="登录">
				 <a class="btn" id="signup" href="newReader.jsp">注册</a>
			</form>
			</div>
			</li>				
		</ul>
			</div>
			</div>
     <div id="mainly">
    <iframe src="mainUI.jsp" name="readerframe" width="100%" height="600px" frameborder="0" allowtransparency=tru></iframe>
     </div>
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/application.js"></script>
		<script>
		$(document).ready(function(){
		$("#readerlogin").click(function(){
		$("div.login").toggle(100);
		});
		$("ul#mylead li").click(function(){
		$(this).addClass("active");
		$(this).prevAll().removeClass("active");
		$(this).nextAll().removeClass("active");
        $("div#lhead").hide(1000);
		});
		$("a#signup").click(function(){
			$("div#lhead").hide(1000);
		});
  		});
		</script>
		<script language="javascript">
	function rdr_checkin(){
	   var id=document.rdrForm.username.value;
	   var pwd=document.rdrForm.password.value;
	   if(id==""){
	      document.rdrForm.username.style.borderColor="#F08080";
	      document.rdrForm.username.focus();
	      return false;
	   }
	   document.rdrForm.username.style.borderColor="";
	   if(pwd==""){
	      document.rdrForm.password.style.borderColor="#F08080";
	      document.rdrForm.password.focus();
	      return false;   
	   }
	   document.rdrForm.password.style.borderColor="";
	   return true;
	}
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
	</body>
</html>