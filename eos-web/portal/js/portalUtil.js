
var treeSave;
var portalTabSave = null;
var gongwenNodeIdSave = null;
var daibanNodeIdSave = null;
var voteNodeIdSave = null;

var portalUtil={};
/*
 * 加载ui widget
 */
portalUtil.loadWidget=function(widgetId,params,callBack,parentWin,nameSpace,notUseCache,type)
{	
try{
	if(widgetId===null||widgetId==="") return;
	var uiLocation=getWebRoot()+"/portalProxy/"+widgetId;
	var catchKey=nameSpace +"_eos_"+ uiLocation;
	nameSpace = nameSpace || Ext.id(null,"namespace");
	var uiFunction = window["__LOADUI_CACHE__FUNCTION"][catchKey];
	if (!uiFunction||notUseCache||true){
		/*if(uiLocation.indexOf("?")<0){
			if(uiLocation.indexOf(".uijs")<0){
				uiLocation += "js";
			}
			uiLocation += "?" + new Date();
		}else{
			if(uiLocation.indexOf(".ui?")>=0){
				uiLocation = uiLocation.replace(".ui?",".uijs?");
			}
		
		}*/
	uiLocation += "&" + new Date();
	//发送ajax请求,异步
		Ext.Ajax.request({
			url: uiLocation,
			success: function(response){
			
				var content = response.responseText;
				//alert(type)
				if(type=="ui"){
						var functionBody = " var __temp_ns = '"
								+ nameSpace
								+ "' , __temp_isSubUI = true, __temp_ui=null ; \n";
						functionBody += content + "\n";
						functionBody += "return __temp_ui;";
						var uiFunction = new Function(["__temp_params",
										"__temp_parent"], functionBody);
						window["__LOADUI_CACHE__FUNCTION"][catchKey] = uiFunction;

						var returnUI = uiFunction(params, parentWin);
						//parentWin.lookupUI = parentWin.lookupUI || {};
						//parentWin.lookupUI.returnObj = returnUI.UI;

						if (callBack) {
							callBack.apply(this, [returnUI]);
						}
						}
						else
						if(type=="asycHTML")
						{
					
						    
							parentWin.body.dom.innerHTML=content;
						    setTimeout(	function(){portalUtil.setInnerHTML(parentWin.body.dom.id,content)},1);
		
							//parentWin.body.dom.innerHTML=content;
							
							//portalUtil.createIframe(parentWin.body.dom,content)
						 	/*
						 	 * var iframe = Ext.isIE?document.createElement("<iframe frameBorder=0>"):document.createElement("iframe");
							iframe.style.border="0px";
							iframe.width="100%";
							iframe.height="100%";
							parentWin.body.dom.appendChild(iframe);
				            iframe.contentWindow.document.write(content)*/

						 
						}
			}
		});
   	}
   	else{
   		var returnUI = uiFunction(params,parentWin);
		//parentWin.lookupUI.returnObj = returnUI.UI;
		if(callBack){
			callBack.apply(this,[returnUI]);
		}
   	}
}catch(e){}
}
/*
 * 在ui widget中弹出窗口
 */
portalUtil.showDialogByWidget=function(widgetId,url,params,callBack,parentWin,nameSpace,notUseCache)
{
try{
	var uiLocation=getWebRoot()+"/portalProxy/"+widgetId+"|"+url;
	var catchKey=nameSpace +"_eos_"+ uiLocation;
	nameSpace = nameSpace || Ext.id(null,"namespace");
	var uiFunction = window["__LOADUI_CACHE__FUNCTION"][catchKey];

	if (!uiFunction||notUseCache||true){
		/*if(uiLocation.indexOf("?")<0){
			if(uiLocation.indexOf(".uijs")<0){
				uiLocation += "js";
			}
			uiLocation += "?" + new Date();
		}else{
			if(uiLocation.indexOf(".ui?")>=0){
				uiLocation = uiLocation.replace(".ui?",".uijs?");
			}
		
		}*/
	uiLocation += "&" + new Date();
		Ext.Ajax.request({
			url: uiLocation,
			success: function(response){
				    var content=response.responseText;
					var functionBody = " var __temp_ns = '" + nameSpace + "' , __temp_isSubUI = true, __temp_ui=null ; \n";
					functionBody += content + "\n";
					functionBody += "return __temp_ui;";
					var uiFunction = new Function(["__temp_params","__temp_parent"], functionBody);
					window["__LOADUI_CACHE__FUNCTION"][catchKey] = uiFunction;
					var returnUI = uiFunction(params,parentWin);
					parentWin.lookupUI = parentWin.lookupUI || {};
					parentWin.lookupUI.returnObj = returnUI.UI;
					if(callBack){
						callBack.apply(this,[returnUI]);
					}
			}
		});
   	}
   	else{
   		var returnUI = uiFunction(params,parentWin);
		parentWin.lookupUI.returnObj = returnUI.UI;
		if(callBack){
			callBack.apply(this,[returnUI]);
		}
   	}
}catch(e){}
}

