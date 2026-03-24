<%@page import="com.primeton.widget.constant.Constants"%>
<%@page import="com.primeton.portal.purview.entity.BaseClient"%>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%@page import="java.util.Set"%>
<%@page import="com.primeton.widget.theme.SystemThemeManager"%>
<%@page import="com.primeton.widget.auth.User"%>
<%@page import="com.primeton.widget.auth.AuthManager"%>
<%@page import="com.primeton.widget.impl.PortletWidget"%>
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

	String theme = request.getParameter("theme");
	if (theme == null)
		theme = "main";

	BaseClient client=CacheUtil.getTheme(theme,session);
	if (client == null) {
		out.print("{userportal:'',userPortalinfos:[]}");
	} else {
		//	String userPortal = "402880d12529f85601252a06954a0002,402880ac2520d8bf012520d8c3e10002;402880d12529f856012529f8d2950001";
	
		Set<String> lockedWidget= SystemThemeManager.getLockedSystemWidget(theme);

		String userPortal = client.getWidgets();
		response.setCharacterEncoding("utf-8");
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
			User user=(User)session.getAttribute("portal_user");
			if (AuthManager.checkWidgetPermission(widget,user) == false)
			{
//				没有权限不显示widget	
                String reg="(,"+portalId+";)|"+"(;"+portalId+",)";
                userPortal=userPortal.replace(reg,";");
            	userPortal=userPortal.replace(","+portalId+",",",");	
				userPortal=userPortal.replace(portalId+",","");
				userPortal=userPortal.replace(","+portalId,"");
				userPortal=userPortal.replace(portalId,"");
				continue;
			}			
		
			
			JSONObject widgetObject = new JSONObject();
			
			widgetObject.put("portalid", widget.getId());
			widgetObject.put("widgetId",widget.getWidgetId());
			
			boolean locked=lockedWidget==null?true:!lockedWidget.contains(widget.getId());
			
			widgetObject.put("closable",locked);
			if (widget.getWidgetType() == 5) {
		        widgetObject.put("type", "portal");
			}
			{
		AbstractWidget abstractWidget = WidgetContainer
				.getWidget(widget.getPath(), widget
				.getWidgetId());
		if (abstractWidget == null) {
			continue;
		}

		widgetObject.put("title", abstractWidget.getTitle());
		widgetObject.put("type", abstractWidget.getType());
		widgetObject.put("icon", abstractWidget.getIcon());
		if (abstractWidget.getHeight() != null)
			widgetObject.put("attribute", "height="
			+ abstractWidget.getHeight());
		if (abstractWidget instanceof UiWidget) {
			widgetObject.put("url", ((UiWidget) abstractWidget)
			.getUrl());
		} else if (abstractWidget instanceof GoogleWidget) {
			widgetObject.put("url",
			((GoogleWidget) abstractWidget).getUrl());
		} else if (abstractWidget instanceof UrlWidget) {
		//url类型widget处理
			
			if(widget.getApplication()!=null&&(!widget.getApplication().equals("")))
			{
				String appAdress=	widget.getApplication().getUrl();
				String context=widget.getApplication().getAppName();
				String action=((UrlWidget) abstractWidget).getUrl();
				
			   if(context==null||"".equals(context))
				  {
				  request.setAttribute(Constants.APP_ADDR, appAdress);
				  widgetObject.put("url",appAdress+	((UrlWidget) abstractWidget).getUrl());
				  }
				else
				{
				widgetObject.put("url",appAdress+"/"+widget.getApplication().getAppName()+"/"+
				((UrlWidget) abstractWidget).getUrl());
				 request.setAttribute(Constants.APP_ADDR, appAdress+"/"+widget.getApplication().getAppName()+"/");
				}
			}
			else
			{
			 request.removeAttribute(Constants.APP_ADDR);
			 widgetObject.put("url",	((UrlWidget) abstractWidget).getUrl());
			}
			
			if("sycnHTML".equals(((UrlWidget) abstractWidget).getMode()))
			{//同步html处理
			
			try{
			
			 String outStr=abstractWidget.getResponse(request,response).toString();
			 widgetObject.put("html",outStr.substring(1));
			 
			 }catch(Throwable e)
			 {
			 e.printStackTrace();
			  widgetObject.put("html","");
			 }
			 
			}
			 widgetObject.put("mode",	((UrlWidget) abstractWidget).getMode());
			
		} else if (abstractWidget instanceof HtmlWidget) {
		
				widgetObject
				.put("html",
				((HtmlWidget) abstractWidget)
						.getHtml());
				widgetObject.put("script",
				((HtmlWidget) abstractWidget)
				.getScript());
		
		} else if (abstractWidget instanceof PortletWidget) {
			widgetObject.put("portalUrl",
			((PortletWidget) abstractWidget).getUri()
					+ "."
					+ ((PortletWidget) abstractWidget)
					.getWidgetId());
		}
			}
			portalArray.put(widgetObject);
		}
		portalInfo.put("userportal", userPortal);
		out.print(portalInfo.toString());
	}
%>
