<%@page contentType="text/html;charset=UTF-8" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>新闻发布区</title>
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
	<style>
  body{
    background-color:transparent;
  }
	div.container,div.row{
	padding-top:30px;}
input.span5{
width:280px;
height:25px;
position: absolute;
left: 10%;
}
label{
  position: relative;
  color: #737373;
}
button{
  position: absolute;
  left: 82%;
}
div#cke_edit{
  position: absolute;
  top: 13%;
  width: 68%;
}
</style>
	
  </head>
  <body>
  <div class="container">
  <form name="eform" action="addNews" method="post">
  <div id="editor">
    <label for='news.newsname'>新闻标题<input type='text' name='news.newsname' class='span5' onkeyup='return check()' onmousedown='return check()' onblur='return check()'/>
      <button id="releaseid" name="remove" class="btn" onclick="releaseit();">
        <span class="add-on"><i class="icon icon-plane"></i></span>
        发布新闻</button>
    </label>
    <textarea id='edit'  rows='30' cols='50' name='news.contentpath'></textarea>
  </div>
  </form>
  </div>
  <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/application.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
    window.onload=function(){
  CKEDITOR.replace('news.contentpath',{
        uiColor: '#D1D1D1'
    });
};
function releaseit(){  
    document.eform.submit();
}
    </script>
  </body>
</html>