/*
 *在tab上弹出窗口 
 */
portalUtil.showWindowOnTab=function(url,name,config)
{
try{
	config=config||{};
	var page=new Ext.Panel(config);
	//设置页签，tabpanle1.item.getCount得到标签的个数
	
	page.setTitle(name);
	page.html="<iframe class='tab_iframe' width='100%' height='100%' frameborder='0'  src='"+url+"'></iframe>";
    page.closable=true;
    page.anchor='100% 100%';
    page.iconCls='widget-window';
    
    //portalUtil.addLazyLoad(page,url);
    
    var portalTab= Ext.getCmp("portalTab");
    
	portalTab.add(page);
	portalTab.setActiveTab(page);
}catch(e){}
	
}

portalUtil.showWindowOnSameTab=function(url,name,systemId)
{

var url_jsp_len = url.indexOf(".jsp")+4;
var url_htm_len = url.indexOf(".htm")+4;
var url_html_len = url.indexOf(".html")+5;

if(url_jsp_len == url.length || url_htm_len == url.length || url_html_len == url.length){
	
}else if(url.indexOf(".jsp") > 0){

}else if(url.indexOf(".ui") > 0){

}
else if(url.indexOf(".ui") > 0){
}
else{
	url = url.replace("/ydsoa/","");			//what a fucking url
}
try{
	var portalTab= Ext.getCmp("portalTab");
	
	portalTabSave = portalTab;
	
	var tabCount = portalTab.items.getCount();
	
	//限制 打开标签页的 个数 为8
	
	var openTabCount = 8;	//默认为8，是通过业务字典配置的。见：YD_CONFIG openTabCount 8
	try{
		openTabCount = parent.openTabCount;
		
		if(!(openTabCount+1 > 1)){
			openTabCount = 8;
		}
	}catch(e){
		openTabCount = 8;
	}
	
	
	if(tabCount >= openTabCount){
		alert("打开标签页过多，请先把部分关闭。");
		return;
	}
	
	var id;
	if(systemId==null)
	 id = 'system_tab_page';
	 else
	 id="portal_"+systemId;
    var tab = portalTab.getComponent(id);

	if(tab){
	
		//var iframe=tab.getEl().dom.getElementsByTagName('iframe')[0];

		tab.setTitle(name);
		portalUtil.refreshTab(tab,url)
		
		//iframe.src=url;
		
		//portalTab.setActiveTab(tab);
		
	    }else{
	    	
	   var page= new Ext.Panel({
                id: id,
                closable: true,
    			autoScroll: true,
    			iconCls:'widget-window',
    			title: name,
    			html: '<iframe class"tab_iframe" id="system_tab_page_iframe" width="100%" height="100%" frameborder="0"  src="' + url+ '">'
            })	
	    portalUtil.addLazyLoad(page,url);	
        var p = portalTab.add(page);
        portalTab.setActiveTab(p);
	}

}catch(e){}
	
}


/*
 * 关闭tab窗口
 */
portalUtil.closeTab=function(name)
{
try{
	var portalTab= Ext.getCmp("portalTab");
	
	for(var i=0;i<portalTab.items.length;i++)
	{
		if(portalTab.items.item(i).title==name)
		{
			portalTab.remove(portalTab.items.item(i),false);
			break;
		}
	}
	
	//var page=new Ext.Panel();
	//设置页签，tabpanle1.item.getCount得到标签的个数
	//page.setTitle(name);
	//page.html="<iframe width='100%' height='100%' frameborder='0'  src='"+url+"'></iframe>";
    //page.closable=true;
    //page.anchor='100% 100%';
    //page.iconCls='widget-window';
   
	//portalTab.add(page);
	//portalTab.setActiveTab(page);
}catch(e){}
}

/*
 * 退出系统
 */

