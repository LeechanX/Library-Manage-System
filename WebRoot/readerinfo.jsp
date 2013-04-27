<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="stylesheet" type="text/css" href="xedit/address.css">
<link rel="stylesheet" type="text/css" href="xedit/bootstrap-editable.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="xedit/jquery.mockjax.js"></script>
<script src="xedit/bootstrap-editable.min.js"></script>
<script src="xedit/newrecord.js"></script>
<link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<script src="js/alertify.min.js"></script>
		<style>
		div#main{
		-moz-border-radius: 8px;
-webkit-border-radius: 8px;
border-radius: 8px;
		width:80%;
		margin:20px auto;
		background-color:#F5F5DC;
		height:410px;
		padding-left:30px;
		position:relative;
		}
		table#user{
		width:60%;
		margin:0px auto;
		}
		button#save{
		position:absolute;
		left:22%;
		top:82%;
		}
		table{
		font-size:12px;}
		</style>
  </head>  
  <body>
    <div id="main">
  <fieldset>
  <legend>个人信息</legend>
   <s:if test="#request.pro!=null">
    <table id="user" class="table table-bordered table-striped">
        <tbody> 
            <tr class="success">         
                <td width="40%">用户ID</td>
                <td id="myid"><s:property value="#request.pro.readerid"/></td>
            </tr>
            <tr class="warning">         
                <td>密码</td>
                <td><a href="#" class="myeditable editable editable-click editable-empty" data-type="text" data-pk=1 data-name="password" data-original-title="修改密码：" id="password"><s:property value="#request.pro.password"/></a></td>
            </tr>
            <tr class="error">         
                <td>真实姓名</td>
                <td><s:property value="#request.pro.readername"/></td>
            </tr>  
            <tr class="info">         
                <td>性别</td>
                <td><s:property value="#request.pro.sex"/></td>
            </tr>     
            <tr class="success">         
                <td>电话</td>
                <td><a href="#" id="tel" class="myeditable editable editable-click editable-empty" data-type="text" data-name="tele" data-original-title="填写电话："><s:property value="#request.pro.telephone"/></a></td>
            </tr> 
            <tr class="warning">         
                <td>读者类型</td>
                <td id="myta">
                <s:property value=
  		"#conv=:[#this==1?'学生':#this==2?'教师':#this==3?'工人':#this==4?'自由职业':#this==5?'退休人员':''],#conv(#request.pro.type)" />	
                </td>
            </tr> 
            <tr class="error">         
                <td>Email</td>
                <td><a href="#" class="myeditable editable editable-click editable-empty" data-type="text" data-pk=1 data-name="email" data-original-title="输入Email：" id="email"><s:property value="#request.pro.email"/></a></td>
            </tr>
        </tbody>
    </table>
    </s:if>
    <s:else>
    暂无信息
    </s:else>
    </fieldset>
    <div>
    <button id="save" class="btn btn-primary">保存我的资料</button>
    <script>
    $(document).ready(function(){
    $("button#save").click(function(){
     $.post("editmyinfo",{
         "reader.readerid":document.getElementById("myid").innerText,
         "reader.telephone":document.getElementById("tel").innerText,
         "reader.email":document.getElementById("email").innerText,
         "reader.password":document.getElementById("password").innerText
         },function(data){
         alertify.success(data);
         });
    });
    });
    </script>
    </div>
</div>  
  </body>
</html>
