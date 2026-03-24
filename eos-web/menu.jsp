<%@page import="com.eos.data.datacontext.IUserObject"%>
<%
   String skinstyle = "default";
   IUserObject user = (IUserObject)session.getAttribute(IUserObject.KEY_IN_CONTEXT);
   if(user!=null){
     String skin = (String) user.getAttributes().get("skin");
      if(skin!=null&&!"".equals(skin.trim())){
         skinstyle = skin;
      }
   }
	request.getRequestDispatcher("common/skins/"+skinstyle+"/menu.jsp").forward(request,response); 
%>