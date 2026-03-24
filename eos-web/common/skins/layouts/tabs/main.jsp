<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title><%=systemTitle %></title>
</head>
<frameset rows="50,21,*,19" frameborder="no" border="0" framespacing="0">
	<frame src='<%=SkinUtil.getLayoutFile("top.jsp",request) %>' scrolling="NO" frameborder="0" name="topFrame"	noresize />
	<frame src='<%=SkinUtil.getLayoutFile("toolbar.jsp",request)%>' scrolling="NO"name="toolbarFrame" noresize />

	<frameset cols="200,10,*" frameborder="0"  border="0" framespacing="0"	id="contentFrame">
		<frame src='org.gocom.abframe.auth.Frame.flow' name="menuFrame" />
		<frame src='<%=SkinUtil.getLayoutFile("slide.jsp",request) %>' name="slideFrame" noresize="noresize" scrolling="no"/>
		<frame src='<%=SkinUtil.getLayoutFile("body.jsp",request) %>' name="bodyFrame" />
	</frameset>
	<frame src='<%=SkinUtil.getLayoutFile("copyright.jsp",request) %>' scrolling="no" name="copyrightFrame" />
</frameset>
<body>
<b:message key="mframesetsupport" />
</body>
</html>
