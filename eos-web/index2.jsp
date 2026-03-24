<%@page pageEncoding="UTF-8"%>

<html>
<%-- 
  - Author(s): 贺卫龙
  - Date: 2011-01-27 21:29:07
  - Description:
--%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Title</title>
</head>
<body>
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


//gotourloamin("<%=request.getContextPath()%>/portal/share/portal.ui","newwindows_main" + new Date().getTime());
window.location.href = "<%=request.getContextPath()%>/portal/share/portal.ui";
</script>
</body>
</html>