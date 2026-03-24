<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<%
		String contextPath = request.getContextPath() ;
%>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/ext/skins/default/css/ext-all.css.gzip" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/nazca/style/common.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/nazca/style/runtime.css" />
<script type="text/javascript" src="<%=contextPath%>/webui/nazca/javascript/lib.js.gzip" ></script>
</head>
<body>

<div id="show"></div>

<script>
	
	
	Ext.onReady(function(){
	   setTimeout(function(){
		  var  win = new Ext.Window({
	                "layout": "anchor",
					title       : "Login failure",
	                width       : 500,
	                height      : 250,
	                closeAction :'hide',
	                bodyStyle:  "padding-top:30px;padding-left:60px;",
				    html :"<div><img height='40' width='40' src='<%=contextPath%>/webui/ext/resources/images/default/window/icon-info.gif'/><span style='padding-left:10px;color:#15428B;font-family:tahoma,arial,verdana,sans-serif;font-size:11px;font-size:18px;font-style:normal;font-variant:normal;line-height:normal;'='x-window-header-text'>对不起，请联系管理员。</span></div>",
	                buttons: [{
	                    text     : 'Close',
	                    handler  : function(){
	                        win.hide();
	                    }
	                }]
	            });
	        win.show("show");
	   },800);
	
	
	});
</script>
</body>
</html>