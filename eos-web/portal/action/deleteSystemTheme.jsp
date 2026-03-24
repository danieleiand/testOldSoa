<%@page import="com.primeton.widget.theme.SystemThemeManager"%>
<%
String theme = request.getParameter("theme");
SystemThemeManager.deleteSysTheme(theme);
SystemThemeManager.reloadSysTheme();
out.print("{}");
%>