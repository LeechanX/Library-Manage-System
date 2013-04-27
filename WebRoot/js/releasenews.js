	var exist=0;
		 window.onload=function(){
		 	 document.getElementById('createid').disabled=false;
		 document.getElementById('removeid').disabled=true;
		 document.getElementById('releaseid').disabled=true;
	};
		function createEditor() {
		     if(exist==0){
		     document.getElementById("editor").style.display="";
		        var str="<label><input type='text' name='news.newsname' class='span5' onkeyup='return check()' onmousedown='return check()' onblur='return check()'/><small>新闻标题</small><p id='warning'></p></label>"; 
		        str+="<textarea id='edit'  rows='30' cols='50' name='news.contentpath'></textarea>";
		        document.getElementById("editor").innerHTML=str;
		        CKEDITOR.replace('news.contentpath',{
                       	uiColor: '#FFF8DC'
                 });
		        exist=1;
		        document.getElementById('createid').disabled=true;
		        document.getElementById('removeid').disabled=false;
		        document.getElementById('releaseid').disabled=false;
		     }
		}
		function removeEditor() {
			if(exist==1){
			  document.getElementById("editor").style.display="none";
			  document.getElementById('createid').disabled=false;
		      document.getElementById('removeid').disabled=true;
		      document.getElementById('releaseid').disabled=true;			 
			  exist=0;
			}
		}
		function releaseit(){  
	      document.eform.submit();
		}
		function check(){
		    if(document.eform.title.value.length>0 &&document.eform.title.value.length<=40){
		       document.eform.title.style.borderColor="";
		       document.eform.title.style.backgroundColor="";
		       document.getElementById("warning").innerHTML="";
		    return true;
		    }else if(document.eform.title.value.length>40){
		       document.eform.title.focus();
		       document.eform.title.style.borderColor="#FF4040";
		       document.eform.title.style.backgroundColor="#FAEBD7";
		       var st=document.eform.title.value;
		       document.getElementById("warning").innerHTML="<zt class='lcxred'>新闻标题不得多于40字!</zt>";
		       return false;
		    }
		       document.eform.title.style.borderColor="#FF4040";
		       document.eform.title.style.backgroundColor="#FAEBD7";
		       document.getElementById("warning").innerHTML="<zt class='lcxred'>新闻标题必填!</zt>";
		}