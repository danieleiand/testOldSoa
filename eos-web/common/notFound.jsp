<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp"%>
<%response.setStatus(HttpServletResponse.SC_OK);%>
 <%String v=request.getRequestURL().toString();String m=(String)request.getAttribute("javax.servlet.error.message");
         %>


<html>
<head>
<title><b:message key="eos_ricweb_notFound_pagenotexist"/></title>
</head>
<body>
<table width="100%" height="100%" bgcolor="#FFFFFF">
	<tr height="80%">
		<td width="100%" height="80%" align="center" style="padding-top:-60px">
		<table border="0" width="575px" height="111px"
			style="background:url(<%=request.getContextPath() %>/common/skins/skin0/images/basic/warn.jpg)">
			<tr height="25px" >
				<td width="80px"style="padding-left:10px;font:12px"><b:message key="eos_ricweb_notFound_prompt"/></td>
				<td ></td>
				<td></td>
			</tr>
		    <tr >
				<td></td>
				<td id="msg" style="font:16px;word-break:break-all"><b:message key="eos_ricweb_notFound_url"/>:
				<%
				  if(m.endsWith(".jsp")) out.println(v.replaceAll("/common/notFound.jsp",m));
				  else
				  out.println(v.replaceAll(request.getContextPath()+"/common/notFound.jsp",m));
				  %>
				<b:message key="eos_ricweb_notFound_notexist"/>.</td>
				<td></td>
			</tr>
		</table>
		
		</td>
	</tr>
	<tr height="20%">
	<td>
	
	</td>
	</tr>
</table>
</body>
</html>
