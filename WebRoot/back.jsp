<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
	<head>
		<title>归还图书</title>
         <link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/application.js"></script>
		<script src="js/alertify.min.js"></script>
				<style>
body{
	background-color: transparent;
}
input[class^="span"]{
height:25px;
}
div#main{
width:100%;
margin: 0px auto;
	position: relative;
	padding-top: 0px;
	-moz-border-radius: 8px;
-webkit-border-radius: 8px;
border-radius: 8px;
background-color: transparent;
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
	left: 12%;
	font-size: 20px;
}
div#head button{
	position: absolute;
	left: 73%;
}
input#readerID{
	margin-right: 30px;
}
div#res{
	height: 500px;
	padding: 0px;
	width: 98%;
	height: 300px;
	background-color: transparent;
	border-radius: 0;
	position: relative;
}
div#res table{
	width: 80%;
	margin: 0px auto;
	font-size: 12px;
}
div#res table caption{
	margin-bottom: 10px;
}
div#res table tr:nth-child(2n){
	background-color: #F0F8FF;
}
div#res table tr:nth-child(2n+1){
	background-color: #EEEEE0;
}
div#res table tr:nth-child(1){
	background-color: #EEE8CD;
}
div#res table tr td{
	padding: 5px 10px 5px 10px;
	vertical-align:baseline;
	color: rgb(0,120,34);
}
</style>
	</head>
	<body style="background-color:transparent">
		<div id="main"><form name="myForm" action="queryback">
			<div id="head">
				<b>还书窗口</b>
									<input type="text" name="borrow.readerid" class="span4"
										onblur="return check()" id="readerID"
									<%if(request.getParameter("borrow.readerid")!=null){%>value="<%=request.getParameter("borrow.readerid")%>"<%}%>	/>
											<i id="warning"></i>
								
									<button type="submit" id="fat-btn"
										class="btn btn-danger" id="textid" onclick="ready()">
										列出读者所有在借图书
									</button>		
				</div></form>
						<div id="res">
							<s:if test="#request.borrowedbooks.size()==0">
				<h5>没有结果，重新搜索吧……</h5>
				</s:if>
				<s:if test="#request.borrowedbooks.size()!=0">
				<table id='btab' class='table table-hover'>
					<caption>读者借书单</caption>
					<tr><th>ISBN</th><th>书名</th><th>借书日期</th><th>应归还日</th><th>归还</th>
					</tr>
					<s:iterator value="#request.borrowedbooks">
					<tr><td><s:property value="bookid" /></td>
						<td><s:property value="bookname" /></td>
						<td><s:property value="borrow_time"/></td>
						<td><s:property value="back_time"/></td>
						<td>
							<button onclick="delIndex(this,'${id}')" class='btn'>归还</button>
						</td>
					</tr>
				</s:iterator>
				</table>
			</s:if>
						</div>
					</div>
	
		<script language="javascript">
	function check(){
	   var rid=document.myForm.text.value;
	   if(rid==""){
	           document.myForm.text.style.borderColor="#FA8072";
	   document.myForm.text.style.backgroundColor="#FAEBD7";
	   document.getElementById("warning").innerHTML="<p class='lcxred'>请输入读者ID!</p>";
	   document.myForm.text.focus();
	   return false;
	   }
	   document.myForm.text.style.borderColor="";
	   document.myForm.text.style.backgroundColor="";
	   document.getElementById("warning").innerHTML="";
	   return true;
	}
	function ready(){
	if(check()){
	createTable();
	}
	}
	function delIndex(obj,bukid){
	alertify.confirm("<h3>确认归还图书?</h3>ENTER和ESC键可表示确认或取消", function (e) {
				if (e) {				
					alertify.success("<h4>您选择了‘确认归还’操作!</h4>");
				    backit(bukid);
	                 var rowIndex=obj.parentNode.parentNode.rowIndex;
	                 var tb=document.getElementById("btab");
	                 tb.deleteRow(rowIndex);  
				} else { alertify.error("<h4>您选择了‘取消’操作!</h4>");
				}
			}); 
			return false;
	}
	
   function backit(bukid){//insert to my car
   	$.post("bookback",{"borrow.id":bukid},
    function(data) {
       alertify.alert(data);
    });
  }
	</script>
	</body>
</html>
