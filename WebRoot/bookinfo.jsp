<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head><link rel="stylesheet" style="text/css" href="CSS/bootstrap.css"/>
		<link rel="stylesheet" href="CSS/alertifycore.css">
    <link rel="stylesheet" href="CSS/bootstrapalertify.css">
		<script src="js/alertify.min.js"></script>
		<script src="js/jquery.js"></script>
		<title>图书详情</title>
     <style>
     #alertify{
	width:313px;
	height:131px
	}
    #container{
        width: 75%;
        border-radius: 0.5ex;
        margin: 10px auto;
        padding-left: 20px;
    }
    fieldset{
       position:relative;
    }
    legend{
      padding-left:9%;
    }
    h3{
        display:inline;
        font-weight: normal;
    }
    #left{
        position:relative;
        float:left;
        width: 45%;
        height: 390px;
        border-radius: 0.5ex;
        margin-right: 10%;
    }
    #right{
    float:left;
    width:38%;
    height: 390px;
    border-radius:0.5ex;
    text-align:center;
    }
    #foot{
    clear:both;
    }
    table{
      position:absolute;
      left:20%;
      border-radius:0.5em;
    }
    td.gxt{
        border: 0px;
        text-align:center;
        background-color:#F8F8FF;
        border-radius:0.5ex;
        border:1px solid white;
        color:gray;
        font-family: 微软雅黑; 
    }
    td.lcx{
        border: 0px;
        width:30%;
        text-align:center;
        background-color:#F1f1f1;
        border-radius:0.5ex;
        border:1px solid white;
        color:gray;
        font-family: 微软雅黑;
    }
    body{
       background:#e1e2e4 url("Images/background.png") fixed;
    }
     </style>
      </head>
    <body STYLE='OVERFLOW:SCROLL;OVERFLOW-X:HIDDEN;OVERFLOW-Y:HIDDEN'> 
        <div id="container">
            <s:if test="#request.thisbook!=null">
            <fieldset>
               <legend><h3>图书详情</h3></legend>
                <div id="left">
                    <table class="table table-hover">
    <tr><td class="lcx">ISBN</td>
        <td class="gxt"><s:property value="#request.thisbook.id"/></td></tr>
    <tr><td class="lcx">书名</td>
        <td class="gxt"><s:property value="#request.thisbook.name"/></td></tr>
    <tr><td class="lcx">类型</td><td class="gxt"><s:property value="#request.thisbook.type"/>/<s:property value="#request.thisbook.nexttype"/></td></tr>
    <tr><td class="lcx">作者</td>
        <td class="gxt"><s:property value="#request.thisbook.author"/></td></tr>
    <tr><td class="lcx">出版社</td>
        <td class="gxt"><s:property value="#request.thisbook.publisher"/></td></tr>
    <tr><td class="lcx">出版时间</td>
        <td class="gxt"><s:property value="#request.thisbook.publish_time"/></td></tr>
    <tr><td class="lcx">单价</td>
        <td class="gxt"><s:property value="#request.thisbook.price"/></td></tr>
    <tr><td class="lcx">译者</td><td class="gxt"><s:property value="#request.thisbook.translator"/></td></tr>
    <tr><td class="lcx">书架</td><td class="gxt"><s:property value="#request.thisbook.bookcasename"/></td></tr>
    <tr><td class="lcx">位置</td><td class="gxt"><s:property value="#request.thisbook.position"/></td></tr></table>
                </div>
                
                <div id="right">
                <s:if test="#request.thisbook.bookpic!=null">
                <img src="<%=request.getContextPath()%>/<s:property value='#request.thisbook.bookpic'/>" width="210px" height="280px"/><br/><br/>
                </s:if>
                <s:else>
                    <img src="<%=request.getContextPath()%>/Images/bookpic/bz.jpg" width="210px" height="280px"/><br/><br/>
                </s:else>
                <a class="btn btn-large btn-danger" id="tolike" onclick="addlike('<s:property value="#request.thisbook.id"/>','${sessionScope.rdrid}')"><span class="add-on"><i class="icon-heart icon-white"></i></span>加入我的喜欢</a>
                </div>
                
   </fieldset>
</s:if>
 <s:else>
    暂无信息
    </s:else>
        </div>
        <script type="text/javascript">
        function addlike(bookid,readerid){
            if(readerid=="null"){
                alertify.error("<h3>尚未登录，请登录!</h3>");
                return false;
            }else{
                $.post("addlike",{
                    "like.readerid":readerid,
                    "like.bookid":bookid
                },function(data){
                    alertify.success("<h3>"+data+"</h3>");
                });
            }
        }
        </script>
      </body>
</html>