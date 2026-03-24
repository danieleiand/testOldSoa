<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%
//config:

String contextPath = request.getContextPath();
int interval=0;//自动刷新间隔时间(s),0:不刷新;
String countNumStyle="style='color:red'";
String loading="<img src='"+request.getContextPath()+"/webui/ext/skins/default/images/default/grid/loading.gif'>";
String toDoListId="toDo"+Math.random();

%>

<%
List<Map> toDoItems=new ArrayList<Map>();

toDoItems.add(createToDoItem("未读邮件({0})封",null,null,contextPath+"/customization/todo/getItem.jsp",contextPath+"/customization/todo/newItemList.jsp","1","未读邮件"));
toDoItems.add(createToDoItem("代办任务({0})项",null,null,contextPath+"/customization/todo/getItem1.jsp",contextPath+"/customization/todo/newItemList1.jsp","0","代办任务"));
toDoItems.add(createToDoItem("未完成任务({0})项",null,null,contextPath+"/customization/todo/getItem2.jsp",contextPath+"/customization/todo/newItemList2.jsp","0","未完成任务"));
toDoItems.add(createToDoItem("短消息({0})个",null,null,contextPath+"/customization/todo/getItem3.jsp",contextPath+"/customization/todo/newItemList3.jsp","0","短消息"));

%>


<%!
/*
String template:显示模板
String icon:显示图标,设置为null,缺省为../images/todo.png
String count:该任务项总数，设置为null,则客户通过loadAction异步获取
String loadAction:获得该任务项总数的逻辑，该逻辑返回数据必须是json文本{count:123}
String onclickAction:点击该任务项后，弹出窗口的url
String openMode:弹出窗口的模式,目前只支持在tab页面中打开

*/

public Map createToDoItem(String template,String icon,String count,String loadAction,String onclickAction,String openMode,String title)
{
	Map toDoItem=new HashMap<String,String>();
	
	toDoItem.put("template",template);
	
	toDoItem.put("loadAction",loadAction);
	
	toDoItem.put("onclickAction",onclickAction);
	
	toDoItem.put("count",count);
	
	toDoItem.put("openMode",openMode==null?"1":"1");
	
    toDoItem.put("title",title);

	toDoItem.put("icon",icon==null?"../images/todo.png":icon);
	
	return toDoItem;
}

%>
<div class="portal_widget_html" style="height:100%"   oncontextmenu="return false;">
<Table id='<%=toDoListId %>'width="100%" align="center" style="table-layout:fixed;font-size:12px!important" >

<%
for(Map<String,String> item:toDoItems)
{
String icon=item.get("icon");
String template=item.get("template");
String count=item.get("count");
String loadAction=item.get("loadAction");
String onclickAction=item.get("onclickAction");
String openMode=item.get("openMode");
String content=template.replace("{0}",loading);
String title=item.get("title");
 %>

<tr>
 <td style="padding:0 10px 0 10px">
     <div class="bottom-line">
            <img src='<%=icon %>'>
            <a style='cursor:hand' 
               template="<%=template %>" 
               <%=count==null?"":"count=\""+count+"\"" %> 
               onclickAction="<%=onclickAction %>" 
               openMode="<%=openMode %>" 
               loadAction="<%=loadAction %>" 
               onclick="todoUtil.onclick(this)" 
               title="<%=title %>"
               >
               <%=content %>
               </a>
     </div>
 </td>
</tr>

<%}; %>
</table>
</div>
<script>

var todoUtil={
  loadItem:	function (item)
			{
			if(item.getAttribute("count")!=null)
			{
			  item.innerHTML=item.getAttribute("template").replace("{0}","<span "+"<%=countNumStyle%>>"+item.getAttribute("count")+"</span>");
			  item.removeAttribute("count");
			}
			else
			{
			    var loadAction=item.getAttribute("loadAction");
			    if(loadAction.indexOf("?")<0){
			     loadAction+="?"+new Date();
			    }
			    else
			    {
			    loadAction+="&"+new Date();
			    }
			    Ext.Ajax.request({
					url: loadAction,
					success: function(response){
					    var count
						var content = response.responseText;
						try{
						 count=Ext.decode(content).count;
				        }
				        catch(e)
				        {
				        count="未知";
				        }
						item.innerHTML=item.getAttribute("template").replace("{0}","<span "+"<%=countNumStyle%>>"+count+"</span>");
						
						
				}});
			    
				
			}
		},
loadData:function(toDoListId)
	{

		try{
		var toDoItems=document.getElementById(toDoListId).getElementsByTagName("A");
		}
		catch(e)
		{
		return;
		}
		for(var i=0;i<toDoItems.length;i++)
		{
		var item=toDoItems[i];
		if(item.getAttribute("template")==null) continue;

		todoUtil.loadItem(item);

		}

			},
onclick:function(item)
	{
	  var openMode=item.getAttribute("openMode");
	  var openUrl=item.getAttribute("onclickAction");
	  var title=item.getAttribute("title");
	  if(openMode==0)
	   {
		var newwin=window.open(openUrl,"superwindowname","toolbar=no,resizable=yes,location=no,directories=no,status=no,menubar=no,scrollbars=yes,top="+(screen.availHeight-768)/2+",left="+(screen.availWidth-1024)/2+",width=1024,height=768");
		newwin.focus();
	   }
	   else
	   if(openMode==1)
	   {
	    window.top.portalUtil.showWindowOnTab(openUrl,title,{refreshEl:item,listeners:{beforeclose :function(panel){todoUtil.loadItem(panel.refreshEl)}}});	  
	   }

	}			
};
todoUtil.loadData('<%=toDoListId %>');

<% if(interval!=0){ %>
setInterval("todoUtil.loadData('<%=toDoListId %>')",<%=interval*1000 %>);
<%
}
%>

</script>



