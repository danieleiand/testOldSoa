<%@page import="com.primeton.widget.theme.SystemThemeManager"%>
<%
	String theme = request.getParameter("theme");
	String widgets = request.getParameter("widgets");
	String widgetStatus = request.getParameter("widgetStatus");
	SystemThemeManager.saveSystemWidget(theme, widgets, widgetStatus);
	SystemThemeManager.reloadSysTheme();
	out.print("{}");
%>
