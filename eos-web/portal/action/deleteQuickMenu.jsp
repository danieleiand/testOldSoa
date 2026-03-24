<%@page import="com.primeton.widget.util.PortalUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.primeton.portal.purview.service.QuickMenuManagerService"%>
<%@page import="com.primeton.portal.purview.entity.QuickMenu"%>
<%@page pageEncoding="UTF-8"%>
<%

    QuickMenuManagerService qms = new QuickMenuManagerService();
	

	
	String mid = request.getParameter("nodeId");
	
	QuickMenu qm = new QuickMenu();
	qm.setId(mid);
	QuickMenu[] qmArr = new QuickMenu[1];
	qmArr[0] = qm;
	qms.delete(qmArr);
	out.print("{}");
%>
