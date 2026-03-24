<%@include file="/common.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>菜单</title>
<style type="text/css">
<!--
A.ssmItems:link		{color:black;text-decoration:none;}
A.ssmItems:hover	{color:black;text-decoration:none;}
A.ssmItems:active	{color:black;text-decoration:none;}
A.ssmItems:visited	{color:black;text-decoration:none;}
//-->
</style>
<h:script src='<%=SkinUtil.getLayoutFileForTag("scripts/ssm.js",request)%>' />
<h:script src='<%=SkinUtil.getLayoutFileForTag("scripts/menu.js",request)%>' />
<h:script src="org.gocom.abframe.auth.Frame.flow?_eosFlowAction=quickmenu" />
<script>
//应用列表
var apps = new Array();
<l:iterate id="apps" property="apps">
apps['<b:write property="appid" iterateId="apps" />']={
appid:'<b:write property="appid" iterateId="apps" />',
appcode:'<b:write property="appcode" iterateId="apps" />',
appname:'<b:write property="appname" iterateId="apps" />',
apptype:'<b:write property="apptype" iterateId="apps" />',
ipaddr:'<b:write property="ipaddr" iterateId="apps" />',
ipport:'<b:write property="ipport" iterateId="apps" />',
url:'<b:write property="url" iterateId="apps" />'
};
</l:iterate>
function menuListRefresh(node){
  if(/[Yy]/.test(node.getProperty("isleaf"))&&node.getProperty("menuaction")==null){
  node.setIcon('<%=SkinUtil.getStyleFileForTag("images/abf/application_delete.png",request)%>');
  }
 }
 function menuClick(node){
  var target = 'bodyFrame';
  var url = node.getProperty("menuaction");
  var appid = node.getProperty("appid");
  if(!node.hasChildNode()){
     if(url!=null){       
        parent.frames[target].location.href = generateUrl(url,appid,'<%=request.getContextPath() %>');
     }
  }else{
  	node.expandNode();
  }
}

</script>
</head>
<body topmargin="0" background='<%=SkinUtil.getStyleFile("images/abf/menubg.gif",request) %>'><%-- 
<input type="text" id="testurl" />
<input type="text" id="testapp" />
<input type="button" class="button" onclick="testUrl('<%=request.getContextPath() %>');" value="test" />  
--%><w:tree id="menutree">
	<w:treeRoot display="应用菜单" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_home.png",request) %>'></w:treeRoot>
	<w:treeNode nodeType="menu" showField="menulabel"
		icon='<%=SkinUtil.getStyleFileForTag("images/abf/menu.png",request) %>' xpath="menulist"
		onRefreshFunc="menuListRefresh" onClickFunc="menuClick">
		<w:treeRelation parentNodeType="root" field="menulevel" value="1" />
		<w:treeRelation parentNodeType="menu" field="PARENTSID"	parentField="menuid" />
	</w:treeNode>
</w:tree>
</body>
</html>