/*
portalUtil.logout=function()
{
	window.close();

}
*/
portalUtil.logout=function()
{
try{
	Ext.Msg.show({
    		title:"提示信息",
           	msg:"您确定要退出系统?", 
            width:200,
            buttons:{ok:"确定",cancel:"取消"},
            icon: Ext.MessageBox.QUESTION,
           	fn:function(conbtn){
            	if(conbtn=='ok'){
            		window.location.href=getWebRoot()+"/cas.login?CASLOGOUT=true";
            	}
            }
   });
}catch(e){}          
}

/*
 * reset
 */
portalUtil.resetPortalInfo=function()
{
try{
	Ext.MessageBox.confirm("提示信息","您确定要将主页恢复为默认状态吗?",function(o){
		if(o=="yes")
		{
			var url = getWebRoot()+"/portal/action/resetUserPortalInfo.jsp";
	        top.ajaxCall(url, {}, function() {
					top.location.reload();
				}, function() {
					alert("Failed to reset!");
				});
		}
     
	} )
}catch(e){}

}

/*
 * 得到widget窗口
 */

portalUtil.getWidget=function(widgetId)
{
try{
	var viewPort = Ext.getCmp("portalTab").getActiveTab();
	var theme=viewPort.getId();
	var cols = viewPort.items.length;
	var submitStr = "";
	for (var i = 0; i < cols; i++) {
		var col = viewPort.items.itemAt(i);

		for (var j = 0; j < col.items.length; j++) {
			
			if(col.items.itemAt(j).widgetId==widgetId) return col.items.itemAt(j);
			
			
		}
	}
	return null;
}catch(e){
	return null;
}
}

/*
 * 在widget中展现树
 */
