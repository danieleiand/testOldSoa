<%@page pageEncoding="UTF-8"%>
<script>
	function getParent(win){
	   return win.opener||win.parent;
	}
	function hasParent(win){
	   var pw = getParent(win);
	   return pw!=null&&pw!=win;
	}
	function gologin(win){
	  if(hasParent(win)){
	     getParent(win).location='<%=request.getContextPath() %>/login.jsp';
	     self.close();
	  }else{
	    win.location='<%=request.getContextPath() %>/auth/login.jsp'
	  }
	}
//跳转
	gologin(window);		
</script>

<script language="javascript">
	function gotourloamin(url,sname)
{
	var objNewWin;				
    var w=screen.availWidth-8;
	var h=screen.availHeight-32;
	objNewWin = window.open(url,sname,"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=" + w + ",height=" + h + ",top=0,left=0");

	var version=parseInt(navigator.appVersion.split("MSIE")[1]);
	if (version>=7) {	//IE7的无提示关闭窗口比较特别
		window.open("","_self","");
	}
	else {
		window.opener = null;
	}
	window.close();
	objNewWin.focus();	
}
	//gotourloamin("<%=request.getContextPath() %>/auth/login.jsp","韵达快运SOA平台"+new Date().getTime());
</script>

