<%@include file="/common.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	Object rootObj= com.eos.web.taglib.util.XpathUtil.getDataContextRoot("request", pageContext); 
 	commonj.sdo.DataObject[] resultDataObject=(commonj.sdo.DataObject[])com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"menulist");
 	
 	StringBuffer menuStr =  new StringBuffer("<script language=\"javascript\">");
 	
 	menuStr.append("var menus=new Array(");
 	for (int i=0;i<resultDataObject.length;i++){
 		commonj.sdo.DataObject menu = resultDataObject[i];
 		String id = menu.getString("menuid")==null?"":menu.getString("menuid");
 		String name = menu.getString("menuname")==null?"":menu.getString("menuname");
 		String menuaction = menu.getString("menuaction")==null?"":menu.getString("menuaction");
 		String parentsid = menu.getString("PARENTSID")==null?"":menu.getString("PARENTSID");
 		String displayorder = menu.getString("displayorder")==null?"":menu.getString("displayorder");
 		String menulevel = menu.getString("menulevel")==null?"":menu.getString("menulevel");
 		menuStr.append("new Array(\""+id+"\",\""+name+"\",\""+menuaction+"\",\""+parentsid+"\",\""+displayorder+"\",\""+menulevel+"\")");
 		
 		if (i!=resultDataObject.length-1)	menuStr.append(",");
 	}
 	menuStr.append(")</script>");
 	
 	/*
	 	案例输出代码：
		<script language="javascript">
			var menus=new Array(
				new Array("personalization","授权认证","","","1"),
				new Array("authManage","权限管理","","","2"),
				new Array("operorgMange","组织管理","","","3"),
				new Array("applicationManage","应用功能管理","org.gocom.abframe.rights.application.ApplicationMaintain.flow","authManage","1"),
				new Array("organizationMange","机构管理","org.gocom.abframe.org.organization.OrgManager.flow","operorgMange","1")
				)
		</script>
	*/
%>
<html>
<head>
<h:css href='<%=SkinUtil.getLayoutStyleFileForTag("css/main.css",request) %>' />
<h:css href='<%=SkinUtil.getLayoutStyleFileForTag("css/ListView.css",request) %>' />

<style type="text/css">
	<!--
	.topbg1 {
		background-image: url(<%=SkinUtil.getLayoutStyleFile("img/top_bg.gif",request) %>);
	}
	.headbg {
		background-image: url(<%=SkinUtil.getStyleFile("images/abf/topbg.gif",request) %>);
		background-repeat: repeat-x;
	}
	-->
</style>

<%=menuStr.toString()%>
<script>
 function menuSort(x,y){     
    if(x[5]==y[5]){
        return x[4]-y[4];
     }else if(x[5]=="0"){
          return -1;
     }else{
       return x[5]-y[5];
     }
 }
    
    //排序菜单
 menus.sort(menuSort);
</script>
</head>
<body>

<table width="100%" cellpadding="0" cellspacing="0" >
  	<tr> 
	    <td valign="bottom"  class="headbg" style="padding-right:12px;">
		    <table width="100%" cellpadding="0" cellspacing="0" >
		        <tr> 
		          <td width="30%"><img src='<%=SkinUtil.getStyleFile("images/abf/logo.gif",request) %>'  height="44"></td>
		          <td align="right">
		            <table id="toolbar">
		              <tr> 
		                <td valign="baseline"><span style="color: C9E4F9;">*<b:message key="l_welcome" ><b:msgparam  property="userObject/userId" scope="session"/><b:msgparam  property="userObject/userName" scope="session" /></b:message></span></td>
		              	<td><a href='org.gocom.abframe.auth.Login.flow'  target="_top"><img src='<%=SkinUtil.getLayoutStyleFile("img/home.gif",request) %>' width="31" height="31" border="0"></a></td>
		                <td><a href='org.gocom.abframe.auth.Login.flow' target="_top">首页</a></td>
		                <td><a href="#"><img src='<%=SkinUtil.getLayoutStyleFile("img/help.gif",request) %>' width="31" height="31" border="0"></a></td>
		                <td><a href="#">帮助</a></td>
		                <td><a href="org.gocom.abframe.auth.Login.flow?_eosFlowAction=logout" target="_top"><img src='<%=SkinUtil.getLayoutStyleFile("img/logout.gif",request) %>' width="31" height="31" border="0"></td>
		                <td><a href="org.gocom.abframe.auth.Login.flow?_eosFlowAction=logout" target="_top">退出</a></td>		              	
		              </tr>
		            </table>
		          </td>
		        </tr>
		    </table>
	    </td>
  	</tr>
	<tr>
		<td valign="bottom">
		<table width="100%" cellpadding="0" cellspacing="0">
		    <tr>
		      <td width="100%" bgcolor="#E8E8E8" class="topbg1">
		      <div id="header"></div>
		        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#CDD1DD" style="border-bottom:1px solid #858FAD;border-left:1px solid #858FAD;border-right:1px solid #858FAD;">
		          <tr>
		            <td style="height:5px;"> </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		</table>
		</td>
	</tr>
