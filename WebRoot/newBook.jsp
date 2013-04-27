<%@page contentType="text/html;charset=UTF-8" import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
	<link rel="stylesheet" href="CSS/alertifycore.css">
		<link rel="stylesheet" href="CSS/bootstrapalertify.css">
    <link rel="stylesheet" type="text/css" href="CSS/jquery.fs.selecter.css">
    <link rel="stylesheet" type="text/css" media="all" href="CSS/datepicker.css" />
    <link rel="stylesheet" type="text/css" media="all" href="CSS/newBook.css" />
	<title>新增图书</title>
</head>
<body>
	<div id="container">
			<div id="first">
			<h3>SIGN UP STEP 1 <small>图书基本信息填写</small> </h3>
            <div class="form">
                <label for="book.id"><input type="text" name="book.id" id="bookid" placeholder="请输入图书ISBN……"/>
                <small>至少4个字符，只允许英文和数字。</small></label>
                <label for="book.name"><input type="text" name="book.name" id="bookname" placeholder="请输入图书名称……"/>
                <small>务必输入。</small></label>
                <label for="book.author"><input type="text" name="book.author" id="author" placeholder="请输入图书作者"/>
          	<small>务必输入。</small>
                </label>
                <label for="book.publisher"><input type="text" name="book.publisher" id="publisher" placeholder="请输入图书出版社"/>
                <small>务必输入。</small></label>
           <label for="book.publish_time">
                    <input type="text" name="book.publish_time" id="publish_time" value="" 
                    placeholder="出版日期"/>
                <small>出版日期，可以不填。</small> </label>
            </div> 
            <a id="submit_first" class="btn btn-danger">然后呢</a>
			</div>
		    <div id="type2">
		    	<h3>SIGN UP STEP 2 <small>其他信息填写</small></h3>
            <div class="form">
                <label for="book.translator"><input type="text" name="book.translator" id="translator" value="" />
                <small>翻译者，可以不填。</small> </label>
                <label for="book.stock">
                   <input type="text" name="book.stock" class="span2" value="1" id="stock"/>
                <small>图书馆藏数量，默认为1。</small></label>
                 <label for="book.price">
                   <input type="text" name="book.price" class="span2" min="1" value="1" id="price"/>
                <small>图书单价，可以不填。</small></label>
                <label for="book.bookcaseid">
                    <select name="book.bookcaseid" id="bookcaseid">
                        <option value="KJ01">科技类一架</option>
                        <option value="KJ02">科技类二架</option>
                        <option value="KJ03">科技类三架</option>
                        <option value="WX01">文学类一架</option>
                        <option value="WX02">文学类二架</option>
                        <option value="WX03">文学类三架</option>
                        <option value="ZZ01">杂志类书架</option>
                        <option value="GJ01">工具书架1</option>
                        <option value="GJ02">工具书架2</option>
                        <option value="QT01">其他书架1</option>
                        <option value="QT02">其他书架2</option>
                      </select>
                <small id="oneselect">图书的储藏位置。</small></label>
                 <label>
                     <select id="type">
		<option value="科技">科技</option>
		<option value="文学">文学</option>
		<option value="杂志">杂志</option>
		<option value="工具书">工具书</option>
		<option value="其他">其他</option>
	</select>
	
	<select id="continuetype">
		<option value="1">建筑</option>
		<option value="2">计算机</option>
		<option value="3">机械</option>
		<option value="4">电气</option>
		<option value="5">土木</option>
		<option value="6">热能</option>
		<option value="7">航天</option>
	</select>
                <small id="twoselect">图书的详细分类，默认科技/建筑。</small></label>
                 
            </div>
            <a id="submit_type2" class="btn btn-danger" name="submit_type2">然后呢</a>
        
		    </div> 
		    <div id="third">
<form name="pform" action="uploadpic" method="POST" enctype="multipart/form-data" target="myframe">
                        <div class="filebox" style="background-color:#f0f0f0;border:1px dashed;height:280px;width:190px;text-align:center;line-height:30px">
                            点击此处上传图片
                            <input type="file" name="file" class="file" id="fileField" size="20"onchange="setImagePreview()" />
                            <div style="width:190px;height:250px" id="localImag">
                                <img id="preview" width=-1 height=-1 style="diplay:none" />
                            </div>
                        </div>
                        <input type="submit" class="btn" id="setPic" value="图书图片上传">   
                        <iframe name="myframe" frameborder=0></iframe>
                </form>
        <a name="submit_third" id="submit_third" class="btn btn-danger" name="submit_type2">然后呢</a>
		    </div>
		    <div id="fourth">
		    	<h3>图书信息<span>核对</span></h3>
		    	 <div class="form">
                <table>
                    <tr><td class="title">ISBN</td><td class="contents"></td></tr>
                    <tr><td class="title">图书名</td><td class="contents"></td></tr>
                    <tr><td class="title">作者</td><td class="contents"></td></tr>
                    <tr><td class="title">出版社</td><td class="contents"></td></tr>
                    <tr><td class="title">出版日期</td><td class="contents"></td></tr>
                    <tr><td class="title">译者</td><td class="contents"></td></tr>
                    <tr><td class="title">库存数</td><td class="contents"></td></tr>
                    <tr><td class="title">书架</td><td class="contents"></td></tr>
                    <tr><td class="title">分类</td><td class="contents"></td></tr>
                    <tr><td class="title">单价</td><td class="contents"></td></tr>
                </table>
            </div> 
            <input class="btn btn-danger" type="button" name="submit_fourth" id="submit_fourth" value="提交之" />
		    </div>
		 <div class="progress progress-success">
<div class="bar" style="width: 0%"></div><p>完成度：0%</p>
</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery-ui-1.10.0.custom.js"></script>
		<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="js/jquery.fs.selecter.js"></script>
		<script src="js/alertify.min.js"></script>
<script type="text/javascript" src="js/newBook.js"></script>
</html>