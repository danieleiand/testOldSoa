<%@page pageEncoding="UTF-8"%>
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
	gologin(window);		
</script>
