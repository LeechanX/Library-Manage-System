<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	 <link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css" />
		<title>新增读者</title>
		<style type="text/css">
		input.span1,input.span2,input.span3,input.span6 {
	height: 30px;
}
b.error{
    color:#FF6A6A
}
		</style>
	</head>
	<body style="background-color: transparent;padding-top:10px;">
		<div class="container">
			<div class="row">
				<form id="signupForm" action="reader_register">
				<input type=text name=op value=insert style=display:none>
				<fieldset>
					<legend>Sign Up For Free
						<small>带*号项表示必填项</small>
					</legend>
					<div class="span10" style="padding-left:20px;padding-right:20px;">
						<table class="table table-hover">
							<tr>
								<td class="span2" style="text-align:right;padding-top:15px;">注册ID*</td>
								<td><input type="text" name="reader.readerid" id="id" class="span3"/><i id="warning" style="color:#FF6A6A"></i></td>
							</tr>
							<tr>
								<td class="span2" style="text-align:right;padding-top:15px;">真实姓名*</td>
								<td><input type="text" name="reader.readername" class="span3"><i id="warning2" style="color:#FF6A6A"></i></td>
							</tr>
							<tr>
								<td class="span2" style="text-align:right;padding-top:15px;">创建密码*</td>
								<td><input type="password" name="reader.password" class="span3" id="password"/></td>
							</tr>
							<tr>
								<td class="span2" style="text-align:right;padding-top:15px;">确认密码*</td>
								<td><input type="password" name="password2" class="span3" id="password2"/></td>
							</tr>
							<tr>
								<td class="span2" style="text-align:right;padding-top:15px;">联系电话*</td>
								<td><input type="text" name="reader.telephone" class="span3"/></td>
							</tr>
							<tr>
								<td class="span2" style="text-align:right;padding-top:15px;">性别</td>
								<td style="padding-top:15px;">男&nbsp;&nbsp;&nbsp;
								<input type="radio" value="男" name="reader.sex" checked>
								&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;<input type="radio" value="女" name="reader.sex">
								</td>
							</tr>
							<tr>
								<td class="span2" style="text-align:right;padding-top:15px;">读者类型</td>
								<td>
									<select name="reader.type" class="span2">
									<option value="1">学生
									</option>
									<option value="2">教师
									</option>
									<option value="3">工人
									</option>
									<option value="4">自由职业
									</option>
									<option value="5">退休人员
									</option>
								</select>
								</td>
							</tr>							
							<tr>
								<td class="span2" style="text-align:right;padding-top:15px;">@Email</td>
								<td><input type="text" name="reader.email"	class="span3"/></td>
							</tr>
							<tr>
								<td colspan="2" style="padding-left:146px;">
									<button class="btn btn-info btn-large">注册</button>
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
			</form>
			</div>
		</div>
		<script src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery.validate.js"></script>
		<script type="text/javascript" src="js/jquery.metadata.js"></script>
		<script type="text/javascript" src="js/alertify.min.js"></script>
		<script type="text/javascript" src="js/newReader.js"></script>
	</body>
</html>