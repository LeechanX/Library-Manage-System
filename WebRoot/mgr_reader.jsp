<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,entity.Reader" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
	<head>
		<title>读者管理窗口</title>
		<link rel="stylesheet" href="CSS/alertifycore.css">
		<link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<link rel="stylesheet" style="text/css" href="CSS/bootstrap.css" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<script src="js/alertify.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/application.js"></script>
	<script type="text/javascript" src="js/jPages.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/jPages.css">
<style>
body{
	background-color: transparent;
}
input.span3 {
	width: 180px;
	height: 25px;
}
div#searchdiv{
	padding-top: 10px;
	text-align: center;
-moz-box-shadow: 0px 0px 1px #000000;
-webkit-box-shadow: 0px 0px 1px #000000;
box-shadow: 0px 0px 1px #000000;
color:  #737373;
position: relative;
}
div#searchdiv b{
	position: absolute;
	left: 14%;
	top: 20%;
	font-size: 20px;
	color:  #737373;
}
div#searchdiv input[type="submit"]{
	position: absolute;
	left: 80%;
	top: 20%;
}
div#resdiv{
	-moz-border-radius: 6px;
-webkit-border-radius: 6px;
border-radius: 6px;
padding-left: 10px;
padding-right: 10px;
width: 75%;
margin: 0px auto;
}
div#resdiv table thead tr{
	background-color:#F08080;
}
div#resdiv table tbody tr:nth-child(4n){
	background-color:#fcf8e3;
}
div#resdiv table tbody tr:nth-child(4n+1){
	background-color:#d9edf7;
}
div#resdiv table tbody tr:nth-child(4n+2){
	background-color:#f2dede;
}
div#resdiv table tbody tr:nth-child(4n+3){
	background-color:#dff0d8;
}
</style>
	</head>
	
	<script type="text/javascript">
   function readerthing(rid){//insert to my car
   $.post("delete_reader",{
   "reader.readerid":rid
   },function(data){alertify.alert(data);});
   }
	</script>
	<script language="javascript">
	function delIndex(obj,rid){
	    alertify.confirm("<h3 class='wryh'>确认删除读者?</h3>ENTER和ESC键可表示确认或取消", function (e) {
				if (e) {				
					alertify.success("<h4 class='wryh'>您选择了‘确认删除’操作!</h4>");
					readerthing(rid);
				    var rowIndex = obj.parentNode.parentNode.rowIndex;//获得行下标
        var tb = document.getElementById("rtab");
        tb.deleteRow(rowIndex);//删除当前行  
				} else { alertify.error("<h4 class='wryh'>您选择了‘取消’操作!</h4>");
				}
			}); 
			return false;
	}
</script>
	<body style="background-color:transparent">
		<div id="searchdiv">		
		<form name="myForm" method="post" action="query_reader">
		<b>读者管理</b>
		读者ID
		<input type="text" name="reader.readerid" class="span3" onblur="return check()"
							<%if(request.getParameter("reader.readerid")!=null){%>value="<%=request.getParameter("reader.readerid")%>"<%}%>>
							姓名
		<input type="text" name="reader.readername" class="span3"
							 <%if(request.getParameter("reader.readername")!=null){
							 String name1=request.getParameter("reader.readername");
                      byte a[]=name1.getBytes("ISO-8859-1");
                      name1=new String(a);
							%>value="<%=name1%>"<%}%>/>
		
		<input type="submit" class="btn btn-success" value="查询读者"/>
		</form>
		</div>
         <div id="resdiv">
				<s:if test="#request.readers.size()==0">
				<h5>没有结果，重新搜索吧……</h5>
				</s:if>
				<s:if test="#request.readers.size()!=0">
				<table class='table table-hover' id='rtab'>
					<thead>
				<tr><th>读者ID</th><th>姓名</th><th>性别</th><th>电话</th><th>删除</th><th>修改</th></tr></thead>
				<tbody id="movies">
	<s:iterator value="#request.readers">
				<tr>
  				<td><s:property value="readerid" /></td>
  			<td><s:property value="readername" /></td>
  			<td><s:property value="sex" /></td>
  			<td><s:property value="telephone" /></td>
  			<td><a href='javascript:void(0)' onclick="delIndex(this,'${readerid }')" class='btn btn-inverse'><span class='add-on'><i class='icon icon-trash icon-white'></i></span></a></td>
  			<td><a href="myinfor_man.action?reader.readerid=${readerid }" class='btn btn-info'><span class='add-on'><i class='icon icon-pencil icon-white'></i></span></a></td>	
  			</tr>
				</s:iterator></tbody>
				</table>
				<div class="holder"></div>
				</s:if>
				</div>
<script type="text/javascript">
	$("div.holder").jPages({
				containerID: "movies",
				perPage : 8
			});
</script>

	</body>
</html>
