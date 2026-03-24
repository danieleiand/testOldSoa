<%@page import="com.primeton.widget.theme.SystemThemeManager"%>
<%
request.setCharacterEncoding("utf-8");
String icon= request.getParameter("icon");
String theme = request.getParameter("theme");
String themeId=request.getParameter("themeId");
String status=request.getParameter("status");
SystemThemeManager.updateSysTheme(themeId,theme,icon,status);
SystemThemeManager.reloadSysTheme();
out.print("{}");

%>