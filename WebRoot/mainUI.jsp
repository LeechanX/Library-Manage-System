<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Main</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="js/jquery.js"></script>
		<script src="js/bootstrap.js"></script>
<script>
$(document).ready(function(){
$('.carousel').carousel();
});
</script>
<style>
div#hero-unit{
height:150px;
padding-top:25px;
background-color:#f5f5f5;
padding-left:50px;
margin-bottom:10px;
}
</style>
  </head>
  
  <body>
  <div id="hero-unit">
		 <div id="lhead">	
			<h1>
				哈工大社区图书馆
			</h1>
			<br/>
				<a class="btn btn-danger btn-large" rel="popover" data-original-title="图书快搜" data-content="<div class='input-append'>
  <form method=post action=queryUI.jsp target=blank><input class='span2' id='appendedInputButton' type='text' name='bookinf' placeholder='请输入图书名'>
  <button class='btn' type='submit'>搜!</button></form>
</div>"><span class="add-on"><i
									class="icon-search icon-white"></i> </span> 搜索图书快捷入口</a>
		  </div>
		</div>	
		
		<!-- 下面是第二个模块 -->
		<div class="container-fluid">
			<div class="row">
				<div class="span3" style="background-color: #f5f5f5;">
					<ul class="nav nav-list" id="mylead">
						<li class="nav-header">
							<span class="add-on"><i class="icon-th-list"></i> </span>主页菜单
						</li>
						<li class="active">
							<a href="index.jsp"><span class="add-on"><i
									class="icon-home"></i> </span>主页</a>
						</li>
						<li>
							<a href="queryUI.jsp" target="main"><span class="add-on"><i
									class="icon-book"></i> </span>图书检索</a>
						</li>
						<li>
							<a href="showNews.action" target="main"><span class="add-on"><i
									class="icon-text-height"></i> </span>新闻浏览</a>
						</li>
						<li>
							<a href="daohang.jsp" target="main"><span class="add-on"><i
									class="icon-map-marker"></i> </span>本馆导航</a>
						</li>
						<li>
							<a href="topten" target="main"><span class="add-on"><i
									class="icon-align-justify"></i> </span>人气图书Top10</a>
						</li>
						<li>
							<a href="manage.jsp" target="_blank"><span class="add-on"><i
									class="icon-th-large"></i> </span>管理员入口</a>
						</li>
					</ul>
					<br>
					<pre class="prettyprint linenums">©2012 HIT Community Library 
</pre>
				</div>
				<div class="span12" style="background-color: #f1f1f1;" id="mains">
					<!-- this is 3rd layout -->	
					<div class="span12">
					<!-- this is 3rd layout -->
					<div class="span6">
					<marquee direction="left" onMouseOver=
	this.stop();;;;
onMouseOut=
	this.start();;
>
						<font><p> <img height="18" width="19"
									border="0" src="<%=request.getContextPath()%>/Images/ph.png">
								哈工大图书馆联系电话：(0431)54978981
								</p> </font>
					</marquee>

				
						<div id="myCarousel" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active">
									<img src="<%=request.getContextPath()%>/Images/in1.jpg" alt=""
										class="img-rounded">
									<div class="carousel-caption">
										<h4>
											我大砍工大图书馆世界第一！
										</h4>
										<p>
											不服是吗？你来东北信不信我砍你！
										</p>
									</div>
								</div>
								<div class="item">
									<img src="<%=request.getContextPath()%>/Images/in2.jpg" alt=""
										class="img-rounded">
									<div class="carousel-caption">
										<h4>
											图书馆近景
										</h4>
										<p>
											校训闪闪发光。
										</p>
									</div>
								</div>
								<div class="item">
									<img src="<%=request.getContextPath()%>/Images/in3.jpg" alt=""
										class="img-rounded">
									<div class="carousel-caption">
										<h4>
											图书馆原景
										</h4>
										<p>
											丫太白了，有点时代了。
										</p>
									</div>
								</div>
							</div>
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev">&lsaquo;</a>
							<a class="right carousel-control" href="#myCarousel"
								data-slide="next">&rsaquo;</a>
						</div>
					</div>
					<div class="span5">
					<p style="font-size:23">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img style="filter:gray" src="Images/tag.jpg" width="64" height="64">哈工大图书馆简介</p>
					<hr/>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					哈尔滨工业大学图书馆建于1920年。图书馆拥有丰富的馆藏量。截止到2010年底，图书馆已拥有传统型馆藏325万册/件，电子图书132万种，引进国内外文献数据库63种，推荐免费电子资源31种，包括各种知名的大型综合性数据库、各类权威的专业学会出版物全文数据库。图书馆自建了2003年以来的本校学位论文全文特色库，并开始筹建国防工程文献特色库。馆藏文献信息已形成与学校院系设置相适应的多学科、多语种、多载体、综合性资源体系。
					<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					哈尔滨工业大学图书馆秉承“规格严格，功夫到家”的哈工大精神，正朝着建设“现代化、研究型、开放文明的世界一流大学图书馆”的发展目标扎实奋进。
					</p>
					</div>						
					</div>			
				</div>
			</div>
		</div>
   
	
  </body>
</html>
