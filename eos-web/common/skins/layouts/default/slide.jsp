<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="org.gocom.abframe.auth.bizlet.SkinUtil"%>
<html>
<head>
<title>Title</title>
<script language="JavaScript">
var flag = false;
function shift_status()
{   var pframe = parent.document.getElementById("contentFrame");
    var img = document.getElementById("menuSwitch");
    var opencols = "200,10,*";
    var closecols="0,10,*";
	if(flag)
	{
		if(screen.width>1024)
			pframe.cols = opencols
		else if(screen.width>800)
			pframe.cols = opencols;
		else
			pframe.cols = opencols;
		img.src='<%=SkinUtil.getStyleFile("images/abf/slideopened.gif",request)%>';
		img.title='隐藏';
	}
	else
	{
		pframe.cols = closecols;
		img.src='<%=SkinUtil.getStyleFile("images/abf/slideclosed.gif",request)%>';
		img.title='显示';
	}

	flag = !flag;
}
</script>
</head>
<body onclick="shift_status()" leftmargin="0" topmargin="0" background='<%=SkinUtil.getStyleFile("images/abf/sideline.gif",request)%>'>
    <div style="Position : Absolute ;Left : 0px ;Top : 150px ;" ><img src='<%=SkinUtil.getStyleFile("images/abf/slideopened.gif",request)%>' id="menuSwitch" title='隐藏' ></div>
</body>
</html>