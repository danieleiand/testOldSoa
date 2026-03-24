<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.primeton.portal.purview.service.AppManagerService"%>
<%@page import="com.primeton.portal.purview.entity.Application"%>
<%@page import="com.primeton.json.JSONObject"%>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<script>
<%
 	String contextPath = request.getContextPath();
   
	String skin=null;
    skin=CacheUtil.getUserStyle(session);
%>
<%

		AppManagerService as =new AppManagerService();
	    List<Application> sysmenus = as.searchSystemMenu();
	    
	   	JSONObject menuInfos = new JSONObject();
	    
		String defaultAppCode = "";
	    
	    for(Application sysmenu:sysmenus)
	    {
	  
	     	JSONObject menuInfo = new JSONObject();
            menuInfo.put("id",sysmenu.getAppId());
	        menuInfo.put("appName",sysmenu.getAppName());
	        menuInfo.put("appDisplayName",sysmenu.getAppDisplayName());
	        menuInfo.put("icon",sysmenu.getIcon());     
	        menuInfo.put("openMode",sysmenu.getOpenMode());   
	        menuInfo.put("treeDataUrl",sysmenu.getTreeDataUrl());
	        menuInfo.put("treeOpenMode", sysmenu.getTreeOpenMode());
	        menuInfo.put("treeRootName", sysmenu.getTreeRootName());
	        menuInfo.put("treeShowRoot", sysmenu.isTreeShowRoot()); 
	        menuInfo.put("url", sysmenu.getUrl());
	        menuInfo.put("appAction", sysmenu.getAppAction());
	        menuInfo.put("localApp", sysmenu.isLocalApp());
	        menuInfo.put("logintype",sysmenu.getLoginType());
            menuInfos.put(sysmenu.getAppId(),menuInfo);
            long v = sysmenu.getVersion();
            if(1 == v){
            	defaultAppCode = sysmenu.getAppId();
            }
           
	    }

        
out.println("var menuInfos=" +  menuInfos.toString());

 %>


function showDetaultApp(){
 var defaultAppCode = '<%=defaultAppCode %>';
 js_openpage(defaultAppCode);
}
</script>

<html >
<head> 
<title>系统菜单</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/ext/skins/<%=skin%>/css/portal.css" />

<script language="javascript">


function display(objimg,i,url)
	{
	
	    var objimg=objimg.getElementsByTagName("img")[0];
		if (i==1)
		{
		//onmouseover
		objimg.src=url;
		//objimg.className="imgcssonmouseover";
		}
		else
		{
		objimg.src=url;		
		//objimg.className="imgcss";		
		}
	}

function getAction(menuInfo)
{
	var action=menuInfo.appAction;
	if(!action) return;
     if(action.indexOf("/")==0)
	 {//绝对路径处理

	   //路径中不带contextPath
		  if(menuInfo.appName!=""&&menuInfo.appName!=null)
		   action="/"+menuInfo.appName+action;
	  }
	  else
	  if(action.indexOf("http")==0||action.indexOf("https")==0)
       {//完地址处理
	   return action;
	  }
	  else
	  {//相对路径处理
	  if(menuInfo.appName!=""&&menuInfo.appName!=null)
	   action="/"+menuInfo.appName+"/"+action;
	   else
       action="/"+action;


	  }
	 return menuInfo.url+action;

}

