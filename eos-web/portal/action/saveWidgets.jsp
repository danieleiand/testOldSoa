<%@page import="com.primeton.widget.util.PortalUtil"%>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%@page import="com.primeton.portal.purview.entity.Client"%>
<%@page import="com.primeton.portal.purview.service.ClientManagerService"%>
<%

String userId = PortalUtil.getUserId(session);
ClientManagerService clientService = new ClientManagerService();
String theme=request.getParameter("theme");
if(theme==null) theme="main";
Client client = clientService.searchClient(userId,theme);
boolean isInsert = false;
if(client==null){
	client = new Client();
	client.setUserId(userId);
	client.setTabId("main");
	client.setTabTitle("main");
	isInsert = true;
}
String colMum = request.getParameter("colMum");
if(colMum!=null){
	client.setColNum(Integer.parseInt(colMum));
}

String colWidth = request.getParameter("colWidth");
if(colWidth!=null){
	client.setColWidth(colWidth);
}

String widgets = request.getParameter("widgets");
if(widgets!=null){
	client.setWidgets(widgets);
}

if(isInsert){
	clientService.insert(client);
}else{
	clientService.update(client);
}
CacheUtil.setTheme(theme,colMum,colWidth,widgets,session);
out.print("{}");

%>