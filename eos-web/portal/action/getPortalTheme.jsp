<%@page contentType="text/html; charset=utf-8" %>
<%@page import="com.primeton.portal.purview.entity.BaseClient"%>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.primeton.portal.purview.entity.Client"%>
<%@page import="com.primeton.json.JSONArray"%>
<%@page import="com.primeton.json.JSONObject"%>

<%

   List<BaseClient> clients= CacheUtil.getThemeList(session);
   JSONArray themes = new JSONArray();
   for (BaseClient client : clients) {
		JSONObject theme = new JSONObject();
		theme.put("tabId", client.getTabId());
		theme.put("tabTitle", client.getTabTitle());
		theme.put("isSys", ((Client)client).isSys());
		theme.put("icon",client.getIcon());
		themes.put(theme);
	}
   //System.out.println(themes.toString());
	out.print("=" + themes.toString());
/*

String userId = (String) session
			.getAttribute("edu.yale.its.tp.cas.client.filter.user");
	ClientManagerService clientService = new ClientManagerService();
	List<Client> clients = clientService.searchClientById(userId);
	List<SysClient> sysClients = SystemThemeManager.getSysClientList();

	JSONArray themes = new JSONArray();
	
	for (SysClient cs : sysClients) {
		for (Client client : clients) {
			if (cs.getTabId().equals(client.getTabId())) {
		JSONObject theme = new JSONObject();
		theme.put("tabId", client.getTabId());
		theme.put("tabTitle", client.getTabTitle());
		theme.put("icon",client.getIcon())
		theme.put("isSys", true);
		themes.put(theme);
		clients.remove(client);
		break;

			}
		}
	}
		for (Client client : clients) {
			JSONObject theme = new JSONObject();
			theme.put("tabId", client.getTabId());
			theme.put("tabTitle", client.getTabTitle());
			theme.put("icon",client.getIcon())
			theme.put("isSys", false);
			themes.put(theme);
		}
	*/

	
	
%>