portalUtil.showTree=function(widgetId,menuInfo,showPanelId)
{

//界面 第二个版本（需要传入 showPanelId）
if(null==showPanelId || showPanelId == ""){
	showPanelId = "PORTALMENUTREE";
}

try{
	
var systemId=menuInfo.id;

var rootText =menuInfo.treeRootName;
var showRoot=menuInfo.treeShowRoot;

if("0"==showRoot){
	showRoot = false;
}else{
	showRoot = true;
}

var widget
  widget=Ext.getCmp(showPanelId);			//界面 第二个版本
if(widget==null)
  widget=portalUtil.getWidget(widgetId);
if(widget==null) return;
   widget.expand();
var dataUrl;
 if(menuInfo.localApp) dataUrl=portalUtil.getTreeDataUrl(menuInfo);
else
 dataUrl=".ajaxProxyInvoke?appName="+(menuInfo.appName||"")+"&url="+menuInfo.url+"&action="+menuInfo.treeDataUrl.replace("hasContext:","");

if(widget.currTree==systemId){
 widget.doLayout();
 return;
 
}else{
	var ccccTree = null;
	
	try{
		ccccTree = widget.currTree;
	}catch(e){
		ccccTree = null;
	}
	
	if(null != ccccTree){
		try{
			widget.findById(ccccTree).getEl().dom.style.display="none";
		}catch(e){
		}
	}
    widget.currTree=systemId;
	var tree=widget.findById(systemId)
	
	if(menuInfo.treeRootName=="快捷菜单"){
		//销毁dom
		tree = null;
	}
	if(menuInfo.treeRootName=="我的流程"){
		tree = null;
	}
	if(menuInfo.treeRootName=="我的公文"){
		tree = null;
	}
	if(tree!=null) 
	{
		tree.getEl().dom.style.display="";
		return;
	}
	
	
}

var rootText=rootText||"应用菜单";

var tree=	{	 
    "id": getNSValue(systemId),
    "menuInfo":menuInfo,
    "xtype": "treepanel",
    "listeners": {
    	"contextmenu":function contextmenu(node , e ) 
    	{if(node.isLeaf())
    	{
    	
    	 var menu=_portal_getTreeMenu(menuInfo,node);	
    	 menu.showAt(e.getPoint())	
    		
    	}
    	},
    	"click": function click( node , e ){
	if(node.isLeaf()){
	e.stopEvent();
	var menuInfo=node.getOwnerTree().menuInfo;
//0:在新窗口中打开
//1:在tab页面中打开
//2:在同一tab页面中打开
	if(menuInfo.treeOpenMode==0)
	{
		var action=portalUtil.getTreeNodeAction(menuInfo,node);
		var newwin=window.open(action,"superwindowname","toolbar=no,resizable=yes,location=no,directories=no,status=no,menubar=no,scrollbars=yes,top="+(screen.availHeight-768)/2+",left="+(screen.availWidth-1024)/2+",width=1024,height=768");
		setTimeout(function(){newwin.focus();},10);
	}
	else
	
	if(menuInfo.treeOpenMode==1)
	{  		
		var action=portalUtil.getTreeNodeAction(menuInfo,node);
		var portalTab= Ext.getCmp("portalTab");
		var id = 'portal-tab-' + node.id;
		//var id = 'ext-comp-' + node.id;
	    var tab = portalTab.getComponent(id);
	    
		if(tab){
		//已经存在要刷新
			portalUtil.refreshTab(tab,action)
		//portalTab.setActiveTab(tab);
		//var iframe=tab.getEl().dom.getElementsByTagName('iframe')[0];
		//iframe.src=app+node.attributes.menuaction;
		
	
		}else{
			//var action= app+node.attributes.menuaction ;
			var action=portalUtil.getTreeNodeAction(menuInfo,node);
			portalUtil.showWindowOnTab(action,node.text);
			}
   }
   else
   if(menuInfo.treeOpenMode==2)
   {
   
  	var nodeMenuId = node.attributes["menuid"];

  	if(nodeMenuId == "GW_DOC_MYRECEIVE"){
  		gongwenNodeIdSave = node.id;
  	}else if(nodeMenuId == "281"){
  		daibanNodeIdSave = node.id;
  	}else if(nodeMenuId == "YD_VT_RECEIVEVOTE"){
  		voteNodeIdSave = node.id;
  	}
  
    var action=portalUtil.getTreeNodeAction(menuInfo,node);
   	portalUtil.showWindowOnSameTab(action,node.text,node.id);
   }
   else
   if(menuInfo.treeOpenMode==3)
   {
    var action=portalUtil.getTreeNodeAction(menuInfo,node);
   	portalUtil.showWindowOnSameTab(action,node.text,node.id);
   }

}
} },
    "title": "",
    "autoScroll":true,
    "border": false,
    "frame": false,
    "layout": "anchor",
    "footer": true,
    "buttonAlign": "center",
    "height": "100%",
    "rootVisible": showRoot,
    "root": {
      "id": getNSValue(systemId+'treenode'),
      "xtype": "commontreenode",
      "listeners": {},
      "text": rootText,
      "async": true,
      "loader": {
        "id": getNSValue(systemId+'commontreeloader'),
        "xtype": "commontreeloader",
        "listeners": {
        "beforeload":function()
        {
        	this.baseParams.systemId=systemId;
        }, 
        /**
        **  刘宏江  2012-8-20 15：30修改
        **  修改内容：增加加载事件，门户菜单项下没有子菜单树时，不显示菜单
        **/
        "load": function(node, res){
        	
        	if(res.childNodes.length == 0){
        		
        		widget.hide();
        	}        	
        }},
        "url": dataUrl,
        "childrenProperty": "_children",
   //     "idProperty": "menuid",
        "leafProperty": "_leaf",
        "rootProperty": "extMenu",
        "textProperty": "menulabel"
      },
      "expanded": true
    },
    "anchor": "100% 100%"
  }

	treeSave  = widget.add(tree);
	setTimeout(function(){
	widget.doLayout();},1);

}catch(e){}
}

/*
 * private
 * 功能树右键菜单
 * 
 * 
 */
