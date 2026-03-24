<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/webui/nazca/common.jsp"%>
var __temp_ns = __temp_ns|| '';
var __temp_params = __temp_params|| null;
var __temp_parent = __temp_parent|| null;
var __temp_ui = null;
var __temp_isSubUI = __temp_isSubUI|| false;
__temp_ui = (function(_ns,_params,_parent){
	_ns = _ns || (window.isDesigning?'':EOS.DEFAULT_NAMESPACE);
	function getNSValue(oid){
		return EOS.getNSValue(oid,_ns);
	}
	function getCmp(id){
		return Ext.getCmp(getNSValue(id));
	}
	var UIManager = EOS.UIManager.create(_ns);

	UIManager.initUI(
{"listeners": {"afterRender": function afterRender(  ){

	for(var i=0;i<themes.length;i++)
	{
	var theme=themes[i];
	
	var mainPage = Ext.ComponentMgr.create({
			xtype : 'portal',
			id : theme.tabId,
			isSys:theme.isSys,
			closable:false,
			status:theme.status,
			//items : createPortInfo(),
			listeners : {
				'beforerender': function(o){
				//alert(o.initComponent)
				o.add.apply(o, createSysPortInfo(o))
		
				//var items=o.items
				//for(var x in items)
				//alert(x+":"+items[x]);
				//o.items=[];
				//o.items.items=createPortInfo()
				//alert(o.add)
				//alert(createPortInfo().length)
				//o.items=[{items:createPortInfo()}];
				
	         //alert(o.items.length)
				}
				
			},
			anchor : '100% 100%',
			title:theme.tabTitle
		});
		if(theme.icon)
			Ext.apply(mainPage,{
				icon:WEB_ROOT+"/" +theme.icon,
				iconCls:'widget-mainPage'
			});
		portalTab.add(mainPage);
		portalTab.doLayout();
		portalTab.setActiveTab(0);
	
	}
} }}
	);
	if (!__temp_isSubUI) { document.title=""  }
  UIManager.UI.arguments= _params; 
  UIManager.setParentWidget(_parent); 
	UIManager.initDataContext(
{}
	);
	UIManager.registerHiddenWidgets(
{
  "listeners": {"afterRender": function afterRender(  ){

	for(var i=0;i<themes.length;i++)
	{
	var theme=themes[i];
	
	var mainPage = Ext.ComponentMgr.create({
			xtype : 'portal',
			id : theme.tabId,
			isSys:theme.isSys,
			closable:false,
			status:theme.status,
			//items : createPortInfo(),
			listeners : {
				'beforerender': function(o){
				//alert(o.initComponent)
				o.add.apply(o, createSysPortInfo(o))
		
				//var items=o.items
				//for(var x in items)
				//alert(x+":"+items[x]);
				//o.items=[];
				//o.items.items=createPortInfo()
				//alert(o.add)
				//alert(createPortInfo().length)
				//o.items=[{items:createPortInfo()}];
				
	         //alert(o.items.length)
				}
				
			},
			anchor : '100% 100%',
			title:theme.tabTitle
		});
		if(theme.icon)
			Ext.apply(mainPage,{
				icon:WEB_ROOT+"/" +theme.icon,
				iconCls:'widget-mainPage'
			});
		portalTab.add(mainPage);
		portalTab.doLayout();
		portalTab.setActiveTab(0);
	
	}
} },
  "hiddenWidgets": []
}
	);
	UIManager.register(
{
  "id": getNSValue('mainpage'),
  "xtype": "viewport",
  "listeners": {"beforeCreate": function beforeCreate( config ){
window.themes
	
	// <jsp:include page="/portal/action/getSystemTheme.jsp" />
	
} },
  "layout": "anchor",
  "items": [{
    "id": getNSValue('panel3'),
    "xtype": "panel",
    "listeners": {},
    "border": true,
    "frame": false,
    "layout": "anchor",
    "region": "center",
    "footer": true,
    "width": 483,
    "tbar": {
      "id": getNSValue('toolbar1'),
      "xtype": "toolbar",
      "listeners": {},
      "height": 30,
      "items": [
        {
          "id": getNSValue('tbitem1'),
          "xtype": "tbfill",
          "listeners": {}
        },
        {
          "id": getNSValue('button6'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){
showDialog('systemThemeLayout.ui',null,null,window,null,null);
} },
          "text": "布局",
          "region": "north",
          "width": 100,
          "icon": window.WEB_ROOT+"/portal/images/layout.gif",
          "iconCls": "config"
        },
        {
          "id": getNSValue('tbitem6'),
          "xtype": "tbseparator",
          "listeners": {}
        },
        {
          "id": getNSValue('tbitem2'),
          "xtype": "tbtext",
          "listeners": {},
          "text": "系统主题:"
        },
        {
          "id": getNSValue('button1'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){
showDialog('addSystemTheme.ui',null,null,window,null,null);

} },
          "text": "新增",
          "region": "north",
          "width": 55,
          "iconCls": "config",
          "icon": window.WEB_ROOT+"/portal/images/add.gif"
        },
        {
          "id": getNSValue('button4'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){
showDialog('modifySystemTheme.ui',null,null,window,null,null);
} },
          "text": "修改",
          "region": "north",
          "width": 100,
          "icon": window.WEB_ROOT+"/portal/images/config.gif",
          "iconCls": "config"
        },
        {
          "id": getNSValue('button5'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){


var currTab=portalTab.getActiveTab();
if(currTab.id=="main") 
  {Ext.Msg.alert("提示信息","首页不能被删除!");return;}

Ext.MessageBox.confirm("提示信息","您确定要删除系统主题门户："+currTab.title+ "?",function(o){
if(o=="yes")
{
 	    var url = getWebRoot()+"/portal/action/deleteSystemTheme.jsp?theme=" + currTab.getId();
			ajaxCall(url, {}, function() {
	      			portalTab.remove(currTab);
					
					}, function() {
						alert("Add theme failed!")
					});
					
}
})

} },
          "text": "删除",
          "region": "north",
          "width": 100,
          "icon": window.WEB_ROOT+"/portal/images/delete.gif",
          "iconCls": "config"
        },
        {
          "id": getNSValue('button7'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){
showDialog('sysThemeAuthManager.ui',null,null,window,null,null);
} },
          "text": "权限设置",
          "cls": "",
          "iconCls": "widget-lock",
          "icon": window.WEB_ROOT+"/portal/images/lock.png"
        },
        {
          "id": getNSValue('tbitem3'),
          "xtype": "tbseparator",
          "listeners": {}
        },
        {
          "id": getNSValue('tbitem5'),
          "xtype": "tbfill",
          "listeners": {}
        },
        {
          "id": getNSValue('tbitem4'),
          "xtype": "tbtext",
          "listeners": {},
          "text": "系统widget:"
        },
        {
          "id": getNSValue('button3'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){
showDialog('addSystemWidget.ui',null,null,window,null,null);

} },
          "text": "新增",
          "region": "north",
          "width": 100,
          "icon": window.WEB_ROOT+"/portal/images/add.gif",
          "iconCls": "config"
        },
        {
          "id": getNSValue('button2'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){
saveSystemThemeWidgets();



} },
          "text": "保存",
          "region": "north",
          "width": 100,
          "icon": window.WEB_ROOT+"/portal/images/save.gif",
          "iconCls": "config"
        }
      ]
    },
    "buttonAlign": "center",
    "anchor": "100% 100%",
    "items": [{
      "id": getNSValue('portalTab'),
      "xtype": "tabpanel",
      "listeners": {"tabchange": function tabchange( thisObj , tab ){

} },
      "border": true,
      "frame": false,
      "activeTab": 0,
      "height": 528,
      "title": "New TabPanel",
      "footer": true,
      "buttonAlign": "center",
      "region": "west",
      "width": 100,
      "anchor": "100% 100%",
      "enableTabScroll": true
    }]
  }]
}
	);


	var mainpage, panel3, portalTab, toolbar1, tbitem1, button6, tbitem6, tbitem2, button1, button4, button5, button7, tbitem3, tbitem5, tbitem4, button3, button2;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		mainpage = EOS.getCmp('mainpage', _ns);
		panel3 = EOS.getCmp('panel3', _ns);
		portalTab = EOS.getCmp('portalTab', _ns);
		toolbar1 = EOS.getCmp('toolbar1', _ns);
		tbitem1 = EOS.getCmp('tbitem1', _ns);
		button6 = EOS.getCmp('button6', _ns);
		tbitem6 = EOS.getCmp('tbitem6', _ns);
		tbitem2 = EOS.getCmp('tbitem2', _ns);
		button1 = EOS.getCmp('button1', _ns);
		button4 = EOS.getCmp('button4', _ns);
		button5 = EOS.getCmp('button5', _ns);
		button7 = EOS.getCmp('button7', _ns);
		tbitem3 = EOS.getCmp('tbitem3', _ns);
		tbitem5 = EOS.getCmp('tbitem5', _ns);
		tbitem4 = EOS.getCmp('tbitem4', _ns);
		button3 = EOS.getCmp('button3', _ns);
		button2 = EOS.getCmp('button2', _ns);


		UIManager.fireEvent('afterRender',[]);
	}
   if (__temp_isSubUI){
	    __loadFunc();
   }else{
	    EOS.onLoad( __loadFunc );
   } 
   return UIManager; 
})(__temp_ns,__temp_params,__temp_parent);
 // __temp_ns=undefined;
 // __temp_parent=undefined;