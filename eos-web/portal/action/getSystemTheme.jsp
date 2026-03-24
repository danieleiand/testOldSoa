<%@page contentType="text/html; charset=utf-8" %>
<%@page import="com.primeton.widget.util.PortalUtil"%>
<%@page import="com.primeton.portal.purview.entity.SysClient"%>
<%@page import="com.primeton.widget.theme.SystemThemeManager"%>
<%@page import="java.util.List"%>
<%@page import="com.primeton.portal.purview.entity.Client"%>
<%@page
	import="com.primeton.portal.purview.service.ClientManagerService"%>
<%@page import="com.primeton.json.JSONArray"%>
<%@page import="com.primeton.json.JSONObject"%>

<%
	String userId = PortalUtil.getUserId(session);
	ClientManagerService clientService = new ClientManagerService();
	List<Client> clients = clientService.searchClientById(userId);
	List<SysClient> sysClients = SystemThemeManager.getSysClientList();

	JSONArray themes = new JSONArray();
	for (SysClient client : sysClients) {

			
		JSONObject theme = new JSONObject();
		theme.put("tabId", client.getTabId());
		theme.put("tabTitle", client.getTabTitle());
		theme.put("isSys", true);
		theme.put("icon",client.getIcon());
		theme.put("status",client.getStatus());
		themes.put(theme);
		clients.remove(client);
	
			
		
	}
	
	out.print("=" + themes.toString());
%>