function _portal_getTreeMenu(menuInfo,node)
{
try{
    	    var m=Ext.getCmp("PORTALTREEMENU");
    		if(m==null)
    		{
    		 m=new Ext.menu.Menu("PORTALTREEMENU");
    		 if(menuInfo.treeRootName!="快捷菜单")
    		 {
    		 
    		 //当前不为快捷菜单时,显示添加为快捷菜单
    		 	 m.add(new Ext.menu.Item(
	    		 	{
	    		 	text:'添加为快捷菜单',
	    		 	iconCls:'exit',
	    		 	icon:WEB_ROOT+"/portal/images/link.png",
	    		 	listeners:{
		    		 	click:function()
		    		 	{
		    		 		var name=node.text;
		    		 		//var action=app+node.attributes.menuaction;
		    		 		var action=portalUtil.getTreeNodeAction(menuInfo,node);
		    		 		var openMode=menuInfo.treeOpenMode;
		    		 		
		    		 		var url = getWebRoot()+"/portal/action/addQuickMenu.jsp?name=" + encodeURI(node.text)+"&action="+action+"&openMode="+openMode+"&systemName="+ encodeURI(menuInfo.appDisplayName)+"&appId="+encodeURI(menuInfo.id);
							
							
		    		 		ajaxCall(url, {}, function() {
		    		 		var quickMenuWidget;
		    		 		quickMenuWidget=Ext.getCmp("PORTALQUICKMENU");
    	    		 		if(quickMenuWidget==null)
		    		 		quickMenuWidget=portalUtil.getWidget("quickMenu");
		    		 		if(quickMenuWidget==null) return;
		    		 		else
		    		 		{
		    		 		 if(quickMenuWidget.refresh) quickMenuWidget.refresh(quickMenuWidget);
		    		 		 else
		    		 		  quickMenuWidget.body.dom.innerHTML = "<div><iframe width='100%' height='100%' frameborder='0'  src='../widget/quickMenu.jsp?portalSkin="+portalSkin+ "&appId="+encodeURI(menuInfo.id)+"'></iframe></div>"
		    		 		}
		    		 		 
		    		 		}, 
		    		 		function() {
						alert("Add quickMenu failed!")
					});
		    		 		
		    		 		
		    		 	}
	    		 	}
    		 	}
    		 	)
    		 	);
    		 	
    		 }else{
    		 //当前为快捷菜单时,显示删除快捷菜单操作
    		 	m.add(new Ext.menu.Item(
	    		 	{
	    		 	text:'删除快捷菜单',
	    		 	iconCls:'exit',
	    		 	icon:WEB_ROOT+"/portal/images/link.png",
	    		 	listeners:{
		    		 	click:function()
		    		 	{
		    		 		var name=node.text;
		    		 		//var action=app+node.attributes.menuaction;
		    		 		var action=portalUtil.getTreeNodeAction(menuInfo,node);
		    		 		var openMode=menuInfo.treeOpenMode;
		    		 		
		    		 		var url = getWebRoot()+"/portal/action/deleteQuickMenu.jsp?nodeId="+encodeURI(node.id);
							//从树中移除当前node
							node.remove();
							
		    		 		ajaxCall(url, {}, function() {
		    		 		var quickMenuWidget 
		    		 		quickMenuWidget=Ext.getCmp("PORTALQUICKMENU");
    	    		 		if(quickMenuWidget==null)
		    		 		quickMenuWidget=portalUtil.getWidget("quickMenu");
		    		 		if(quickMenuWidget==null) return;
		    		 		else
		    		 		{
		    		 		 if(quickMenuWidget.refresh) quickMenuWidget.refresh(quickMenuWidget);
		    		 		 else
		    		 		  quickMenuWidget.body.dom.innerHTML = "<div><iframe width='100%' height='100%' frameborder='0'  src='../widget/quickMenu.jsp?portalSkin="+portalSkin+ "&appId="+encodeURI(menuInfo.id)+"'></iframe></div>"
		    		 		}
		    		 		 
		    		 		}, 
		    		 		function() {
						alert("delete quickMenu failed!")
					});
		    		 		
		    		 		
		    		 	}
	    		 	}
    		 	}
    		 	)
    		 	);
    		 	
    		 	
    		 	
    		 }
    		 
    		 
    		 
			    m.add(new Ext.menu.Item(
				    		 	{
				    		 	text:'在新tab页面中打开',
				    			iconCls:'widget-window',
				    		 	listeners:{
					    		 	click:function()
					    		 	{
				    		 			
					    		 		
							    		 		var name=node.text;
							    		 		//var action=app+node.attributes.menuaction;
					                            var action=portalUtil.getTreeNodeAction(menuInfo,node);
					                         
										var portalTab= Ext.getCmp("portalTab");
											//var id = 'portal-tab-' + node.id;
										    //var tab = portalTab.getComponent(id);
										if(false){
											portalTab.setActiveTab(tab);
									
										}else{
									        var p = portalTab.add(new Ext.Panel({
									               // id: id,
									                closable: true,
									    			autoScroll: true,
									    			iconCls:'widget-window',	
									    			title: node.text,
									    			html: '<iframe class="tab_iframe" width="100%" height="100%" frameborder="0"  src="' + action + '">'
									            }));
									        portalTab.setActiveTab(p);
										}
						   
					    		 	}
				    		 	}
			    		 	}
			    		 	)
    		 	);
    		 	
    		 	 m.add(new Ext.menu.Item(
		    		 	{
		    		 	text:'在新窗口中打开',
		                iconCls:'widget-window',
		    		 	listeners:{
			    		 	click:function()
			    		 	{
			    		 		var name=node.text;
			    		 		//var action=app+node.attributes.menuaction;
			    		 		var action=portalUtil.getTreeNodeAction(menuInfo,node);
		                       	var newwin=window.open(action,"superwindowname","toolbar=no,resizable=yes,location=no,directories=no,status=no,menubar=no,scrollbars=yes,top="+(screen.availHeight-768)/2+",left="+(screen.availWidth-1024)/2+",width=1024,height=768");
			                    newwin.focus();
			    		 	}
		    		 	}
	    		 	}
    		 	)
    		 	);
    		 	
     		 	}
    		 	return m;
}catch(e){return null;}
	
}
/**
 * 弹出快捷菜单维护窗口
 */
