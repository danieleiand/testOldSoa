<%@include file="/common.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title><%=systemTitle %></title>
</head>
<frameset rows="70,*,19" frameborder="NO" border="0" framespacing="0">
  <frame src="org.gocom.abframe.auth.Frame.flow" name="topFrame" scrolling="NO" noresize/>
  <frame src='<%=SkinUtil.getLayoutFile("initPanel.jsp",request) %>' name="bodyFrame_all">
  <frame src='<%=SkinUtil.getLayoutFile("Copyright.jsp",request) %>' scrolling="no">
</frameset>
</html>