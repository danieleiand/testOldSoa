<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<html>
<head>
<title>异常</title>
</head>
<body>
<table width="100%" height="100%" bgcolor="#FFFFFF">
	<tr height="80%">
		<td width="100%" height="80%" align="center" style="padding-top:-60px">
		<table border="0" width="575px" height="111px"
			style="background:url(<%=request.getContextPath() %><%=SkinUtil.getStyleFileForTag("images/basic/warn.jpg",request)%>)">
			<tr height="25px" >
				<td width="80px"style="padding-left:10px;font:12px"></td>
				<td></td>
				<td></td>
			</tr>
		    <tr >
				<td></td>
				<td style="font:16px">系统异常，请立即反馈给技术支持！钉钉群号:30219005</td>
				<td></td>
			</tr>
		</table>
		
		</td>
	</tr>
	<tr height="20%">
	<td>
	<div style="display: none;"><h:exception showStacktrace="false"/></div>
	</td>
	</tr>
</table>

</body>
</html>