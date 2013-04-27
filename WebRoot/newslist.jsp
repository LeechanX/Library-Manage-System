<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>新闻列表</title>
		<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/application.js"></script>
			<script type="text/javascript" src="js/jPages.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/jPages.css">
		<style>
div.row {
	width: 940px;
}

table tr:nth-child(odd) {
	background-color: #FAFAD2;
}

table tr:nth-child(even) {
	background-color: #EAEAEA;
}
a:link,a:visited{
	text-decoration: none;
	color: #333333;
}
a:hover{
	background-color: #EEDFCC;
}
table{
	font-size:15px;
}
table tbody tr td:nth-child(1),table tr th:nth-child(1){
	width: 80%;
	text-align: left;
	padding-left:100px;
}
table thead tr:first-child{
    background-color:#D9D9D9;
}
</style>
	</head>
	<body>

		<div class="container">
			<div class="row">
				<fieldset>
					<legend>
						新闻中心
						<small></small>
					</legend>
					<div class="span12" id="newsspace">
						<table class="table table-bordered" id="tb">
						<thead><tr><th>新闻标题</th><th>发布时间</th></tr></thead>
						<tbody id="movies">
							<s:iterator value="#request.allnews">
								<tr>
									<td>
										<a href="showthisNews.action?news.time=${time}"><s:property value="newsname" />
										</a>
									</td>
									<td><!--
										<s:property value="time" />-->
										2012年12月23日
									</td>
								</tr>
							
							</s:iterator>
							</tbody>
						</table>
					</div>
					<div class="holder"></div>
				</fieldset>
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
			$("div.holder").jPages({
				containerID: "movies",
				perPage : 8
			});
		});
		</script>
	</body>
</html>
