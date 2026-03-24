<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/common.jsp"%>
<%@page import="org.gocom.abframe.auth.bizlet.LogonUtil"%>
<html>
<head>
<title></title>
<style>
body{margin: 0;padding: 0;font-size: small;}
div{float:right;}
ul {margin-top:2}
li {float:left; margin-left:20;font-size: 9pt;}
</style>
</head>
<body background="images/topback.gif" leftmargin="0" topmargin="0" >
<div >
<%if(LogonUtil.isLogon(request)){%>
   <ul>
	<li><b:message key="l_welcome" ><b:msgparam  property="userObject/userId" scope="session"/><b:msgparam  property="userObject/userName" scope="session" /></b:message></li>
	<li><a href="org.gocom.abframe.auth.Login.flow?_eosFlowAction=logout" target="_top"><b:message key="l_logout" /></a></li>
	<li><a href="#"><b:message key="l_help" /></a></li>
   </ul>
<%}else{%>
   <ul>
	<li><a href="org.gocom.abframe.auth.Login.flow" target="_top"><b:message key="l_login" /></a></li>
	<li><a href="#"><b:message key="l_help" /></a></li>
   </ul>
<%} %>
</div>
</body>
</html>
