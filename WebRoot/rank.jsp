<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <link rel="stylesheet" href="CSS/bootstrap.css" type="text/css" />
    <style>
.ellipsis{overflow:hidden;white-space:nowrap;text-overflow:ellipsis;}
    </style>
    <title>最受喜爱图书排行榜</title> 
     <script type="text/javascript" src="js/jquery.js"></script>
  </head>
  <style>
  		div#main{
		-moz-border-radius: 8px;
-webkit-border-radius: 8px;
border-radius: 8px;
		width:90%;
		margin:0px auto;
		background-color:#F5F5DC;
		height:600px;
		padding-left:30px;
		position:relative;
		}
		table{
		font-size:14px;
		}
  </style>
  <body>
  <div id="main">
  <fieldset>
  <legend>最受喜爱图书排行榜<small></small></legend>
  <div class="container" class="span7">
  <table class="table table-hover"  style="table-layout:fixed">
  <tr>
  <th width="50px">排名</th>
  <th width="200px">书名</th>
  <th width="100px">作者</th>
  <th width="150px">出版社</th>
  <th width="80px">借阅次</th>
  <th width="">操作</th>
  </tr>
  <%int i=1; %>
  <s:iterator value="#request.toptenbook">
     <tr>
     <td><span class="badge"><%=i%></span></td>
     <td width="200px" class="ellipsis">${name }</td>
     <td width="100px" class="ellipsis">${author}</td>
     <td width="150px" class="ellipsis">${publisher}</td>
     <td>${number }</td>
     <td>
     <a class="btn" href="book_infor.action?book.id=${id }">了解更多……</a>
     </td>
     <% i++; %>
     </tr>
 </s:iterator> 
  </table>
  </div>
  </fieldset>
  </div>
  <script type="text/javascript">
  window.onload=function(){
  var today=new Date();
  var year=today.getFullYear();
  var mon=today.getMonth()+1;
  var date=today.getDate();
  document.getElementsByTagName("small")[0].innerText="数据来源于 "+year+"年"+mon+"月"+date+"日";
  }
  $(document).ready(function(){
    var trs=$("table tr");
    $.each(trs,function(i,val){
       if(i%4==0){
         $(this).addClass("success");
       }
       if(i%4==1){
         $(this).addClass("warning");
       }
       if(i%4==2){
         $(this).addClass("info");
       }
       if(i%4==3){
         $(this).addClass("error");
       }
    });
    var spans=$("table tr td span");
    $.each(spans,function(i,val){
       if(i%5==0){
       }
       if(i%5==1){
         $(this).addClass("badge-success");
       }
       if(i%5==2){
         $(this).addClass("badge-info");
       }
       if(i%5==3){
         $(this).addClass("badge-warning");
       }
       if(i%5==4){
         $(this).addClass("badge-inverse");
       }
    });

  });
  </script>  
  </body>
</html>
