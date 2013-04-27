$(document).ready(function(){
			$("input#id").hover(function(){
				$("i#warning").text("最好使用英文，注册后不可修改……");
			},function(){
			});
         var btn=document.getElementsByTagName("button")[0];
         var userid_Field=$("input#id");
         userid_Field.blur(function(){
         	if(this.value.length!=0)
           $.get("reader_check",{"reader.readerid":this.value},function(data){
                if(data=="true"){
        		$("i#warning").text("用户名已经被占用，请更换一个……");
        		userid_Field.focus();
        		btn.disabled=true;
                }else{
                   $("i#warning").text("恭喜你，这个用户名可用……");
                   btn.disabled=false;
                }
        	});
         });
         jQuery.validator.addMethod("checkname", function (value) {
                if (/^(([\u4e00-\u9fa5])+|([a-zA-Z])+\s*([a-zA-Z])+)$/.test(value))
                    return true;
                else
                    return false;
            }, "请填写真实姓名……");
         jQuery.validator.addMethod("phone", function (value) {
                if (/^1(3[0-9]{1}|5[0-9]{1}|8[0-9]{1})\d{8}$/.test(value))
                    return true;
                else
                    return false;
            }, "手机格式错误！");
          jQuery.validator.addMethod("emailEXP", function (value) {
                if(value.length==0)
                	return true;
                else if (/^\w+@(126|163|qq|gmail|outlook|yahoo|sina)\.com$/.test(value))
                    return true;
                else
                    return false;
            }, "Email错误！");
         $("#signupForm").validate({
         	rules: {
         	"reader.readerid":{
         		required:true
         	},
         	"reader.readername":{
         		required:true,
         		checkname:true
         	},
         	"reader.password":{
required:true,
minlength:6
},
password2:{
required:true,
minlength:6,
equalTo:"#password"
},
"reader.telephone":{
	required:true,
	phone:true
},
"reader.email":{
	emailEXP:true
}
},
messages: {
	"reader.readerid":{
		required:"请输入用户名！"
	},
	"reader.readername":{
		required:"请输入真实姓名!"
	},
"reader.password":{
 required: "请输入密码!",
    minlength: "密码不能小于6位!"
},
password2:{
required: "请输入确认密码",
    minlength: "确认密码不能小于6位!",
    equalTo: "两次输入密码不一致不一致!"
},
"reader.telephone":{
	required:"请填写手机号码!"
}
}
        });
	});
            