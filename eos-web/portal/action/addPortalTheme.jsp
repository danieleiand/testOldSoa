<%@page import="com.primeton.widget.util.PortalUtil"%>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%@page import="com.primeton.portal.purview.entity.Client"%>
<%@page import="com.primeton.portal.purview.service.ClientManagerService"%>
<%
request.setCharacterEncoding("utf-8");
String userId = PortalUtil.getUserId(session);

ClientManagerService clientService = new ClientManagerService();

String theme = request.getParameter("theme");
String icon= request.getParameter("icon");
String themeId=""+System.currentTimeMillis();
System.out.println(icon); 
//if (icon==null||"".equals(icon)) icon="/portal/images/home.gif"; 
//无图标时不再做处理
//(new java.util.Random()).nextInt();
Client client = clientService.searchClient(userId,themeId);
if(client==null){
	client = new Client();
	client.setUserId(userId);
	client.setTabId(themeId);
	client.setTabTitle(theme);
	client.setIcon(icon);
	clientService.insert(client);
	CacheUtil.addTheme(client,themeId,session);
	out.print("{themeId:'"+themeId+"'}");
}
else
{
out.print("{exception:{code:123456,message:'Add theme failed.'}}");
}

%>