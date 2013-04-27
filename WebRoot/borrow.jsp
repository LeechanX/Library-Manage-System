<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<link rel="stylesheet" style="text/css" href="CSS/bootstrap.css"></link>
		 <link rel="stylesheet" href="CSS/alertifycore.css"> 
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/alertify.min.js" ></script>
		<style>
		body{
			background-color: transparent;
		}
div{
border-radius:1em 1em;
}
div.container-fluid{
height:320px
}
div.row-fluid{
height:320px
}
div.span10,div.span2,div.span9{
height:310px
}
input[class^="span"]{
	height: 25px;
}
table.span10{
height:260px
}
div#main{
	width: 100%;
	height: 500px;
	margin: 0px auto;
	padding: 0px 0px 0px 0px;
	-moz-border-radius: 4px;
-webkit-border-radius: 4px;
border-radius: 4px;
-moz-box-shadow: inset 0px 0px 4px #fff3eb;
-webkit-box-shadow: inset 0px 0px 4px #fff3eb;
box-shadow: inset 0px 0px 4px #fff3eb;
position: relative;
}
div#head{
	width: 100%;
	padding-top: 10px;
	position: relative;
color: #737373;
border-radius: 0;
-moz-box-shadow: 0px 0px 1px #000000;
-webkit-box-shadow: 0px 0px 1px #000000;
box-shadow: 0px 0px 1px #000000;
text-align: center;
}
div#head b{
	position: absolute;
	left: 10%;
	font-size: 18px;
}
input[type="submit"]{
	position: absolute;
	left: 83%;
}
	div#mains{
		width: 80%;
		margin: 0px auto;
		height: 370px;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
		background-color: #e9f1f4;
		-moz-box-shadow: 0px 0px 1px #000000;
-webkit-box-shadow: 0px 0px 1px #000000;
box-shadow: 0px 0px 1px #000000;
	}
	div#bar{
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
		border-bottom-left-radius: 0px;
		border-bottom-right-radius: 0px;
		background-color: #405a6a;
		width: 100%;
		height: 46px;
		padding-top: 1px;
		padding-bottom: 1px;
		position: relative;
	}
	div#bar h1{
		color: white;
		font-size: 23px;
		position: absolute;
		left: 20px;
		top: -2px;
		font-family: Arial;
	}
	div#bar h1 small{
		font-size: 15px;
		font-weight: normal;
	}
	div#left{
		background-color:#f1efaf; 
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
		width: 35%;
		float: left;
		margin-top: 20px;
		margin-right: 5%;
		margin-left: 10%;
		height: 280px;
		position: relative;
	}
	div#right{
		background-color: #f1efaf;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
		width: 35%;
		margin-top: 20px;
		float: left;
		margin-right: 10%;
		margin-left: 5%;
		height: 280px;
		position: relative;
	}
	button.btn{
		width: 100%;
		left: 0;
		top: 0;
		text-align: center;
		font-size: 18px;
		height: 15%;
	}
	div#right table,div#left table{
		margin-top: 20px;
		table-layout: fixed;
	}
	table tr td:nth-child(1){
		padding-left: 50px;
		font-weight: bold;
		font-size: 15px;
		color: #8B5A2B;
	}
	table tr td:nth-child(2){
		font-weight: bold;
		font-size: 15px;
		color: #6959CD;
	}
	table tr:last-child td{
		padding-top: 20px;
	}
	table tr:last-child td button{
		width: 150px;
		height: 30px;
	}
	table tr td{
white-space: nowrap;   /* 是为了保证无论单元格（TD）中文本内容有多少，都不会自动换行，此时多余的内容会在水平方向撑破单元格 */
    overflow: hidden;
    text-overflow: ellipsis;  /*将被隐藏的那部分用省略号代替*/
	}
</style>
<title>借书窗口</title>
 <link rel="stylesheet" href="CSS/bootstrapalertify.css">
<script language="javascript">
	function refresh(){
	window.location.href='borrow.jsp';
	}
 function borrowit(){
      document.getElementById("b_btn").disabled=true; 
	  $.post("borrow",{
	  "borrow.readerid":document.getElementById("readerID").value,
	  "borrow.bookid":document.getElementById("bookID").value
	  },function(){
	  alertify.alert("借书成功！");
	  });  
	}
</script>
	</head>
	<body style="background-color:transparent">
		<div id="main">
			<div id="head">			
			<form name="bForm"  method="GET" action="beginborrow">
				<b>借书窗口</b>
						读者ID
						<input type="text" name="borrow.readerid" id="readerID" class="span2" placeholder="读者ID输入……"
		     <%if(request.getParameter("borrow.readerid")!=null){%>value="<%=request.getParameter("borrow.readerid") %>"<%} %>
		    />
						
						图书ID
						<input type="text" name="borrow.bookid" id="bookID" class="span2"
		     <%if(request.getParameter("borrow.bookid")!=null){%>value="<%=request.getParameter("borrow.bookid") %>"<%} %>
		      placeholder="图书ID输入……"/>
			<input type="submit" class="btn btn-middle btn-warning" value="建立借阅" >
					</form>
			</div>
				<s:if test="#request.borrowbook!=null || #request.borrowreader!=null">
		<div id="mains">
		<div id="bar">
			<h1>借阅信息<small>列出了读者和图书信息</small>
			</h1>
		</div>
		<div id="left">
			<button class="btn">图书信息</button>
<table class="table"><tbody><tr>
					<td width="40%">书号</td><td><s:property value="#request.borrowbook.id"/></td></tr><tr>
				    <td>作者</td><td><s:property value="#request.borrowbook.author"/></td></tr><tr>
					<td>书名</td><td><s:property value="#request.borrowbook.name"/></td></tr><tr>
					<td>出版社</td><td><s:property value="#request.borrowbook.publisher"/></td></tr>
										<tr><td colspan="2">
						<button class="btn btn-primary" onclick='borrowit()' id='b_btn' >借出图书</button>
					</td></tr>
				</tbody></table>
		</div>
		<div id="right">
			<button class="btn">读者信息</button>
<table class="table">
	<tbody><tr>
					<td width="40%">姓名</td><td><s:property value="#request.borrowreader.readername"/></td></tr><tr>
					<td>类型</td><td>
					<s:property value=
  		"#conv=:[#this==1?'学生':#this==2?'教师':#this==3?'工人':#this==4?'自由职业':#this==5?'退休人员':''],#conv(#request.borrowreader.type)" />	
					</td></tr><tr>
					<td>性别</td><td><s:property value="#request.borrowreader.sex"/></td></tr><tr>
					<td>电话</td><td><s:property value="#request.borrowreader.telephone"/></td></tr>
					<tr><td colspan="2">
						<button class="btn btn-warning" onclick='refresh()'>继续借阅</button>
					</td></tr>
				</tbody></table>
		</div>
	</div>
				</s:if>
					</div>
	</body>
</html>