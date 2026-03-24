<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%

addSkin("blue","蓝色经典","/webui/ext/skins/blue/images/skin.jpg");
addSkin("default","默认主题","/webui/ext/skins/default/images/skin.jpg");
addSkin("purple","紫色浪漫","/webui/ext/skins/purple/images/skin.jpg");
addSkin("red","欢庆节日","/webui/ext/skins/red/images/skin.jpg");
%>


<%!
Map skins=new HashMap<String,Map>();
public void addSkin(String id,String displayName,String icon)
{
Map skin=new HashMap<String,String>();


skin.put("displayName",displayName);

skin.put("icon",icon);

skins.put(id,skin);

}

 %>
<script>


</script>

<html >
<head> 
<title></title>

<script language="javascript">


function display(objimg,i,url)
	{
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
	
function textdisplay(std,i)
	{
		if (i==1)
		{
		//onmouseover
		std.className="txtcssonmouseover";
		}
		else
		{
		std.className="txtcss";		
		}
	}

</script>
<style>
.txtcssonmouseover{font-size:9pt;color:#ff0000;}
.txtcss{font-size:9pt;color:#0B5877;}
td{font-size:9pt;color:#000000;}
</style>
</head>
	<body bgcolor="#F5FAFF" leftmargin="0" topmargin="0" style="overflow-x:hidden" oncontextmenu="return false;">  	
	<Table width="98%" align="center">
<%
	//定义分列的变量，可以灵活更改的
	int col=2;
	
	int width=(int)100/col;

	StringBuffer strBuff=new StringBuffer();
    
    Object[] keys=skins.keySet().toArray();
    
	int i=0;
        for (Object key: keys  ){	
        
       
	 		//commonj.sdo.DataObject menu = resultDataObject1[i];

            String skinId =(String)key;
			//取菜单名称
	 		String menulabel =(String)((Map)skins.get(key)).get("displayName");
			
			String contextPath=request.getContextPath();
			//取图标路径			
			String icon=	(String)((Map)skins.get(key)).get("icon");
			if(icon.startsWith("http")) contextPath="";
			
			
			
			//取鼠标经过的图标
	
		int pos= icon.lastIndexOf(".");
			
        String  icon_onmouseover= contextPath+icon.substring(0,pos)+"_mouseover"+icon.substring(pos);
        icon=contextPath+icon;
		
			if ((i+1)%col==1)
			{
			out.print("<tr height=60>");
			}
			//输出菜单
	strBuff.append("<td onmouseover='javascript:textdisplay(this,1);' onmouseout='javascript:textdisplay(this,2);' width='");
	strBuff.append(String.valueOf(width));	
	strBuff.append("%' align='center' valign='middle' ><a href=\"../action/saveSkin.jsp?mode=link&skin=");
	strBuff.append(skinId);
	strBuff.append("\"><img src='");
	strBuff.append(icon);
	strBuff.append("' border='0' class='imgcss' onmouseover='javascript:display(this,1,\"");
	strBuff.append(icon_onmouseover);
	strBuff.append("\");' onmouseout='javascript:display(this,2,\"");
	strBuff.append(icon);
	strBuff.append("\");'></a><BR>");	
	strBuff.append(menulabel);	
	strBuff.append("</td>");	
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