function js_openpage(systemId)
   {
   
   var menuInfo=menuInfos[systemId];
//0:在新窗口中打开
//1:在tab页面中打开
//2:在同一tab页面中打开
//3:切换树菜单

   var openUrl="";
 
   if(menuInfo.logintype!= 1)
	   {

	    openUrl=getAction(menuInfo);
	   	
	   }
   	else 
		   {
		   		openUrl ="<%=contextPath %>/portal/login/simlogin.jsp"; //用户映射的jsp页面
		   		var action = getAction(menuInfo);	
				openUrl = openUrl + "?action="+action;
		   }
   

   if(menuInfo.openMode==0 || menuInfo.openMode==1 || menuInfo.openMode==2)
	   {
	     //将皮肤信息传递给应用系统
	   var portalSkin = "<%=skin%>";
	   openUrl = openUrl+(openUrl.indexOf("?")==-1?"?":"&")+"portalSkin="+portalSkin+"&appid="+menuInfo.id;
	   
	   }

  
   if(menuInfo.openMode==0)
	   {
		var newwin=window.open(openUrl,"superwindowname","toolbar=no,resizable=yes,location=no,directories=no,status=no,menubar=no,scrollbars=yes,top="+(screen.availHeight-768)/2+",left="+(screen.availWidth-1024)/2+",width=1024,height=768");
		newwin.focus();
	   }
	   else
		   if(menuInfo.openMode==1)
		   {
		    window.top.portalUtil.showWindowOnTab(openUrl,menuInfo.appDisplayName);	  
		   }
			   else
			   if(menuInfo.openMode==2)
			   {
			      window.top.portalUtil.showWindowOnSameTab(openUrl,menuInfo.appDisplayName,systemId);	  
			 
			   }
				   else
					   if(menuInfo.openMode==3)
					   {
					   
					   window.top.portalUtil.showTree('mtree',menuInfo);
					   
					   
					   }
    }
</script>
<style>

.imgcss{
	width: 15px;
	height: 15px;
}
a:link{
text-decoration:none;
color:#3B6109;
}
a:hover
{
text-decoration:none;
color:#3b6109;
font-weight:800;
}
a:visited
{
text-decoration:none;
color:#3B6109;
}

.txtcssonmouseover{font-size:9pt;color:#3b6109;font-weight:800}
.txtcss{font-size:9pt;color:#3b6109;}
td{font-size:9pt;color:#000000;}
</style>
</head>
	<body style="background:transparents" onload="showDetaultApp();" leftmargin="0" topmargin="0" style="overflow-x:hidden" >  	
	<Table width="98%" align="center">
<%
	//定义分列的变量，可以灵活更改的
	int col=3;
	
	int width=(int)100/col;

	StringBuffer strBuff=new StringBuffer();

	int i=0;
        for (Application sysmenu:sysmenus){	
        
       
	 		//commonj.sdo.DataObject menu = resultDataObject1[i];

            String systemId =sysmenu.getAppId();
			//取菜单名称
	 		String menulabel =sysmenu.getAppDisplayName();
			
			//取图标路径			
			String icon=	sysmenu.getIcon();
			if(icon.startsWith("http")) contextPath="";
			
			icon=contextPath+icon;
			
			//取鼠标经过的图标
	
		int pos= sysmenu.getIcon().lastIndexOf(".");
			
        String  icon_onmouseover= contextPath+sysmenu.getIcon().substring(0,pos)+"_mouseover"+sysmenu.getIcon().substring(pos);
		
			if ((i+1)%col==1)
			{
			out.print("<tr height=20>");
			}
			//输出菜单
	strBuff.append("<td  width='");
	strBuff.append(String.valueOf(width));	
	strBuff.append("%' align='center' valign='middle' ><a href=\"#\" onclick=\"javascript:js_openpage('");
	strBuff.append(systemId);
	strBuff.append("');return false;\"");
	
	
	strBuff.append(" onmouseover='javascript:display(this,1,\"");
	strBuff.append(icon_onmouseover);
	strBuff.append("\");' onmouseout='javascript:display(this,2,\"");
	strBuff.append(icon);
	strBuff.append("\");'");	
	
	strBuff.append("><img src='");
	strBuff.append(icon);
	strBuff.append("' border='0' class='imgcss' ><BR>");	
	strBuff.append(menulabel);	
	


	
	strBuff.append("</a></td>");	
	out.print(strBuff);
	strBuff.delete(0,strBuff.length());
	if ((i+1)%col==0)
	{
	out.print("</tr>");
	}
	i++;
	 	}
	 	//跳出循环的时候，补上<TD>和</tr>	 	
		if (i%col!=0)
		{
			int j=1;
	 		for(;j<=col-(i%col);j++)
				out.print("<Td width='".concat(String.valueOf(width)).concat("%'>&nbsp;</td>"));
			if (j!=1)
			{
				out.print("</tr>");
			} 	
		}
 %>
 </table>
	</body>
</html>
