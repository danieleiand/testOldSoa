<%@page import="com.primeton.widget.util.PortalUtil"%>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%
    String userId = PortalUtil.getUserId(session);
	CacheUtil.resetUserSystemPortalInfo(userId, session);
%>{}
