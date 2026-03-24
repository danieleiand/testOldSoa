<%@page import="com.primeton.portal.purview.entity.SysClient"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.primeton.widget.theme.SystemThemeManager"%>
<%@page import="com.primeton.widget.auth.User"%>
<%@page import="com.primeton.widget.auth.AuthManager"%>
<%@page import="com.primeton.widget.impl.PortletWidget"%>
<%@page import="com.primeton.portal.purview.entity.Client"%>
<%@page
	import="com.primeton.portal.purview.service.ClientManagerService"%>
<%@page import="com.primeton.widget.impl.HtmlWidget"%>
<%@page import="com.primeton.widget.impl.UrlWidget"%>
<%@page import="com.primeton.widget.impl.GoogleWidget"%>
<%@page import="com.primeton.widget.impl.UiWidget"%>
<%@page import="com.primeton.widget.impl.WidgetContainer"%>
<%@page import="com.primeton.json.JSONArray"%>
<%@page import="com.primeton.json.JSONObject"%>
<%@page import="com.primeton.widget.impl.AbstractWidget"%>
<%@page import="com.primeton.portal.purview.entity.Widget"%>
<%@page import="com.primeton.widget.manager.WidgetManager"%>
<%
            
response.setCharacterEncoding("utf-8");
String theme = request.getParameter("theme");

//临时代码
SystemThemeManager.reloadSysTheme();

List<SysClient> sysClientList=   SystemThemeManager.getSysClientList();

	SysClient client=null;
	
for(SysClient c:sysClientList)
{
	if(c.getTabId().equals(theme))
	{
		client=c;
		break;
	}
}
	

if (theme == null)
		theme = "main";
	
	if (client == null) {
		out.print("{userportal:'',userPortalinfos:[]}");
	} else {
		//	String userPortal = "402880d12529f85601252a06954a0002,402880ac2520d8bf012520d8c3e10002;402880d12529f856012529f8d2950001";
	
		Set<String> lockedWidget= SystemThemeManager.getLockedSystemWidget(theme);

		String userPortal = client.getWidgets();

		if (userPortal == null) {
			userPortal = "";
		}
		String[] portalIds = userPortal.split(",|;");
		JSONObject portalInfo = new JSONObject();
		
		portalInfo.put("columNum", client.getColNum());
		portalInfo.put("columWidth", client.getColWidth());
		JSONArray portalArray = new JSONArray();
		portalInfo.put("userPortalinfos", portalArray);
		for (String portalId : portalIds) {
				Widget widget = WidgetManager.getWidget(portalId);
			if (widget == null) {
		continue;
			}
			
			AbstractWidget abstractWidget = WidgetContainer
			.getWidget(widget.getPath(), widget
			.getWidgetId());
			if (abstractWidget == null) {
				continue;
			}	
			JSONObject widgetObject = new JSONObject();
			
			widgetObject.put("portalid", widget.getId());
			widgetObject.put("title", abstractWidget.getTitle());
			widgetObject.put("locked", lockedWidget.contains(widget.getId()));
			if (abstractWidget.getHeight() != null)
				widgetObject.put("attribute", "height="
				+ abstractWidget.getHeight());
			//widgetObject.put("type", abstractWidget.getType());
			
			widgetObject.put("icon", abstractWidget.getIcon());
			
			portalArray.put(widgetObject);
		}
		portalInfo.put("userportal", userPortal);
		out.print(portalInfo.toString());
	}
%>
