<%@page pageEncoding="UTF-8"%>
<% 
   String contextPathStr = request.getContextPath();
%>
<script>
	function getParent(win){
	   return win.opener||win.parent;
	}
	function hasParent(win){
	   var pw = getParent(win);
	   return pw!=null&&pw!=win;
	}
	function gologin(win){
	  if(hasParent(win)){
	     getParent(win).location='<%=request.getContextPath() %>/login.jsp';
	     self.close();
	  }else{
	    win.location='<%=request.getContextPath() %>/auth/login.jsp'
	  }
	}
//跳转
	//gologin(window);	
	
	function isDialog(win){ 
	 return !(win.dialogArguments==undefined||win.dialogArguments==null||typeof(win.dialogArguments)=="undefined");
	}
	function isOpened(win){
	  return !(win.opener==undefined||win.opener==null||typeof(win.opener)=="undefined");
	}
	function finalpage(str,win){
		if(str==null||str==""){
	    	win.location='<%=contextPathStr %>/portal/share/portal.ui';
		}else if(str=="isAbframeLogout"){
			win.location='<%=contextPathStr %>/auth/login.jsp';
		}else{
	  		win.location='<%=contextPathStr %>/portal/share/portal.ui';
		}
	}
	finalpage('<%=request.getParameter("isAbframeLogout")%>',top);
</script>
