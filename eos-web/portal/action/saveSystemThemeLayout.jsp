<%@page import="com.primeton.widget.theme.SystemThemeManager"%>
<%
String theme=request.getParameter("theme");
String colMum = request.getParameter("colMum");
String colWidth = request.getParameter("colWidth");
SystemThemeManager.saveSystemLayout(theme,Integer.parseInt(colMum),colWidth);
String widgets = request.getParameter("widgets");
out.print("{}");
%>