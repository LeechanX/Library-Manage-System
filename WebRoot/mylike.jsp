<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id=(String) session.getAttribute("rdrid");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>我喜欢的书</title>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" style="text/css" href="CSS/bootstrap.css"/>
		<link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<script src="js/alertify.min.js"></script>
		<script src="js/jquery.js"></script>
		<style>
input.span1,input.span2,input.span3{
height:30px;
}
input.span2{
	width: 160px;
}
input.search-query{
height:30px;
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
div#likemain{
-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
		width: 80%;
		margin: 50px auto;
		height: 90%;
		background-color: #EEE9BF;
		text-align: right;
		position: relative;
}
div#likemain fieldset{
   width:80%;
   margin:20px auto;
   position: relative;
   text-align: center;
}
div#likemain fieldset legend{
	color: #CD3333;
}
div#likemain fieldset table{
	font-size: 15px;
	width:90%;
	margin: 0px auto;
}
div#likemain fieldset table tr td,div#likemain fieldset table tr th{
	text-align: center;
}
div#likemain fieldset table tr:nth-child(2n) td{
	background-color: #F8F8FF;
}
div#likemain fieldset table tr:nth-child(2n+1) td{
	background-color: #FAFAD2;
}
div#likemain fieldset table thead  tr:nth-child(1) td{
	background-color: #E0E0E0;
}
div#likemain table tr th{
	background-color: #CDC0B0;
	color: white;
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
			</div>
<div id="likemain">
<fieldset>
<legend>我喜欢的书</legend>
<s:if test="#request.likelist.size()!=0">
<table id="ctab" class="table table-bordered table-striped">
<tr><th>ISBN</th><th>书名</th><th>作者</th><th>操作</th></tr>
<s:iterator value="#request.likelist">
<tr class="info"><td>${bookid}</td><td><a href="book_infor.action?book.id=${bookid}">${bookname}</a></td>
<td>${author}</td><td>
<a href="javascript:void(0);" class="btn" onclick="cancellike(this,'${tableid}')">不再喜欢</a></td>
</tr>
</s:iterator>
</table>
</s:if>
<s:else>
你还没有喜欢的书.
</s:else>
</fieldset></div>
<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/application.js"></script>
<script type="text/javascript">
	function cancellike (obj,tableid) {
		$.post("deletelike",{
			"like.tableid":tableid
		},function(){  
		var tav=obj.parentNode.parentNode;
		tav.remove();
		});
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