</table>

</body>
</html>

<script language="javascript">
	var leftMenuHtml="";
    var header = document.getElementById('header');
	function makeSubMenu(menuID){        
	    //top.mainFrame.window.location.href = "about:blank";
	    //调整一级菜单被点击后的显示状态
	    var beginPoint = innerHtml.indexOf(menuID);//获得所选菜单id在原始数据中的位置
	    var preStr = innerHtml.substring(0,beginPoint);
	    var endStr = innerHtml.substring(beginPoint);
	    var insertPoint = preStr.lastIndexOf("<li>") + 3;//获取插入id="current"字符串的位置
	    preStr = preStr.substring(0,insertPoint) + ' id="current"' + preStr.substring(insertPoint);
	    header.innerHTML = preStr + endStr;
	    
	    //为生成子菜单准备正确的数据格式
	    leftMenuHtml="";
	    for(var i=0;i<menus.length;i++){
	        var arr=menus[i];
	        if(arr[0]==menuID){
	            leftMenuHtml+='<DSTreeRoot text="'+arr[1]+'" open="true" href="'+arr[2]+'">';
	        }
	        if(arr[3]==menuID){
	            searchSub(arr[0]);
	        }
	    }
	    
	    leftMenuHtml+='</DSTreeRoot>';
	    //显示点击之后一级菜单的画面
	    top.bodyFrame_all.window.location.href = '<%=SkinUtil.getLayoutFile("work_body.jsp",request) %>';
	}
	
	//两个辅助函数
	function searchSub(menuID){
	    var parentID="";
	    var flag = "no";
	    
	    for(var i=0;i<menus.length;i++){
	        var arr=menus[i];
	        if(arr[0]==menuID){
	            if(judgeSub(arr[0],arr[4])==false){
	                leftMenuHtml+='<DSTree text="'+arr[1]+'" open="false" href="'+arr[2]+'" target="mainFrame"/>';
	            }else{
	            	flag = "yes";
	                parentID=arr[0];
	                leftMenuHtml+='<DSTree text="'+arr[1]+'" open="true" href="'+arr[2]+'" target="mainFrame">';
	            }
	        }
	        if(arr[3]==menuID){
	            searchSub(arr[0]);
	            if(judgeSub(parentID,arr[4])==false){
	                leftMenuHtml+='</DSTree>';
	            }
	        } 
	    }
	    if( flag == "yes" )
	    	leftMenuHtml+='</DSTree>';
	    
	}
	function judgeSub(menuID,no){
	    for(var i=0;i<menus.length;i++){
	        var arr=menus[i];
	        if(arr[3]==menuID) return true;
	    }
	    return false;
	}


	//生成一级菜单
	var innerHtml="<ul>";
	var bodyFrame = "bodyFrame";
	for(var i=0;i<menus.length;i++){
	    var arr=menus[i];
	    if(arr[3]==0){
	        innerHtml+='<li><a href=javascript:makeSubMenu("'+arr[0]+'");>'+arr[1]+'</a></li>';
	    }
	}
	innerHtml=innerHtml.substring(0,innerHtml.length-"".length);
	innerHtml+='</ul>';
	header.innerHTML = innerHtml;
</script>