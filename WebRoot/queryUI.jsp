<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String readerid = (String)session.getAttribute("rdrid");//贯穿整个Reader操作网页
%>


<HTML>
  <head>
    <title>图书查询</title>
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
	<link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<script src="js/alertify.min.js"></script>
	<style>
	 body{
       background:#e1e2e4 url("Images/background.png") fixed;
    }
	input.span1,input.span2,input.span3,input.span4{height:30px;}
	button.btn.dropdown-toggle{
		height: 30px;
	}
	#typeSet{
	 display:none;
	}
	#forquery{
	  background-color:rgba(244,244,244,0.4);
	  padding-top:10px;
	  padding-left:10px;
	  width:600px;
	  margin:0px auto;
	  border-radius:0.5em;
	}
	#everybook{
	background-color:#e9f1f4;;
	padding-top:5px;
	padding-bottom:5px;
	border-radius:0.3em;
	height:195px;
  margin-bottom: 10px;
	}
	#res{
	  margin:0px auto;
	  width:600px;
	}
	</style>
	<script type="text/javascript" src="js/jquery.js"></script>	
<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/application.js"></script>
	<script type="text/javascript" src="js/jPages.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/jPages.css">

  </head>
  <body> 
      	<div class="page-header">
      <div class="container">
  			<div id="forquery">
  				<form method="get" name="myForm" action="queryBook"> 
<ul class="nav nav-pills">
  <li>
    <B STYLE="font-size:22px;font-family:微软雅黑">图书搜索</B>         
  <input class="span4" id="appendedInputButtons" type="text" placeholder="输入图书的任何信息……" name="bookinf"
  <%if(request.getParameter("bookinf")!=null){
  %> value="<%=request.getParameter("bookinf") %>" <%
  } %>
   >
  <input type="text" name="booktype" id="typeSet"/>
  </li>
  <li class="dropdown" id="menutest1">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#menutest1">
      <b id="tp">全部分类</b>
      <b class="caret"></b>
    </a>
    <ul class="dropdown-menu">
      <li class="dropdown-submenu"><a href="#">科技</a>
        <ul class="dropdown-menu">
          <li><a href="#">建筑</a></li>
          <li><a href="#">计算机</a></li>
          <li><a href="#">机械</a></li>
          <li><a href="#">电气</a></li>
          <li><a href="#">土木</a></li>
          <li><a href="#">热能</a></li>
          <li><a href="#">航天</a></li>
        </ul>
      </li>
      <li class="dropdown-submenu"><a href="#">文学</a>
        <ul class="dropdown-menu">
          <li><a href="#">小说</a></li>
          <li><a href="#">散文</a></li>
          <li><a href="#">传记</a></li>
        </ul>
      </li>
      <li class="dropdown-submenu"><a href="#">杂志</a>
        <ul class="dropdown-menu">
          <li><a href="#">月刊</a></li>
          <li><a href="#">期刊</a></li>
          <li><a href="#">周报</a></li>
        </ul>
      </li>
      <li class="dropdown-submenu"><a href="#">工具书</a>
        <ul class="dropdown-menu">
          <li><a href="#">字典</a></li>
          <li><a href="#">词汇</a></li>
        </ul>
      </li>
      <li class="dropdown-submenu"><a href="#">其他</a>
        <ul class="dropdown-menu">
          <li><a href="javascript:void(0)">画册</a></li>
          <li><a href="#">书法</a></li>
          <li><a href="#">其余</a></li>
        </ul>
      </li>
      <li class="divider"></li>
      <li><a href="#">全部分类</a></li>
    </ul>
  </li>
  <li>
    <button class="btn btn-primary" id='search' type="submit" >&nbsp;&nbsp;&nbsp;搜索&nbsp;&nbsp;&nbsp;</button>
  </li>
</ul> 
</form>
</div>
  		</div>
  	</div>
  	<div id="res">
<s:if test="#request.queryList.size()==0">
				<h5>没有结果，重新搜索吧……</h5>
				</s:if>
				<s:else>
	<div class='holder'></div>
	<div id='itemContainer'>
	<s:iterator value="#request.queryList">
	<div class='row' id="everybook">
	<div style='width:130px;height:190px' class='span2'>

  <s:if test="bookpic!=null">
                <img src="<%=request.getContextPath()%>/${bookpic}" width="140px" height="200px"/><br/><br/>
                </s:if>
                <s:else>
                    <img src="<%=request.getContextPath()%>/Images/bookpic/bz.jpg" width="140px" height="200px"/><br/><br/>
                </s:else>
              </div>
	<div class='span4' style='height:176px;padding-top:15px;'>
	ISBN：${id}<br>
  书名：${name}<br>
  作者：${author}<br>
	译者：${translator}<br>
	出版社：${publisher}<br>
	价格：${price}&nbsp;&nbsp;
	类别：${type}<br>
	出版日期：${publish_time}<br>
	<a href='javascript:void(0);' onclick="carthing('${id}','${sessionScope.rdrid}')" class='btn btn-small btn-danger'><span class='add-on'><i class='icon icon-white icon-heart'></i></span>想读</a>&nbsp;&nbsp;
	<a href='book_infor.action?book.id=${id}' class='btn btn-small btn-primary'><span class='add-on'><i class='icon-list-alt icon icon-white'></i></span>了解更多</a>
	</div>
	</div>
	</s:iterator>
	</div>
	</s:else>
  	</div>
  </body>
  <script type="text/javascript">
  $(document).ready(function(){
    $("li#menutest1 ul li a").click(function(){
      $("b#tp").html($(this).text());
      $("input#typeSet").val($(this).text());
    });
     $("div.holder").jPages({
      containerID: "itemContainer",
      perPage : 5
    });
  });
  function carthing(bukid,rderid){//insert to my car
   if(rderid=="null"){
   alertify.error("<h3>您尚未登录!</h3>");
   return false;
   }
	$.post("addlike",{
	"like.bookid":bukid,
	"like.readerid":rderid
	},function(data){
		alertify.success("<h3>"+data+"</h3>");
	});
   }
  </script>
</HTML>
