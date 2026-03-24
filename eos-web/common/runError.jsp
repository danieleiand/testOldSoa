<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>

<html>
<head>
<title><b:message key="eos_richweb_defaultEnd_jsp_title" /></title>
</head>
<body>
<table width="100%" height="100%" bgcolor="#FFFFFF">
	<tr height="80%">
		<td width="100%" height="80%" align="center" style="padding-top:-60px">
		<table border="0" width="575px" height="111px"
			style="background:url(<%=request.getContextPath() %><%=SkinUtil.getStyleFileForTag("images/basic/warn.jpg",request)%>)">
			<tr height="25px" >
				<td width="80px"style="padding-left:10px;font:12px"><b:message key="eos_richweb_defaultEnd_jsp_sign"/></td>
				<td></td>
				<td></td>
			</tr>
		    <tr >
				<td></td>
				<td style="font:16px">系统繁忙！请稍后再试！或联系管理员！</td>
				<td></td>
			</tr>
		</table>
		
		</td>
	</tr>
	<tr height="20%">
	<td>
	<a href="javascript:void(0)" onclick="showExInfo()">...</a>
	</td>
	</tr>
</table>
<script type="text/javascript">
function showExInfo(){
	if("" == $id('ex').style.display)
	{
		$id('ex').style.display = "none";
	}else{
		$id('ex').style.display = "";
	}
	
}
</script>
<div style="display: none;" id="ex">
<% try{%>
<h:exception showErrorNo = "true" showStacktrace="true"/>
<% } catch(Exception e){

} %>
</div>
</body>
</html>