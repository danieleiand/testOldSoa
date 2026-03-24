/* * Ext JS Library 2.3.0 Copyright(c) 2006-2009, Ext JS, LLC. licensing@extjs.com
 * 
 * http://extjs.com/license
 */

top.PortalUI = {};

var portalTools = [
	/*{
			id : 'gear',
			handler : function() {
				portalUtil.showTree();
			}
		},*/
	{
			id : 'refresh',
			handler : function(e,toolEl,panel) {
					if (panel.type == "url") 
					{
                               panel.refresh(panel);
										}
					else
					
					if(panel.type=="html")
					{	
    						   if(panel.url!=null) 
								{ 
								
								portalUtil.loadWidget(panel.portalid, null,
										null, panel,null,false,"html");
									
				
								}
									
					}
					if(panel.type=="ui")
					{
						panel.items.each(function(el)
						{
							panel.remove(el,true)
						}
						)
    					portalUtil.loadWidget(panel.portalid, null,
									null, panel,null,false,"ui");
					}
					
			
			}
		},
		{
			id : 'close',
			handler : function(e, target, panel) {
				if(panel.closable===false){
					Ext.Msg.alert("提示信息","系统widget不允许被删除！");
					return;
					
				}
				panel.ownerCt.remove(panel, true);
				updateMainLayout();
			}
		}];
		
var portalSysTools = [
	/*{
			id : 'gear',
			handler : function() {
				Ext.Msg.alert('Message', 'The Settings tool was clicked.');
			}
		},*/
		{
			id : 'close',
			handler : function(e, target, panel) {

     		panel.ownerCt.remove(panel, true);
			}
		}];		
		
		
var googleWidgetSrc = "/gadgets/ifr?container=default&mid=7&nocache=1&country=ALL&lang=ALL&view=default&parent=" + 
 window.location.protocol + "//" + window.location.host + ":" + window.location.port
 + 
