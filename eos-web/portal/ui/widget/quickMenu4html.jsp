<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.primeton.portal.purview.service.QuickMenuManagerService"%>
<%@page import="com.primeton.portal.purview.entity.QuickMenu"%>
<%
String configId="config"+Math.random();
%>

<%@page import="com.primeton.widget.util.PortalUtil"%>
<script language="javascript">
  var __quick_menu={
	  
	 openPage:function (wname,url,openMode,systemName)
	   {
	    if(openMode==0)
	   {
		  var newwin=window.open(url,"superwindowname","toolbar=no,resizable=yes,location=no,directories=no,status=no,menubar=no,scrollbars=yes,top="+(screen.availHeight-768)/2+",left="+(screen.availWidth-1024)/2+",width=1024,height=768");
			newwin.focus();
		}
		else if(openMode==1)
		{
		    window.top.portalUtil.showWindowOnTab(url,wname);	  
		}
		else if(openMode==2)
		{
			window.top.portalUtil.showWindowOnSameTab(url,wname,systemName);	  
		}
		else if(openMode==3)
		{
			window.top.portalUtil.showWindowOnExistTab(url,wname,systemName);	  
		}
	   }
   }
</script> 
	<div class="portal_widget_html"  onscroll="setPos()" oncontextmenu="return false;">
	
	<Table width="100%" align="center" style="table-layout:fixed;font-size:12px!important">
<%

QuickMenuManagerService qms=new QuickMenuManagerService();
List<QuickMenu> quickMenus=(List<QuickMenu>)qms.searchQuickMenuByUserId(PortalUtil.getUserId(session));

	//取出请求中的menulist对象的数据放到resultDataObject1中
 
	StringBuffer	strBuff=new StringBuffer("");
	int i=0;
        for (QuickMenu quickMenu:quickMenus){	
			if ((i+1)%2==1)
			{				
	        	out.println("<TR height='20'>");	        	
        	}        	
        	out.println("<TD width='50%' style='text-overflow:ellipsis;white-space:nowrap; overflow: hidden;'><nobr>");
			//取菜单名称
	 		String menulabel = quickMenu.getMenuName();
			String openmode=quickMenu.getOpenMode().toString();
			String action=quickMenu.getAction();
	 		String systemName = quickMenu.getSystemName();
		
			//我的快捷菜单前的图标
			strBuff.append("<img src='");
			strBuff.append(request.getContextPath());
			strBuff.append("/portal/images/link1.png' border='0' align='middle' style='margin-top:-4px'>&nbsp;");			
		    strBuff.append("<A href='#' onclick=__quick_menu.openPage('");
			strBuff.append(menulabel);
			strBuff.append("','");
			strBuff.append(action);
			strBuff.append("','");
			strBuff.append(openmode);			
			strBuff.append("','");
			strBuff.append(systemName);			
			strBuff.append("') title='");
			strBuff.append(quickMenu.getSystemName()+"-"+menulabel);			
			strBuff.append("'>");
			strBuff.append(menulabel);
			strBuff.append("</a>");			
			out.println(strBuff);
			strBuff.delete(0,strBuff.length());
			out.println("</nobr></td>");
			if ((i+1)%2==0)
			{				
	        	out.println("</TR>");	        	
        	}   
        	i++;     				
		}
		//跳出循环的时候，补上<TD>和</tr>	 	
		if (i%2!=0)
		{
			int j=1;
	 		for(;j<=2-(i%2);j++)
				out.print("<Td>&nbsp;</td>");
			if (j!=1)
			{
				out.print("</tr>");
			} 	
		}
 %>
  </table>
   <img id="<%=configId %>" title="配置快捷菜单" onclick="top.portalUtil.openQuickMenuMainWin();" style="position:absolute;cursor:pointer;filter:alpha(opacity=30);-moz-opacity:0.3;opacity:0.3;" src="../images/cog_go.png">
 </div>
 <script>
  function setPos()
  {
  var config=document.getElementById('<%=configId %>');
  config.style.top=config.parentNode.clientHeight-20+config.parentNode.scrollTop
  config.style.left=config.parentNode.clientWidth-20+config.parentNode.scrollLeft
  }
  
  setPos();
 </script>
