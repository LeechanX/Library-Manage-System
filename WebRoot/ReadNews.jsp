<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${requestScope.thisnews.newsname} </title>
    		<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
		<script type="text/javascript" src="js/jquery.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style>
	fieldset legend{
	   font-size:25px;
	}
	fieldset fieldset{
	   font-size:15px;
	}
	fieldset fieldset legend{
	   font-size:19px;
	}
	</style>
	
  </head>
  
  <body>
    <div class="container">
			<div class="row">
			<fieldset>
					<legend>
						新闻中心
						</legend>
				<fieldset>
					<legend>
						${requestScope.thisnews.newsname} 
						<small>${requestScope.thisnews.time}<a href="showNews.action">返回新闻列表</a>
						</small>
					</legend>
					<div class="span12" id="newsspace">
						${request.thisnews.contentpath} 
					</div>
					<div class="holder"></div>
				</fieldset>
			</fieldset>
			</div>
		</div>
  </body>
</html>
