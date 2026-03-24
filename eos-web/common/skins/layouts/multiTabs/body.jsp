<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title>Title</title>
</head>
<body margin="0" leftmargin="0" topmargin="0" >
<<frameset rows="50,*" frameborder="no" border="0" framespacing="0">
	<frame src="<%=SkinUtil.getLayoutFile("bodyTop.jsp",request) %>" scrolling="NO" frameborder="0" name="tabFrame"	noresize />
    <frame src="<%=SkinUtil.getLayoutFile("bodyMain.jsp",request) %>" name="bodyMainFrame">
</frameset>
<h:img src="images/body.jpg" width="100%" height="99%" />
<body>
<b:message key="mframesetsupport" />
</body>
</html>