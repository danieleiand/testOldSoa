<%-- 转向skin下对应样式中的jsp --%>
<% org.gocom.abframe.auth.bizlet.SkinUtil.redirectBySkin(request,response,String.valueOf(request.getAttribute("_nextpage")));%>