<%@page import="com.primeton.widget.util.PortalUtil"%>
<%@page import="java.util.List"%>
<%@page
	import="com.primeton.portal.purview.service.QuickMenuManagerService"%>
<%@page import="com.primeton.portal.purview.entity.QuickMenu"%>
<%@page pageEncoding="UTF-8"%>
<%

    QuickMenuManagerService qms = new QuickMenuManagerService();
	

	
	String name = request.getParameter("name");
	String openMode = request.getParameter("openMode");
	String action = request.getParameter("action");
	String systemName = request.getParameter("systemName");



    String userId = PortalUtil.getUserId(session);

	if(qms.searchQuickMenu(userId,action).size()!=0)
	{
	out.print("{}");
	return;
	};
    
    List maxs=	qms.getMaxSort(userId);
	
	Integer max=new Integer(0);

	if(maxs!=null&&maxs.get(0)!=null) max=(Integer) maxs.get(0);
	QuickMenu qm = new QuickMenu();
	qm.setUserId(userId);
	qm.setMenuName(name);
	qm.setAction(action);
	qm.setOpenMode(new Integer(openMode));
	qm.setSort(max+1);
	qm.setSystemName(systemName);

	

	qms.insert(qm);
	out.print("{}");
%>
