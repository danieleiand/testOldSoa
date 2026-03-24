<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%@page import="com.primeton.widget.skin.SkinUtil"%>
<%
    String mode = request.getParameter("mode");
	String skin = request.getParameter("skin");
	//session.setAttribute("__skin",skin);
	SkinUtil.saveSkin(request);
	CacheUtil.setStyle(skin, session);
	if(mode==null)
	{
%>
{}
<%
}
else
{
 %>
<script>
top.location.reload();
</script>
 <%
 }
 %>