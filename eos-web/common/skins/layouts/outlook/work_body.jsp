<%@include file="/common.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>

<frameset rows="*" cols="180,10,*" framespacing="0" frameborder="no" border="0" id="oa_frame">
	<frame src='<%=SkinUtil.getLayoutFile("work_body_leftTree.jsp",request) %>' name="leftFrame" noresize>
	<frame src='<%=SkinUtil.getLayoutFile("tool_mid.jsp",request) %>' scrolling="no" name="middleqwe" noresize>
	<frame src="" name="bodyFrame">
</frameset>
</html>