portalUtil.openQuickMenuMainWin=function()
{
try{
	showDialog(getWebRoot()+"/portal/share/quickMenuMain.ui",null,null,window);
}catch(e){}
}


portalUtil.lazyLoad=function(panel)
{
try{
	var iframe = Ext.isIE?document.createElement("<iframe frameBorder=0>"):document.createElement("iframe");
	iframe.src = panel.url +(panel.url.indexOf("?")==-1?"?portalSkin=":"&portalSkin=")+portalSkin;
	iframe.style.display="none";
	iframe.style.border="0px";
	iframe.width="100%";
	iframe.height="100%";
	if (iframe.attachEvent){  iframe.attachEvent("onload", 
	function(){  
    if(panel.body.dom.firstChild.tagName=="SPAN")
	panel.body.dom.removeChild(	panel.body.dom.firstChild);	
	iframe.style.display="";
	}
	);}
	else {
	    iframe.onload = function(){
	    if(panel.body.dom.firstChild.tagName=="SPAN")
	    panel.body.dom.removeChild(panel.body.dom.firstChild);	
	    iframe.style.display=""   ;
	    };
	}

	panel.body.dom.appendChild(iframe);
}catch(e){}

}

portalUtil.createIframe=function(container,content)
{
try{
	 	            var iframe = Ext.isIE?document.createElement("<iframe frameBorder=0>"):document.createElement("iframe");
					iframe.style.border="0px";
					iframe.width="100%";
					iframe.height="100%";
					container.appendChild(iframe);
					iframe.contentWindow.document.write(content);
		            //iframe.contentWindow.document.body.innerHTML=content
}catch(e){}
}






