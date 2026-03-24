<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  Object userPortalInfo = session.getAttribute("__USER_PORTAL_INFO");
  if(userPortalInfo==null)
  { 
  %>
 <jsp:include flush="true" page='/portal/login/loginFailure.jsp'></jsp:include>
 
 <%
    return;
  }
  %>
  
 
<%

   
        boolean debugMode=true;//20110629 stephen修改
       
		String contextPath = request.getContextPath() ;
		String pageTitle="";
		//String jsURI = request.getRequestURI();
		String jsURI = (String)request.getAttribute("NAZCA.UI_PATH");
	    String debugResource = request.getRequestURI().substring(
				contextPath.length());
		//String includes = (String)request.getAttribute("eos_includes");
			String skin=null;
		
		 skin=CacheUtil.getUserStyle(session);
	
		
		

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.primeton.ris.runtime.Context"%>
<%@page import="com.primeton.ris.model.common.ExtendResourceManager"%>
<%@page import="java.io.File"%>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=pageTitle%></title>
<script> 
    window.WEB_ROOT='<%=contextPath %>';
    var DEBUG_RESOURCE='<%=debugResource %>'  
    var portalSkin='<%=skin%>';
    var portalEffect=true;
</script>

<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/ext/skins/<%=skin%>/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/ext/skins/<%=skin%>/css/portal.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/nazca/style/common.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/nazca/style/runtime.css" />

<% if(debugMode==false){%>

<script type="text/javascript" src="<%=contextPath%>/webui/nazca/javascript/lib.js" ></script>

<%
}else
{
 %>

<script type="text/javascript" src="<%=contextPath%>/webui/ext/source/core/Ext.js"></script>
<script type="text/javascript" src="<%=contextPath%>/webui/ext/source/adapter/ext-base-extend.js"></script>
<script type="text/javascript" src="<%=contextPath%>/webui/ext/ext-all.js"></script>
<script type="text/javascript" src="<%=contextPath%>/webui/nazca/javascript/eos-ext-runtime.js"></script>
<script type="text/javascript" src="<%=contextPath%>/portal/js/Portal.js"></script>
<script type="text/javascript" src="<%=contextPath%>/portal/js/PortalColumn.js"></script>
<script type="text/javascript" src="<%=contextPath%>/portal/js/Portlet.js"></script>
<script type="text/javascript" src="<%=contextPath%>/portal/js/portalUtil.js"></script>
<script type="text/javascript" src="<%=contextPath%>/portal/js/portalLoader.js"></script>

<%
}
 %>
 
<script type="text/javascript"> Ext.BLANK_IMAGE_URL = '<%=contextPath%>/webui/ext/resources/images/default/s.gif';</script>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/portal/css/common.css" />



<% 
	String customfile=request.getRealPath("/webui/ria-common-custom.jsp");
	File cf=new File(customfile);
	if( cf.exists()) {
%>
	<jsp:include flush="true" page='/webui/ria-common-custom.jsp'></jsp:include>
<% }%>

<%
String extResource=ExtendResourceManager.getInstance().getResourceDefine();
if(extResource!=null) out.println(extResource);

if(Context.getInstance().isDebug()){%>
	<script type="text/javascript">
	   var jsDebugPort = "<%=System.getProperty("JSDEBUG_PORT") %>";
	   var contextPath = "<%=contextPath %>";
	</script>
	<script type="text/javascript" src="<%=contextPath%>/webui/nazca/javascript/nazca-debug.js"></script>

<%}%>
<%

if(jsURI.endsWith(".ui")){	jsURI = jsURI + ".jsp";}else{ jsURI=""; };
 %>

<script  type="text/javascript"  src="<%=contextPath%>/common/scripts/eos-web.js" ></script>
<script  type="text/javascript"  src="<%=contextPath%>/common/lib/mootools.js" ></script>
<link href="<%=contextPath%>/common/skins/styles/<%=skin %>/theme/style-component.css" type="text/css" rel="stylesheet" >




<script>
blankURL="<%=request.getContextPath()%>/common/blank.jsp"
</script>
<script type="text/javascript">
	<jsp:include flush="true" page='<%=jsURI%>'></jsp:include>
</script>


</head>
<body></body>
</html>