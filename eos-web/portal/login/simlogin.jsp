<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="com.primeton.widget.simlogin.SimLogin" %>
<%@ page import="com.primeton.widget.simlogin.IEncodePassword" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	Map<String,String> encodeMap = new HashMap<String,String>();
	encodeMap.put("SIMDEMO","com.primeton.widget.simlogin.EncodePasswordDemo");
	//添加更多加密类,key值是Appid，value值是加密算法实现类
	

%>



<%
    String appid = request.getParameter("appid");
    String username = (String)session.getAttribute("edu.yale.its.tp.cas.client.filter.user");
    if(appid == null)
    {
    %>
    <body>
		未获取appid。
	</body>
	<%
    }
    else if(username == null)
    {
    %>
    <body>
		Session已失效。
	</body>
	<%
    }
    else
    {
    String action = request.getParameter("action");
	SimLogin sl = new SimLogin(username,appid);
	if(sl.isAppUser())
	{
	String appusername = sl.getAppUsername();
	String appuserpassword = sl.getAppUserpwd();
	%>
	<html>
	<head>
	<title>SimLogin</title>
	<script>
		function goLogin() {
			document.getElementById("goLogin").submit();
		}
	</script>
	</head>
	<body onload="goLogin();">
		<form id="goLogin" action="<%=action%>" method="post">
			<input type="hidden" name='username' value='<%= appusername%>'/>
<% 
	if(encodeMap.containsKey(appid))
	{
	String classname = encodeMap.get(appid);
	Class encodePasswordClass = Class.forName(classname);
	IEncodePassword encodePasswordFactory = (IEncodePassword)encodePasswordClass.newInstance();
	String encodePassword = encodePasswordFactory.encodePassword(appuserpassword);
%>
			<input type="hidden" name='password' value='<%= encodePassword%>'/>
<%	} 
	else
	{
	%>
			<input type="hidden" name='password' value='<%= appuserpassword%>'/>
	<%} %>
		</form>
	</body>
    </html>
	<%
	}
	else
	{
	%>
	<body>
		未建立该SSO用户与该应用的对应关系，请修改Portal_UserMap表。
	</body>
	<%
	}
	}
	
%>