portalUtil.setInnerHTML=function (obj_id, html, time) {
try{
	if(!html) return;
	var global_html_pool = [];
	var global_script_pool = [];
	var global_script_src_pool = [];
	var global_lock_pool = [];
	var innerhtml_lock = null;
	var document_buffer = "";
	    if (innerhtml_lock == null) {
	        innerhtml_lock = obj_id;
	    }
	    else if (typeof(time) == "undefined") {
	        global_lock_pool[obj_id + "_html"] = html;
	        window.setTimeout("portalUtil.setInnerHTML('" + obj_id + "', global_lock_pool['" + obj_id + "_html']);", 10);
	        return;
	    }
	    else if (innerhtml_lock != obj_id) {
	        global_lock_pool[obj_id + "_html"] = html;
	        window.setTimeout("portalUtil.setInnerHTML('" + obj_id + "', global_lock_pool['" + obj_id + "_html'], " + time + ");", 10);
	        return;
	    }
	
	    function get_script_id() {
	        return "script_" + (new Date()).getTime().toString(36)
	          + Math.floor(Math.random() * 100000000).toString(36);
	    }
	
	    document_buffer = "";
	
	    document.write = function (str) {
	        document_buffer += str;
	    }
	    document.writeln = function (str) {
	        document_buffer += str + "\n";
	    }
	
	    global_html_pool = [];
	
	    var scripts = [];
	    html = html.split(/<\/script>/i);
	    for (var i = 0; i < html.length; i++) {
	        global_html_pool[i] = html[i].replace(/<script[\s\S]*$/ig, "");
	        scripts[i] = {text: '', src: '' };
	        scripts[i].text = html[i].substr(global_html_pool[i].length);
	        scripts[i].src = scripts[i].text.substr(0, scripts[i].text.indexOf('>') + 1);
	        scripts[i].src = scripts[i].src.match(/src\s*=\s*(\"([^\"]*)\"|\'([^\']*)\'|([^\s]*)[\s>])/i);
	        if (scripts[i].src) {
	            if (scripts[i].src[2]) {
	                scripts[i].src = scripts[i].src[2];
	            }
	            else if (scripts[i].src[3]) {
	                scripts[i].src = scripts[i].src[3];
	            }
	            else if (scripts[i].src[4]) {
	                scripts[i].src = scripts[i].src[4];
	            }
	            else {
	                scripts[i].src = "";
	            }
	            scripts[i].text = "";
	        }
	        else {
	            scripts[i].src = "";
	            scripts[i].text = scripts[i].text.substr(scripts[i].text.indexOf('>') + 1);
	            scripts[i].text = scripts[i].text.replace(/^\s*<\!--\s*/g, "");
	        }
	    }
	
	    var s;
	    if (typeof(time) == "undefined") {
	        s = 0;
	    }
	    else {
	        s = time;
	    }
	
	    var script, add_script, remove_script;
	
	    for (var i = 0; i < scripts.length; i++) {
	        var add_html = "document_buffer += global_html_pool[" + i + "];\n";
	        //add_html += "//document.getElementById('" + obj_id + "').innerHTML = document_buffer;\n";
	        script = document.createElement("script");
	        if (scripts[i].src) {
	            script.src = scripts[i].src;
	            if (typeof(global_script_src_pool[script.src]) == "undefined") {
	                global_script_src_pool[script.src] = true;
	                s += 2000;
	            }
	            else {
	                s += 10;
	            }
	        }
	        else {
	            script.text = scripts[i].text;
	            s += 10;
	        }
	        //script.defer = true;
	        script.type =  "text/javascript";
	        script.id = get_script_id();
	        global_script_pool[script.id] = script;
	       // add_script = add_html;
	        add_script="";
	        add_script += "document.getElementsByTagName('head').item(0)";
	        add_script += ".appendChild(global_script_pool['" + script.id + "']);\n";
	        //alert( script.text)
	        document.getElementsByTagName('head').item(0).appendChild(script);
	        //  alert(add_script)
	       // window.setTimeout(add_script, s);
	       // remove_script = "document.getElementsByTagName('head').item(0)";
	      //  remove_script += ".removeChild(document.getElementById('" + script.id + "'));\n";
	      //  remove_script += "delete global_script_pool['" + script.id + "'];\n";
	       // window.setTimeout(remove_script, s + 10000);
	    }
	
	    var end_script = "if (document_buffer.match(/<\\/script>/i)) {\n";
	    end_script += "portalUtil.setInnerHTML('" + obj_id + "', document_buffer, " + s + ");\n";
	    end_script += "}\n";
	    end_script += "else {\n";
	    end_script += "document.getElementById('" + obj_id + "').innerHTML = document_buffer;\n";
	    end_script += "innerhtml_lock = null;\n";
	    end_script += "}";
	 //window.setTimeout(end_script, s);
}catch(e){}
}

portalUtil.showWidgetLoadStatus=function(panel)
{
try{
	panel.body.dom.innerHTML="<span><img src='"+getWebRoot()+"/webui/ext/skins/default/images/default/grid/loading.gif'>Loading...</span>"
}catch(e){}

}

portalUtil.addLazyLoad=function(p,url)
{
try{
	p.url=url;
	p.html="<span style='height:100%;width:100%;position:absolute' class='wait_mask'><div class='wait' style='display:none'></div></span>";
    p.on("render",function(panel) {

								//panel.body.dom.innerHTML="<span style='height:100%;width:100%;position:absolute' class='wait_mask'></span>"
							
									setTimeout(function(){ 
						            var box=panel.getBox();
						            var h=box.height/7*3-22;
						            var w=box.width/2-160;
						           panel.body.dom.firstChild.firstChild.style.marginTop=h;
                                   panel.body.dom.firstChild.firstChild.style.marginLeft=w;
                                   panel.body.dom.firstChild.firstChild.style.display="";
                                   
						           						           
	    	                         // panel.body.dom.firstChild.innerHTML="<div style='margin-top:"+h+";margin-left:"+w+"' class='wait'></div>"
	    	                          },1);
					
									var iframe = Ext.isIE?document.createElement("<iframe frameBorder=0>"):document.createElement("iframe");
									iframe.src = panel.url +(panel.url.indexOf("?")==-1?"?portalSkin=":"&portalSkin=")+portalSkin;
									iframe.style.border="0px";
									iframe.width="100%";
									iframe.height="100%";
									iframe.className='tab_iframe';
									iframe.allowtransparency ="true";
									if (iframe.attachEvent){  iframe.attachEvent("onload", 
										function(){  
										    if(panel.body.dom.firstChild.tagName=="SPAN"){
										    if(!window.portalEffect){ panel.body.dom.firstChild.style.display="none";return}	
										    //panel.body.dom.firstChild.firstChild.style.display="none";
										         var progress= Ext.get(panel.body.dom.firstChild.firstChild)
						                             progress.addClass("wait-100");
						                         /*
    			                          progress.fadeOut({
										    endOpacity: 0, 
										    easing: 'easeOut',
										    duration: 0.15,
										    remove: false,
											callback:function(){
									    	        var el=Ext.fly(panel.body.dom.firstChild);
													el.fadeOut({
													    endOpacity: 0, 
													    easing: 'easeOut',
													    duration: .25,
													    remove: false,
													    useDisplay: false
													});},
										    useDisplay: false
										})*/
						                         
										   
						                         setTimeout(function(){
										    	        var el=Ext.get(panel.body.dom.firstChild);
										    	        //progress.remove();
										    	        try{
											    	        progress.setStyle("display","none");
														}catch(e){
														
														}
															el.fadeOut({
															    endOpacity: 0, 
															    easing: 'easeOut',
															    duration: 0.25,
															    remove: false,
															    useDisplay: false
															});
														}
														,1)			
														}
											
										}
									);}
									else {
									    iframe.onload = function(){
									      
										    if(panel.body.dom.firstChild.tagName=="SPAN"){
										    if(!window.portalEffect) { panel.body.dom.firstChild.style.display="none";return}	
										    panel.body.dom.firstChild.firstChild.style.display="none";
										    setTimeout(function(){
										                var el=Ext.get(panel.body.dom.firstChild);										    	
														el.fadeOut({
														    endOpacity: 0, 
														    easing: 'easeOut',
														    duration: 0.25,
														    remove: false,
														    useDisplay: false
														});}
														,200)
														}
									     }
									    };
								
									setTimeout(function(){
										panel.body.dom.appendChild(iframe);
     								},10);
	
	
});

}catch(e){}
}

portalUtil.refreshTab=function(tabPage,url)
{
try{
	    var portalTab= Ext.getCmp("portalTab");
		
		portalTab.setActiveTab(tabPage);

		if(tabPage.el.dom.firstChild.firstChild.firstChild.tagName=="SPAN"){
		
									     var el=Ext.get(tabPage.el.dom.firstChild.firstChild.firstChild);
									      tabPage.el.dom.firstChild.firstChild.firstChild.firstChild.className="wait"
									      tabPage.el.dom.firstChild.firstChild.firstChild.firstChild.style.display=""; 
								          el.dom.style.visibility="visible";
								    	        el.fadeIn({
										            endOpacity: 1, 
										            duration: 0.5,
										            easing: 'easeOut',
										            callback:function(){ ;
										            var iframe=tabPage.getEl().dom.getElementsByTagName('iframe')[0];
		                                            iframe.src=url;}
										     });
									      
								         //el.dom.style.visibility="visible";
								        
								       
								       
		}
		//已经存在要刷新
		//alert(url)
		setTimeout(function(){
		},200);
}catch(e){}
}

portalUtil.getTreeNodeAction=function(menuInfo,node)
{
try{
	var action=node.attributes.menuaction;
     if(action.indexOf("/")==0)
	 {//绝对路径处理
       if(menuInfo.treeDataUrl.indexOf("hasContext:")==0)
	   {//路径中带有contextPath

	   }
	   else
	   {//路径中不带contextPath
		  if(menuInfo.appName!=""&&menuInfo.appName!=null)
		   action="/"+menuInfo.appName+action;

	   }
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
       if(menuInfo.localApp)
	     return action
	    else
		 return menuInfo.url+action;
}catch(e){return null;}
}

portalUtil.getTreeDataUrl=function(menuInfo)
{
try{
	var dataUrl=menuInfo.treeDataUrl.replace("hasContext:","")
	if(dataUrl.indexOf("/")==0)
	{
	 if(menuInfo.appName!=""&&menuInfo.appName!=null)
		   dataUrl="/"+menuInfo.appName+dataUrl;	
	}
	else
	{
		if(menuInfo.appName!=""&&menuInfo.appName!=null)
		   dataUrl="/"+menuInfo.appName+"/"+dataUrl;	
	}
	return dataUrl;
}catch(e){return null;}
}

portalUtil.waitTemplate="";//'<span><MARQUEE ALIGN=″alignment″ BEHAVIOR=″type″ BGCOLOR=″color″ DIRECTION=″direction″ SCROLLAMOUNT=″n″ SCROLLDELAY=″n″ LOOP=″n″ WIDTH=″x″ HEIGHT=″y″ HSPACE=″x″ VSPACE=″y″>滚动字幕内容</MARQUEE></div>'
