<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
	<head>
		<title>图书管理</title>
		<link rel="stylesheet" href="CSS/alertifycore.css">
		<link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<link rel="stylesheet" style="text/css" href="CSS/bootstrap.css" />
		<script src="js/alertify.min.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/application.js"></script>
				<script type="text/javascript" src="js/jPages.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/jPages.css">
		<style>
input[class^="span"]{
	height: 25px;
}
body{
	background-color: transparent;
	width: 97.6%;
}
div#header{
	padding-top:10px; 
	width: 100%;
	padding-left: 15px;
	padding-right: 15px;
    text-align: center;
    background-color:#E8E8E8;
    font-size: 14px;
    position: relative;
    color: #737373;
    -moz-box-shadow: 0px 0px 1px #000000;
-webkit-box-shadow: 0px 0px 1px #000000;
box-shadow: 0px 0px 1px #000000;
}
div#header b{
	font-size: 20px;
	position: absolute;
	left: 12%;
	top: 30%;
	color: #737373;
}
div#header input[type="submit"]{
	position: absolute;
	left: 80%;
	top: 20%;
}
div.holder{
	position: absolute;
	top: 90%;
}
div.main{
	width: 80%;
	height:400px;
-moz-border-radius: 7px;
-webkit-border-radius: 7px;
border-radius: 7px;
padding-top: 0px;
position: relative;
padding-left: 20px;
padding-right: 20px;
position: relative;
margin: 0px auto;
}
div.main table{
	width: 96%;
	table-layout: fixed;
	font-size: 13px;
	position: absolute;
	left: 2%;
	top: 0%;
}
div.main table thead tr{
	background-color:#faf2cc;
}
div.main table thead tr th:nth-child(1){
	width: 50px;
}
div.main table tbody tr:nth-child(odd){
	background-color: #dff0d8;
}
div.main table tbody tr:nth-child(even){
	background-color: #f2dede;
}
div.main table tr td{
	white-space: nowrap;  
    overflow: hidden;
    text-overflow: ellipsis; 
}
a#delbtn{
	position: absolute;
	left: 75%;
	top: 93%;
}
</style>
	</head>
	
	<body style="background-color:transparent">
		<div id="header">		
			
			<form name="myForm" method="post" action="bookmanagequery"><b>图书管理</b>
							ISBN
							<select name="idhead" style="width: 80px">
								<option value="">
									选择…
								</option>
								<option value="KJ">
									科技
								</option>
								<option value="WX">
									文学
								</option>
								<option value="GJ">
									工具书
								</option>
								<option value="ZZ">
									杂志
								</option>
								<option value="QT">
									其他
								</option>
							</select>
							<input type="text" name="book.id" class="span1"
								onblur="return numchar()"
								<%if (request.getParameter("book.id") != null) {%>
								value="<%=request.getParameter("book.id")%>" <%}%>>
							
							
					书名
						
							<input type="text" name="book.name" class="span2" onblur="namecheck()"
								<%if (request.getParameter("book.name") != null) {%>
								value="<%=request.getParameter("book.name")%>" <%}%> />
						
							作者
						
							<input type="text" name="book.author" class="span2"
								<%if (request.getParameter("book.author") != null) {%>
								value="<%=request.getParameter("book.author")%>" <%}%> />
							
							出版社
							<input type="text" name="book.publisher" class="span2"
								<%if (request.getParameter("book.publisher") != null) {%>
								value="<%=request.getParameter("book.publisher")%>" <%}%> />
							<input name='cx_button' type="submit"
								class="btn btn-danger" value="查询图书" />
				</form>
		</div>
		<div class="main" id="resdiv">
		<s:if test="#request.managingbooks.size()!=0">
		 <table class='table table-hover span10' id='myTable'>
		 <thead><tr><th>选择</th><th>书名</th><th>作者</th><th>出版社</th><th>操作</th></tr></thead>
		 <tbody id="movies">
		 <s:iterator value="#request.managingbooks">
	 <tr><td><input type='checkbox' value="${id}" class="checkb"/>
								</td><td class='span2'><a href="book_infor.action?book.id=${id }">
							     <s:property value="name"/>
								</a></td><td  class='span2'>
								 <s:property value="author"/>
								</td><td class='span3'>
								  <s:property value="publisher"/>
								</td>
								<td>
								<a href='toeditbook.action?book.id=${id}' class='btn btn-success' id="editbtn"><span class='add-on'><i class='icon icon-edit icon-white'></i>修改</span></a>
								</td>
		</tr>
		</s:iterator>
		</tbody>
		</table>
		<a href='#' class='btn btn-inverse' id="delbtn"><span class='add-on'><i class='icon icon-trash icon-white'></i>删除这些书</span></a>
		<div class="holder"></div>
		</s:if>
		<s:if test="#request.managingbooks.size()==0">
		没有该条件下的图书.
		</s:if>
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#delbtn").click(function(){
				var bookarray=new Array(); 
				$(".checkb").each(function(i){
					if($(this).attr("checked")){
						bookarray.push($(this).val());
					}
				});
				
				if(bookarray.length==0){
					 alertify.alert("请选择要操作的图书!");
					 return false;
				}else{
					alertify.confirm("确认删除这些书?",function(e){
						if(e){
							alertify.log("<h3>正在执行操作……</h3>");
							var tb=document.getElementById("myTable");
							var row,cell,obj;
							for(var i=tb.rows.length-1;i>0;i--){
								row=tb.rows[i];
                				cell=row.cells[0];
				                obj=cell.getElementsByTagName("input")[0];          
            				    if(obj.checked){
            				    	tb.deleteRow(i);
            				    }
                            }
                            $.ajax({
                            	url:"deletebook",
                            	type:"post",
                         	    data:{
                         	    	dellist:bookarray.join(',')
                         	    },
                            	success:function(data){
                            	alertify.success("<h3>"+data+"</h3>");
                            	}
                            });
						}else{
							alertify.error("<h3>您选择了取消!</h3>");
						}
					});
				}

			});
          
			$("div.holder").jPages({
				containerID: "movies",
				perPage :7
			});
     });
		</script>
	</body>
</html>