"&st=john.doe:john.doe:appid:cont:url:0:default&url=";
var portalSrc = "http://192.168.0.74:8080/pluto/proxyPortal?portalid=";
function createPortInfo(theme) {
	var themeId=theme.id
	var pd = [];
	var xmlHttp = Ext.lib.Ajax.createXhrObject().conn;
	try {
		xmlHttp.open('GET', WEB_ROOT+"/portal/action/getWidgets.jsp?theme="+themeId+'&'+new Date(), false);
		/*
		 * for (var key in headers) { xmlHttp.setRequestHeader( 'Content-Type',
		 * 'text/json;charset=UTF-8' ); }
		 */
		xmlHttp.send(null);
		var returnValue = Ext.decode(xmlHttp.responseText);
		var userportal = returnValue.userportal;
		if (userportal==null || userportal==undefined || typeof(userportal)=="undefined") { alert("Userportal is null. Failed to load widgets."); return null; } 
		var userPortalinfos = returnValue.userPortalinfos;
		var columNum = returnValue.columNum;
		var columWidth = returnValue.columWidth;
	} catch (e) {
		//alert("Failed to load widgets" + e);
		return {};
	}

	var userportals = userportal.split(";");
	if (!columNum) {
		columNum = userportals.length;
		var columWidthArr = [];
		for (var i = 0; i < columNum; i++) {
			columWidthArr.push(1 / columNum);
		}
		columWidth = columWidthArr.join(",");
	}
	
	//top.PortalUI.userportal = userportal;
	//top.PortalUI.columNum = columNum;
	//top.PortalUI.columWidth = columWidth;
	
	
	theme.userportal = userportal;
	theme.columNum = columNum;
	theme.columWidth = columWidth;
	
	var columArr = columWidth.split(",");
	for (var i = 0; i < columNum; i++) {
		var width = columArr[i];
		var pCol = {
			columnWidth : width,
			style : 'padding:5px 0px 0px 5px'
		}
		var items = [];
		pCol.items = items;
		pd[i] = pCol;
		if (userportals.length <= i) {
			continue;
		}
		if (userportals[i] != "") {
			var colPortals = userportals[i].split(",");

			for (var j = 0; j < colPortals.length; j++) {

				for (var k = 0; k < userPortalinfos.length; k++) {
					var userPortalinfo = userPortalinfos[k];

					if (userPortalinfo.portalid == colPortals[j]) {
						items[j] = userPortalinfo;
						items[j].tools = portalTools;
						items[j].time =1000*(j)+50;
//-------------widget 全屏处理 begin -------------------------------
						if(theme.columNum==1&&theme.columWidth==.99&&userPortalinfos.length==1){
							if (items[j].type == "url") {
							items[j].listeners = {
								render : function(panel) {
			
									var newDiv=document.createElement("div");
									var viewPort = Ext.getCmp("portalTab").getActiveTab();
									viewPort.body.dom.firstChild.style.display="none";
									viewPort.body.dom.appendChild(newDiv);
									newDiv.innerHTML="<div><iframe width='100%' height='100%' frameborder='0'  src='"
										+ this.url + "'></iframe></div>";
								}
							}
						}
              					continue
						};
			/*		
						if(theme.columNum==1&&theme.columWidth==1&&userPortalinfos.length==1){
							if (items[j].type == "url") {
							items[j].listeners = {
								render : function(panel) {
									var viewPort = Ext.getCmp("portalTab").getActiveTab();
									viewPort.body.dom.firstChild.style.display="";
									var div=viewPort.body.dom.firstChild.nextSibling;
									if(div!=null)
									{
										viewPort.body.dom.removeChild(div,true);
										
									}
									panel.body.dom.innerHTML = "<div><iframe width='100%' height='100%' frameborder='0'  src='"
											+ this.url +(this.url.indexOf("?")==-1?"?portalSkin=":"&portalSkin=")+portalSkin+ "'></iframe></div>";
							}
							}
						}
              					continue
						};
						*/
				
//-------------widget 全屏处理 end-------------------------------					
							
						if (items[j].type == "url") {
							items[j].listeners = {
								render : function(panel) {
									
	                                if(!panel.mode)
	                                {//缺省iframe模式加载widget
										portalUtil.showWidgetLoadStatus(panel);
										setTimeout(function(){
										    portalUtil.lazyLoad(panel)	
										},panel.time);
	                                }
	                                else
	                                  if(panel.mode=="sycnHTML")
	                                  {
	                                  		var html=panel.html;
						                    setTimeout(	function(){portalUtil.setInnerHTML(panel.body.dom.id,html)},1);
	                                  }
	                                  else
	                                  if(panel.mode=="asycHTML")
	                                  {
	                                  portalUtil.showWidgetLoadStatus(panel);
	                                  portalUtil.loadWidget(panel.portalid, null,
										null, panel,null,false,panel.mode);
	                                  }
	                                   else
	                                   if(panel.mode=="asycIframe")
	                                  {
	                                  portalUtil.showWidgetLoadStatus(panel);
	                                  portalUtil.loadWidget(panel.portalid, null,
										null, panel,null,false,panel.mode);
	                                  }
	                                  else
	                                  {alert("panel.mode"+panel.mode+" is invalid!");}
									
								}
							};
							items[j].refresh=function(panel)
							{
					                                if(!panel.mode)
                                {//缺省iframe模式加载widget
									panel.body.dom.innerHTML="<span><img src='"+getWebRoot()+"/webui/ext/skins/default/images/default/grid/loading.gif'>Loading...</span>"
									setTimeout(function(){
									    portalUtil.lazyLoad(panel)	
									},panel.time);
                                }
                                else
                                  if(panel.mode=="sycnHTML")
                                  {
                                  	
                                    portalUtil.showWidgetLoadStatus(panel);	
                                    portalUtil.loadWidget(panel.portalid, null,
									null, panel,null,false,"asycHTML");
                                  }
                                  else
                                  if(panel.mode=="asycHTML")
                                  {
                              	    portalUtil.showWidgetLoadStatus(panel);	
                                    portalUtil.loadWidget(panel.portalid, null,
									null, panel,null,false,panel.mode);
                                  }
                                  else
                                  if(panel.mode=="asycIframe")
                                  {
                              	    portalUtil.showWidgetLoadStatus(panel);	
                                    portalUtil.loadWidget(panel.portalid, null,
									null, panel,null,false,panel.mode);
                                  }
                                  else
                                  {alert("panel.mode"+panel.mode+" is invalid!");}
								
										
							}
							
							
						} else if (items[j].type == "google") {
							items[j].listeners = {
								render : function(panel) {
									panel.body.dom.innerHTML = "<div><iframe width='100%' height='100%' frameborder='0'  src='"
											+ googleWidgetSrc + this.url + "'></iframe></div>";
								}
							}
						
						} else if (items[j].type == "portal") {
							items[j].listeners = {

								render : function(panel) {
									panel.body.dom.innerHTML = "<div><iframe width='100%' height='100%' frameborder='0'  src='"
											+ portalSrc + this.portalUrl +panel.url.indexOf("?")==-1?"?portalSkin=":"&portalSkin="+portalSkin+ "'></iframe></div>";
								}
							}
						} else if (items[j].type == "html") {
							// items[j].html = userPortalinfo.html;
							items[j].listeners = {
								render : function(panel) {
						//		var html=panel.html;
						//setTimeout(	function(){portalUtil.setInnerHTML(panel.body.dom.id,html)},1);
						
						/*
								if(panel.url!=null) 
								{ 
								if(panel.sycn==true)
								{
								setTimeout(function(){
								portalUtil.createIframe(panel.body.dom,panel.innerhtml)
								},1);	
								return;
								}
							//panel.body.dom.innerHTML="<span><img src='"+getWebRoot()+"/webui/ext/skins/default/images/default/grid/loading.gif'>Loading...</span>"
    							else
    							{
    							portalUtil.loadWidget(panel.portalid, null,
										null, panel,null,false,"html");
								return;
    							}
							
								
								}
					*/
								//return;
								//panel.body.dom.innerHTML = this.html;
								
									if (this.script) {
										try {
											eval(this.script);
										} catch (e) {

										}
									}
								}
							}

						} else {
							items[j].listeners = {

								render : function(panel) {
									portalUtil.loadWidget(panel.portalid, null,
											null, panel,null,false,"ui");
								}
							}

						}
						
						if (userPortalinfo.attribute != null
								&& userPortalinfo.attribute != "") {
							var attrs = userPortalinfo.attribute.split(";");
							for (var ii = 0; ii < attrs.length; ii++) {
								var attr = attrs[ii].split("=");

								try {
									items[j][attr[0]] = eval(attr[1]);
								} catch (e) {
									items[j][attr[0]] = attr[1];
								}
							}
						}

						break;

					}

				}
				if(items[j]==null) {items[j]={};items[j].tools = portalTools;items[j].title="Widget not Found"}

			}

		}

	}

	return pd;
}






