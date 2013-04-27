$(document).ready(function(){
    $("#publish_time").datepicker();
    $("select#bookcaseid").selecter();

    var child=$("select#continuetype").children();
		$("select#type").change(function(){
			if($(this).val()=="科技"){
			$.each(child,function(i,val){
				$(this).remove();
			});
                var newOption1=new Option("建筑","1");
                var newOption2=new Option("计算机","2");
                var newOption3=new Option("机械","3");
                var newOption3=new Option("电气","4");
                var newOption3=new Option("土木","5");
                var newOption3=new Option("热能","6");
                var newOption3=new Option("航天","7");
                $("select#continuetype").append(newOption1); 
                $("select#continuetype").append(newOption2); 
                $("select#continuetype").append(newOption3);
                $("select#continuetype").append(newOption4); 
                $("select#continuetype").append(newOption5); 
                $("select#continuetype").append(newOption6); 
                $("select#continuetype").append(newOption7);  
			}else if($(this).val()=="文学"){
			$.each(child,function(i,val){
				$(this).remove();
			});
				var newOption1=new Option("小说","1");
				var newOption2=new Option("散文","2");
				var newOption3=new Option("传记","3");
				$("select#continuetype").append(newOption1); 
				$("select#continuetype").append(newOption2); 
				$("select#continuetype").append(newOption3); 
			}else if($(this).val()=="杂志"){
			$.each(child,function(i,val){
				$(this).remove();
			});
                var newOption1=new Option("月刊","1");
                var newOption2=new Option("期刊","2");
                var newOption3=new Option("周报","3");
                $("select#continuetype").append(newOption1); 
                $("select#continuetype").append(newOption2); 
                $("select#continuetype").append(newOption3); 
			}else if($(this).val()=="工具书"){
			$.each(child,function(i,val){
				$(this).remove();
			});
                var newOption1=new Option("字典","1");
                var newOption2=new Option("词汇","2");
                $("select#continuetype").append(newOption1); 
                $("select#continuetype").append(newOption2); 
            }else{
            $.each(child,function(i,val){
				$(this).remove();
			});
                var newOption1=new Option("画报","1");
                var newOption2=new Option("书法","2");
                var newOption3=new Option("其他","3");
                $("select#continuetype").append(newOption1); 
                $("select#continuetype").append(newOption2); 
                $("select#continuetype").append(newOption3); 
            }
		});
	$('#submit_first').click(function(){
		var errors=0;
		var re=/^\w+$/;
        var fields=$("#first #bookid,#first #author,#first #publisher,#first #bookname");
        fields.each(function(){
        	var value=$(this).val();
        	if(value.length<1){
        		$(this).addClass("error");
        		$(this).parent().effect("shake",{times:3},1000);
        		errors++;
        	}else{
        		$(this).addClass("success");
        	}
        });
        if(!errors){
        	$("div#first").hide();
            $("div#type2").show();
            $("div.bar").attr({style:'width:33%'});
            $("p").html("");
            $("div.bar").html("完成度：33%");
        }	
	});
	$('#submit_type2').click(function(){
		var value=$("#price").val();
        var re=/^\d+(.\d+)?$/;
        if(re.test(value)){
		$("div#type2").hide();
        $("div#third").show();
        $("div.bar").attr({style:'width:67%'});
        $("div.bar").html("完成度：67%");
        $("p").html("");
       } 
	});
	$('#submit_third').click(function(){
		$("div#third").hide();
        $("div#fourth").show();
        var getJSON=new Array(
        $("#bookid").val(),
        $("#bookname").val(),
        $("#publisher").val(),
        $("#author").val(),
        $("#publish_time").val(),
        $("#translator").val(),
        $("#stock").val(),
        $("#bookcaseid").val(),
        $("select#type").val()+"/"+$("select#continuetype").val(),
        $("#price").val()
        );
    
        var trs=$("div#fourth table tr");
        trs.each(function(){
            $(this).children("td:nth-child(2)").html(getJSON[$(this).index()]);
        });
            $("div.bar").attr({style:'width:100%'});
            $("div.bar").html("完成度：100%");
	});
	$('#submit_fourth').click(function(){
       $.post("addBook",{
            "briefbook.id":$("#bookid").val(),
           "briefbook.name":$("#bookname").val(),
           "briefbook.author": $("#author").val(),
           "briefbook.publisher":$("#publisher").val(),
           "briefbook.publish_time":$("#publish_time").val(),
           "briefbook.translator":$("#translator").val(),
           "briefbook.stock": $("#stock").val(),
           "briefbook.bookcaseid":$("#bookcaseid").val(),
           "briefbook.type":$("select#type").val(),
           "briefbook.type2":$("select#continuetype").val(),
           "briefbook.price":$("#price").val()
       },function(data){
            alertify.confirm(data+",继续添加否？",function(e){
                if(e){
                   window.location.href="newBook.jsp";
                }else{
                  window.location.href="book_infor.action?book.id="+$("#bookid").val();
                }
            });
               
       });
	});
});
	function setImagePreview() {
		var docObj = document.getElementById("fileField");
		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性 
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '190px';
			imgObjPreview.style.height = '250px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜 
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小 
			localImagId.style.width = "190px";
			localImagId.style.height = "250px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片 
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}