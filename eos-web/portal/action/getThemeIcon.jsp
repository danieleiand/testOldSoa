<%@page import="com.primeton.json.JSONObject"%>
<%@page import="com.primeton.json.JSONArray"%>
<%@page import="java.io.File"%>

<%
String contextPath=request.getContextPath();
    JSONArray items = new JSONArray();
	String iconDirPath = request.getRealPath("/portal/icon");
	File[] files = null;
	File iconDir = new File(iconDirPath);
	if (iconDir.isDirectory()) {
		// 是目录
		files = iconDir.listFiles();

		for (File f : files) {
			if (!f.isDirectory())
		if (f.getName().toLowerCase().endsWith("gif")
				|| f.getName().toLowerCase().endsWith("png"))
				{
		
			JSONObject item = new JSONObject();
		    item.put("iconCls","exit");
		    item.put("xtype","menuitem");	
			item.put("text",f.getName());
            item.put("icon",contextPath+"/portal/icon/"+f.getName());
            item.put("value","/portal/icon/"+f.getName());
            items.put(item);
                 
          }
		}
	}
	out.print("=" +items.toString());
%>
