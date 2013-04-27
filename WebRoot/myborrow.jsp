<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id=(String) session.getAttribute("rdrid");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>我的借书列表</title>
		<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="xedit/bootstrap-editable.css">
			<link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
    <script src="js/alertify.min.js"></script>
			<style type="text/css">
			 table tr td{
			 font-size:14px;
			 }
input.span1,input.span2,input.span3{
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
div#borrowmain{
-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
		width: 80%;
		margin: 10px auto;
		height: 100%;
		background-color: #EEE9BF;
		text-align: right;
		position: relative;
}
div.alert{

	width: 76%;
	margin: 46px auto 0px auto;
}
div#borrowmain fieldset{
	width: 80%;
	margin: 5px auto;
	text-align: center;
}
div#borrowmain fieldset legend{
	color: #525252;
}
div#borrowmain table tr th{
	background-color: #8B8878;
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
								<a href="topten.action"><span class="add-on"><i
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
								<a href="queryUI.jsp"><span class="add-on"><i
										class="icon-search icon-white"></i> </span>图书搜索</a>
							</li>
							<li><a href="showNews.action"><span class="add-on"><i
									class="icon-text-height icon-white"></i> </span>新闻浏览</a>
							</li>
							<li><a href="daohang.jsp"><span class="add-on"><i
									class="icon-map-marker icon-white"></i> </span>本馆导航</a>
							</li>
							<li class="dropdown">
						
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="add-on"><i
										class="icon-user icon-white"></i> </span><%=id %>的选项</a>
								<ul class="dropdown-menu">
  <li><a tabindex="-1" href="myinfor_.action?reader.readerid=<%=id %>"><span class="add-on"><i class="icon-file"></i></span>&nbsp;&nbsp;&nbsp;个人资料</a>
  </li>
  <li class="divider"></li>
  <li><a href="#" onclick="return rexit()"><span class="add-on"><i class="icon-off"></i></span>&nbsp;&nbsp;&nbsp;退出登录</a>
  </li>
</ul>
			</li>				
		</ul>
			</div>
			</div><div class="alert alert-error">
 <b>注意！</b> 图书最好于借阅时间起算的免费天数内归还，超出按一本一天五分钱罚款……<br>
 <button type="button" data-dismiss="alert" class="btn btn-danger">接受建议</button>
  <button type="button" data-dismiss="alert" class=btn>不当回事</button>
</div>	
	<div id="borrowmain">
	
    <fieldset>
    <legend>正在借阅</legend>
    <s:if test="#request.borrowlist.size()==0">
				<h4 style="color: #F08080; font-family: 微软雅黑;">
				您尚无未归还的图书……
			</h4>
				</s:if>
				<s:else>
			<table id="user" class="table table-bordered table-striped">
			<tr class="error"><th>ISBN</th><th>图书名</th><th>借阅日期</th><th>应归还日期</th><th>操作</th></tr>
    <s:iterator value="#request.borrowlist">
    <tr class="success"><td><s:property value="bookid"/></td>
    <td><a href="book_infor.action?book.id=<s:property value='bookid'/>"><s:property value="bookname"/></a></td>
    <td><s:property value="borrow_time"/></td>
    <td><s:property value="back_time"/></td>
    <td><a href="javascript:void(0);" 
									class="btn btn-success" onclick="delay(this,'${id}','${borrow_time}')">续借</a></td>
    </tr>
     </s:iterator>
			</table>
			</s:else>
			</fieldset>
	</div>
			<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/application.js"></script>
	<script type="text/javascript">
	 function delay(){
	 	var obj=$(arguments[0]).parent().prev();
	 	$.post("delayborrow",{
	 		"borrow.id":arguments[1],
	 		"borrow.borrow_time":arguments[2]
	 	},function(data){
	 		obj.text(data);
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
