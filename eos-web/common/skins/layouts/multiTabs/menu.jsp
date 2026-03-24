<%@include file="/common.jsp"%>
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
<h:script src='<%=SkinUtil.getLayoutFileForTag("scripts/ssm.js",request)%>' />
<h:script src='<%=SkinUtil.getLayoutFileForTag("scripts/menu.js",request)%>' />
<h:script src="org.gocom.abframe.auth.Frame.flow?_eosFlowAction=quickmenu" />
<script>
function menuListRefresh(node){
  if(/[Yy]/.test(node.getProperty("isleaf"))&&node.getProperty("menuaction")==null){
  node.setIcon('<%=SkinUtil.getStyleFileForTag("images/application_delete.png",request)%>');
  }
 }
function menuClick(node){
  var target = 'bodyFrame';
  var url = node.getProperty("menuaction");
  var appid = node.getProperty("appid");
  if(!node.hasChildNode()){
     if(url!=null){
        parent.frames[target].location.href = generateUrl(url,appid);
     }
  }else{
  	node.expandNode();
  }
}
function padContextpath(url){
  var headexpr = new RegExp("^/");
  var tailexpr = new RegExp("\\.jsp(\\?.*){0,1}$");
  var root = contextPath; //set from common.jsp
  if(root=="/") root="";
  if(tailexpr.test(url)){
    if(headexpr.test(url)){
      return root+url;
    }else{
      return root+"/"+url;
    }
  }else{
    return url;
  }
}
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
/*
 *根据应用编号和url生成完整的url
 */
function generateUrl(url,appid){
    var app = apps[appid];
    if(app!=null&&app.apptype!='0'){
      //http://192.168.0.1:8080/eos-default/org.gocom.abframe.auth.Login.flow
     return "http://"+app.ipaddr+generatePort(app.ipport)+"/"+generateContext(app.url)+"/"+geturl(url);
    }else{
      return padContextpath(url);
    }
}
 function generatePort(port){
    if(port!=null&&port!="80"){
       return ":"+port;
    }else{
       return "";
    }
 }
 function generateContext(context){
   var  expr = new RegExp("^/");
    if(expr.test(context)){
       context = context.substr(1);       
    }    
    expr = new RegExp("/$");
    if(expr.test(context)){
      context = context.substr(0,context.length-1);    
    }
    return context;
 }
 function geturl(url){
    var expr = new RegExp("^/");
    return expr.test(url)?url.substring(1):url;
 }
 function testUrl(){
 alert(generateUrl($id('testurl').value,$id('testapp').value));
 }
</script>
</head>
<body topmargin="0" background='<%=SkinUtil.getStyleFile("images/menubg.gif",request) %>'>
<!--<input type="text" id="testurl" />
<input type="text" id="testapp" />
<input type="button" class="button" onclick="testUrl();" value="tst" />-->
<w:tree id="menutree">
	<w:treeRoot display="应用菜单" icon='<%=SkinUtil.getStyleFileForTag("images/application_delete.png",request) %>'></w:treeRoot>
	<w:treeNode nodeType="menu" showField="menulabel"
		icon='<%=SkinUtil.getStyleFileForTag("images/menu.png",request) %>' xpath="menulist"
		onRefreshFunc="menuListRefresh" onClickFunc="menuClick">
		<w:treeRelation parentNodeType="root" field="menulevel" value="1" />
		<w:treeRelation parentNodeType="menu" field="PARENTSID"	parentField="menuid" />
	</w:treeNode>
</w:tree>
</body>
</html>