//-----------------------------------------------------------------


function createSysPortInfo(theme) {
	var themeId=theme.id
	var pd = [];
	var xmlHttp = Ext.lib.Ajax.createXhrObject().conn;
	try {
		xmlHttp.open('GET', WEB_ROOT+"/portal/action/getSystemWidgets.jsp?theme="+themeId+'&'+new Date(), false);
		/*
		 * for (var key in headers) { xmlHttp.setRequestHeader( 'Content-Type',
		 * 'text/json;charset=UTF-8' ); }
		 */
		xmlHttp.send(null);
		var returnValue = Ext.decode(xmlHttp.responseText);
		var userportal = returnValue.userportal;
		var userPortalinfos = returnValue.userPortalinfos;
		var columNum = returnValue.columNum;
		var columWidth = returnValue.columWidth;
	} catch (e) {
		alert("Failed to load widgets" + e);
		return null;
	}

	var userportals = userportal.split(";");
	if (!columNum) {
		columNum = userportals.length;
		var columWidthArr = [];
		for (var i = 0; i < columNum; i++) {
			columWidthArr.push(1 / columNum);
		}
		columWidth = columWidthArr.join(",");
	}

	theme.userportal = userportal;
	theme.columNum = columNum;
	theme.columWidth = columWidth;
	
	
	var columArr = columWidth.split(",");
	for (var i = 0; i < columNum; i++) {
		var width = columArr[i];
		var pCol = {
			columnWidth : width,
			style : 'padding:5px 5px 5px 5px'
		}
		var items = [];
		pCol.items = items;
		pd[i] = pCol;
		if (userportals.length <= i) {
			continue;
		}
		if (userportals[i] != "") {
			var colPortals = userportals[i].split(",");

			for (var j = 0; j < colPortals.length; j++) {

				for (var k = 0; k < userPortalinfos.length; k++) {
					var userPortalinfo = userPortalinfos[k];

					if (userPortalinfo.portalid == colPortals[j]) {

						items[j] = userPortalinfo;
						items[j].tools = portalSysTools;
						items[j].height = userPortalinfo.height;
						items[j].portalid = userPortalinfo.portalid;
						items[j].portalUrl = userPortalinfo.portalUrl;
						items[j].icon = userPortalinfo.icon;
						items[j].locked=userPortalinfo.locked;
						items[j].widgetId=userPortalinfo.widgetId;
				
					
			
							items[j].listeners = {

								render : function(panel) {
								
								if(!panel.locked)
								panel.body.dom.innerHTML = "允许删除<input type=checkbox checked>";
								else
									panel.body.dom.innerHTML = "允许删除<input type=checkbox >";
									
									if (this.script) {
										try {
											eval(this.script);
										} catch (e) {

										}
									}
								}
							}

					
						if (userPortalinfo.attribute != null
								&& userPortalinfo.attribute != "") {
							var attrs = userPortalinfo.attribute.split(";");
							for (var ii = 0; ii < attrs.length; ii++) {
								var attr = attrs[ii].split("=");

								try {
									items[j][attr[0]] = eval(attr[1]);
								} catch (e) {
									items[j][attr[0]] = attr[1];
								}
							}
						}

						break;

					}

				}
				if(items[j]==null) {items[j]={};items[j].tools = portalSysTools;items[j].title="Widget not Found"}

			}

		}

	}

	return pd;
}

