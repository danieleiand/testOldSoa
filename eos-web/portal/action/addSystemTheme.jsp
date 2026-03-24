<%@page import="com.primeton.widget.theme.SystemThemeManager"%>
<%@page import="com.primeton.portal.purview.entity.Client"%>
<%@page import="com.primeton.portal.purview.service.ClientManagerService"%>
<%
request.setCharacterEncoding("utf-8");
String icon= request.getParameter("icon");
String theme = request.getParameter("theme");
String status= request.getParameter("status");
String themeId="nSYSTHEME_"+System.currentTimeMillis();
//(new java.util.Random()).nextInt();
SystemThemeManager.addSysTheme(themeId,theme,icon,status);
SystemThemeManager.reloadSysTheme();
out.print("{themeId:'"+themeId+"'}");
%>