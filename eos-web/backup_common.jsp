<%@ taglib uri="http://eos.primeton.com/tags/html" prefix="h"%>
<%@ taglib uri="http://eos.primeton.com/tags/logic" prefix="l"%>
<%@ taglib uri="http://eos.primeton.com/tags/bean" prefix="b"%>
<%@ taglib uri="http://eos.primeton.com/tags/eos" prefix="e"%>
<%@ taglib uri="http://eos.primeton.com/tags/webcomp" prefix="w"%>
<%@ taglib uri="http://eos.primeton.com/tags/richweb" prefix="r"%>
<%@ taglib uri="http://eos.primeton.com/tags/dict" prefix="d"%>
<%@page import="com.eos.data.datacontext.IUserObject"%>
<% String _headskin = "default";
   IUserObject user = (IUserObject)session.getAttribute(IUserObject.KEY_IN_CONTEXT);
   if(user!=null){
		java.util.Map map = (java.util.Map)user.getAttributes();
		if (map!=null){
		     String skin = (String) user.getAttributes().get("skin");
		     if(skin!=null&&!"".equals(skin.trim())){
		        _headskin = skin;
		     }
		}
   }
%>
<script type="text/javascript">
	var contextPath = "<%=request.getContextPath()%>";	 // you should define the contextPath of web application
	var EOSDEBUG = false;
	var FINAL_PANEL_HEIGHT = 22;
	<%-- manager(group_manager.jsp)主页面中iframe需要减少的高度 --%>
	var IFRAME_MODIFY_HEIGHE = 35;
	<%-- tree(group_tree.jsp)页面中tree需要减少的高度 --%>
	var TREE_MODIFY_HEIGHT = 22;
</script>
<h:script src="/common/javascripts/zh_CN/message.js"/>
<h:script src='<%="/common/skins/"+_headskin +"/scripts/resource.js"%>'/>
<h:script src="/common/fckeditor/fckeditor.js" />
<h:script src='<%="/common/scripts/eos-web.js.gzip"%>' />
<h:script src="/common/lib/mootools.js"/>
<h:css href='<%="/common/skins/"+_headskin +"/theme/style-sys.css"%>'/>
<h:script src="/common/javascripts/common.js" />
<h:css href='<%="/common/skins/"+_headskin +"/theme/style-component.css"%>'/>
<h:css href='<%="/common/skins/"+_headskin +"/theme/style-custom.css"%>'/>
