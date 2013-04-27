<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'wrong.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="5;url=index.jsp"> 
	<link rel="stylesheet" type="text/css" href="CSS/alertifycore.css">
	<link rel="stylesheet" type="text/css" href="CSS/bootstrapalertify.css"/>
    <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"/>
    <script src="js/alertify.min.js" type="text/javascript"></script>
  <style>
h4{
font-family:微软雅黑;
font-weight:bolder;
color:#FF3030;
}
p{
font-family:微软雅黑;
font-size:normal;
font-weight:bolder;
}
</style>
  </head>
<script language="javascript" type="text/javascript">
        var i = 3;
        var intervalid;
        intervalid = setInterval("fun()", 1000);
        function fun() {
            if (i == 0) {
                window.location.href = "../index.html";
                clearInterval(intervalid);
            }
            document.getElementById("mess").innerHTML = i;
            i--;
        }
</script>
  <body>
  <div class="container">
  <div class="row">
  <h3><i id="mess">3 </i>  秒后返回首页…… </h3>
    <%
    
    out.println("<script>alertify.alert('<h4>&nbsp;&nbsp;&nbsp;帐号or密码错误!即将返回首页……</h4>');</script>");
     %> 
     </div>
     </div>
  </body>
</html>
