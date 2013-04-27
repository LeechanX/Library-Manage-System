<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑图书</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="CSS/alertifycore.css">
		<link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<link rel="stylesheet" style="text/css" href="CSS/bootstrap.css" />
		<script src="js/alertify.min.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/application.js"></script>
    <style type="text/css">
     body{
       background:transparent;
    }
    div#container{
      width: 80%;
      margin: 0px auto;
      height: 450px;
      border-radius: 0.5em;
      font-family: cursive;
      text-align: left;
      padding-top: 10px;
      padding-left: 30px;
    }
    div#brief h5,fieldset legend{
      color: #A1A1A1;
      font-size: 14px;
      font-weight: normal;
    }
    div#main{
    height:100px;
    }
    div#brief ul{
      list-style-type: none;
      font-size: 12px;
      margin-top: 10px;
    }
    div#brief ul li{
      float: left;
      width: 300px;
      height: 50px;
      text-align: left;
    }
    fieldset{
      margin-top: 10px;
      clear: both;
      position: relative;
      padding-top: 10px;
    }
    form#toeditbook{
      position: relative;
    }
    table.wwFormTable{
      width: 400px;
      height: 200px;
      position: absolute;
      left:100px; 
      top:130px;
    }
    table.wwFormTable tbody tr{
      height: 40px;
    }
    table.wwFormTable tbody tr:nth-child(1) input,table.wwFormTable tbody tr:nth-child(3) input,table.wwFormTable tbody tr:nth-child(4) input{
      height: 30px;
    }
    table.wwFormTable tbody tr:nth-child(2) select,table.wwFormTable tbody tr:nth-child(5) select,table.wwFormTable tbody tr:nth-child(6) select{
      width: 130px;
    }
    table#label{
      position: absolute;
      top: 123px;
      font-size: 12px;
      height: 200px;
      width: 100px;
    }
    button#updateit{
      position: absolute;
      left: 150px;
      top: 400px;
    }
    </style>
  </head>
  
  <body>
   <div id="container">
   <s:form>
   <div id="brief">
    <h5>基本信息</h5>
      <i id="booktid" style="display:none;">${requestScope.editthisbook.tid} </i>
        <ul>
        <li>ISBN：<i id='bookid'>${requestScope.editthisbook.id}</i></li>
        <li>图书名：${requestScope.editthisbook.name}</li>
        <li>出版日期:${requestScope.editthisbook.publish_time}</li>
      </ul>
      </div>
      <div id="main">
              <fieldset>
                <legend>信息修改</legend>
                <s:textfield name="author"></s:textfield>
                <s:select name="bookcaseSelect" list="#{'KJ01':'科技一架','KJ02':'科技二架','KJ03':'科技三架','WX01':'文学一架',
                'WX02':'文学二架','WX03':'文学三架','ZZ01':'杂志架','GJ01':'工具书一架','GJ02':'工具书二架','QT01':'多彩图书一架','QT02':'多彩图书二架'}" />
                <s:textfield name="publisher"></s:textfield>
                <s:textfield name="stock"></s:textfield>
                <s:doubleselect                        
                list="#request.map.keySet()"     
                name="typeSelect"     
                listKey="typename"        
                listValue="typename"       
                doubleName="type2Select"     
                doubleId="comboDoubleId"     
                doubleList="#request.map[top]"     
                doubleListKey="type2_id"     
                doubleListValue="value"  />              
              </fieldset>
              <table id="label">
                  <tr><td>作者：</td></tr>
                  <tr><td>所属书架：</td></tr>
                  <tr><td>出版社：</td></tr>
                  <tr><td>库存：</td></tr>
                  <tr><td>图书类型：</td></tr>
                </table>
              </div>
    </s:form>
    <button id="updateit" class="btn btn-success">完成修改</button>
   </div> 
    <script type="text/javascript">
    $(document).ready(function(){
      $("#updateit").click(function(){
        $.post("updateedit",{
          "briefbook.tid":$("#booktid").text(),
          "briefbook.id":$("#bookid").text(),
          "briefbook.author":$("input[name='author']").val(),
          "briefbook.bookcaseid":$("select[name='bookcaseSelect']").val(),
          "briefbook.publisher":$("input[name='publisher']").val(),
          "briefbook.stock":$("input[name='stock']").val(),
          "briefbook.type":$("select[name='typeSelect']").val(),
          "briefbook.type2":$("select[name='type2Select']").val()
        },function(data){
          alertify.success("<h3>"+data+"</h3>");
        });
      });
    });
    </script>
  </body>
</html>
