<%@include file="/common.jsp" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Title</title>
<style type="text/css">
<!--
A.ssmItems:link		{color:black;text-decoration:none;}
A.ssmItems:hover	{color:black;text-decoration:none;}
A.ssmItems:active	{color:black;text-decoration:none;}
A.ssmItems:visited	{color:black;text-decoration:none;}
//-->
</style>
<h:script src='<%=SkinUtil.getLayoutFile("scripts/ssm.js",request)%>' />
<h:script src='<%=SkinUtil.getLayoutFile("scripts/menu.js",request)%>' />
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
</script>
<%
	//获取标签中使用的国际化资源信息
	String refresh=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_refresh");
%>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<tr>       
		<td width="30%" height="100%" valign="top">
			<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
				<tr>
				<td width="30%" height="100%" valign="top" class="eos-panel-body">
				<r:rtree height="110%" width="100%" id="menuTree" >
				  <r:treeRoot action="org.gocom.abframe.rights.menu.MenuManager.queryMenusForMenuTree.biz"  onDblclickFunc="dbClickNode"
				  	childEntities="menuList" display="应用菜单" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_home.png",request)%>'> <!--应用菜单 -->
				  	<r:treeMenu>
				      <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshMenu"/><!--刷新 -->
				    </r:treeMenu>
				  </r:treeRoot>
				
				  <r:treeNode action="org.gocom.abframe.rights.menu.MenuManager.queryMenusForMenuTree.biz"
				  	childEntities="menuList" nodeType="menuList" onClickFunc="menuClick"
				  	onRefreshFunc="menuListRefresh" showField="menulabel" iconField="expandpath,imagepath" submitXpath="menu" preload="true">
				  	<r:treeMenu>
				      <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshMenu"/><!-- 刷新 -->
				    </r:treeMenu>
				  </r:treeNode>
				</r:rtree>
				</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script>
//配置节点展开关闭默认图标。如果iconField属性值为空，则使用下面配置图片显示，如果不配置则使用系统默认配置
var STREE_DEFAULTOPEN_ICON='<%=SkinUtil.getStyleFile("images/abf/menu.png",request)%>';
var STREE_DEFAULTCLOSE_ICON='<%=SkinUtil.getStyleFile("images/abf/menu.png",request)%>';

function menuListRefresh(node)
{
	if(node.getProperty("subcount")=="0")   //将当前节点设置为叶子节点
	 node.setLeaf(true)
}


//刷新选中节点
function refreshMenu(node){
	node.reloadChild();
}

</script>
</body>
</html>

<SCRIPT language="javascript">
    //初始化树的高度
    eventManager.add(window,"load",custInit);
	function custInit(){
        var height = document.body.clientHeight - TREE_MODIFY_HEIGHT;
		$id("menuTree").style.height =height;
	}
</SCRIPT>
