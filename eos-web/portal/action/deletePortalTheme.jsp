<%@page import="com.primeton.widget.util.PortalUtil"%>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%@page import="com.primeton.portal.purview.service.ClientManagerService"%>
<%
String userId = PortalUtil.getUserId(session);
ClientManagerService clientService = new ClientManagerService();

String theme = request.getParameter("theme");
clientService.delete(userId,theme);
CacheUtil.deleteTheme(theme,session);
out.print("{}");

%>