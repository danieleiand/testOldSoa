<%@include file="/common.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<h:script src='<%=SkinUtil.getLayoutFileForTag("scripts/xmltree.js",request) %>' />
<h:css href='<%=SkinUtil.getLayoutStyleFileForTag("css/main.css",request) %>' />
<h:css href='<%=SkinUtil.getLayoutStyleFileForTag("css/ListView.css",request) %>' />

<html>
	<body>
		<xml id="menuXML"></xml>
		<div id="treeBox"></div>
	</body>
	<a href="" id="initmenu"></a>
</html>

<script language="javascript">

	function creatTree(){
		//取得生成树的数据
		var leftMenuStr = top.topFrame.leftMenuHtml;
		
		//将取得的数据转化成 DOM
		var xmlDoc = document.getElementById('menuXML').XMLDocument; 
	    document.getElementById('treeBox').innerHTML = "";
	    xmlDoc.async="false";
	    xmlDoc.loadXML(leftMenuStr);
	    
	    //根据DOM生成可见的菜单树
	    initTree();
	}
	
	window.onload = creatTree;
</script>