//-------------------------------------------------------------------


function updateMainLayout() {

	var viewPort = Ext.getCmp("portalTab").getActiveTab();
	var theme=viewPort.getId();
	var cols = viewPort.items.length;
	var submitStr = "";
	for (var i = 0; i < cols; i++) {
		var col = viewPort.items.itemAt(i);
		if (i != 0)
			submitStr = submitStr + ";";
		for (var j = 0; j < col.items.length; j++) {
			if (j != 0)
				submitStr = submitStr + ",";
			submitStr = submitStr + col.items.itemAt(j).portalid;
		}
	}
	top.PortalUI.userportal = submitStr;
	ajaxCall(WEB_ROOT+"/portal/action/saveWidgets.jsp?widgets=" + submitStr+"&theme="+theme, {});
}

function saveSystemThemeWidgets() {
    var status=""
	var viewPort = Ext.getCmp("portalTab").getActiveTab();
	var theme=viewPort.getId();
	var cols = viewPort.items.length;
	var submitStr = "";
	for (var i = 0; i < cols; i++) {
		var col = viewPort.items.itemAt(i);
		if (i != 0)
			submitStr = submitStr + ";";
		for (var j = 0; j < col.items.length; j++) {
			if (j != 0)
				submitStr = submitStr + ",";
			submitStr = submitStr + col.items.itemAt(j).portalid;
			try{
			if(status=="")
			{
			 if(col.items.itemAt(j).getEl().dom.getElementsByTagName("input")[0].checked)
			    {
			    	status=status+"T";
			    }
			    else
			    {
			    	status=status+"F";
			    }
			   }
			    
			    else
			    if(col.items.itemAt(j).getEl().dom.getElementsByTagName("input")[0].checked)
			    {
			    	status=status+",T";
			    }
			    else
			        status=status+",F";
			}
			catch(e){}
			    
		}
	}
	top.PortalUI.userportal = submitStr;
	ajaxCall(WEB_ROOT+"/portal/action/saveSystemThemeWidgets.jsp?widgets=" + submitStr+"&theme="+theme+"&widgetStatus="+status,{}, function(){Ext.Msg.alert("提示信息","系统主题保存成功！");}, function(){Ext.Msg.alert("提示信息","系统主题保存失败！");});
}

/*
Ext.onReady(function() {

			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [{
									xtype : 'portal',
									region : 'center',
									margins : '5 5 5 0',
									id : "mainViewPort",
									items : createPortInfo(),
									listeners : {
										'drop' : function(e) {
											updateMainLayout();
										}
									}
								}]
					});
		});
*/