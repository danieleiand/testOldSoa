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
{"listeners": {}}
	);
	if (!__temp_isSubUI) { document.title=""  }
  UIManager.UI.arguments= _params; 
  UIManager.setParentWidget(_parent); 
	UIManager.initDataContext(
{"getNSValue('quickMenu')": {
  "id": getNSValue('quickMenu'),
  "name": getNSValue('quickMenu'),
  "xtype": "servicestore",
  "listeners": {"onSaveSuccess": function onSaveSuccess( response ){

 		var quickMenuWidget 
 		quickMenuWidget=Ext.getCmp("PORTALQUICKMENU");
 		if(quickMenuWidget==null)
 		quickMenuWidget=portalUtil.getWidget("quickMenu");
 		if(quickMenuWidget==null) return;
 		else
 		{
 		if(quickMenuWidget.refresh) quickMenuWidget.refresh();
 		else
 		quickMenuWidget.body.dom.innerHTML = "<div><iframe width='100%' height='100%' frameborder='0'  src='../widget/quickMenu.jsp?portalSkin="+portalSkin+ "'></iframe></div>"
 		}
		    		 		 
		    		 		
quickMenuWindow.close();
} },
  "entityType": "com.primeton.portal.purview.entity.QuickMenu",
  "root": "dataList",
  "url": window.WEB_ROOT+"/com.primeton.portal.purview.service.QuickMenuManagerService.searchQuickMenuByUserId(com.primeton.widget.auth.User s:portal_user).java",
  "saveUrl": window.WEB_ROOT+"/com.primeton.portal.purview.service.QuickMenuManagerService.save(com.primeton.portal.purview.entity.QuickMenu[] insertedRecords, com.primeton.portal.purview.entity.QuickMenu[] updatedRecords, com.primeton.portal.purview.entity.QuickMenu[] deletedRecords).java",
  "addUrl": null,
  "updateUrl": null,
  "deleteUrl": null,
  "dataProvider": "JavaBean",
  "fields": [
    {
      "id": getNSValue('quickMenuid'),
      "xtype": "datafield",
      "listeners": {},
      "name": "id",
      "type": "string",
      "mapping": "id",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "id",
      "canbenull": true
    },
    {
      "id": getNSValue('quickMenuuserId'),
      "xtype": "datafield",
      "listeners": {},
      "name": "userId",
      "type": "string",
      "mapping": "userId",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "userId",
      "canbenull": true
    },
    {
      "id": getNSValue('quickMenuaction'),
      "xtype": "datafield",
      "listeners": {},
      "name": "action",
      "type": "string",
      "mapping": "action",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "action",
      "canbenull": false
    },
    {
      "id": getNSValue('quickMenumenuName'),
      "xtype": "datafield",
      "listeners": {},
      "name": "menuName",
      "type": "string",
      "mapping": "menuName",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "menuName",
      "canbenull": true
    },
    {
      "id": getNSValue('quickMenusort'),
      "xtype": "datafield",
      "listeners": {},
      "name": "sort",
      "type": "int",
      "mapping": "sort",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "sort",
      "canbenull": true
    },
    {
      "id": getNSValue('quickMenuicon'),
      "xtype": "datafield",
      "listeners": {},
      "name": "icon",
      "type": "string",
      "mapping": "icon",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "icon",
      "canbenull": false
    },
    {
      "id": getNSValue('quickMenuversion'),
      "xtype": "datafield",
      "listeners": {},
      "name": "version",
      "type": "int",
      "mapping": "version",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "version",
      "canbenull": false
    },
    {
      "id": getNSValue('quickMenuopenMode'),
      "xtype": "datafield",
      "listeners": {},
      "name": "openMode",
      "type": "int",
      "mapping": "openMode",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "openMode",
      "canbenull": true
    },
    {
      "id": getNSValue('quickMenusystemName'),
      "xtype": "datafield",
      "listeners": {},
      "name": "systemName",
      "type": "string",
      "mapping": "systemName",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "systemName",
      "canbenull": true
    }
  ]
}}
	);
	UIManager.registerHiddenWidgets(
{
  "listeners": {},
  "hiddenWidgets": []
}
	);
	UIManager.register(
{
  "id": getNSValue('quickMenuWindow'),
  "xtype": "window",
  "listeners": {},
  "layout": "anchor",
  "width": 582,
  "height": 339,
  "title": "快捷菜单维护",
  "footer": true,
  "modal": true,
  "iconCls": "widget-config",
  "items": [{
    "id": getNSValue('commongrid1'),
    "xtype": "commongrid",
    "listeners": {"beforeadd": function beforeadd( thisObj , component , index ){
 Ext.Msg.alert("提示信息","请在功能树上使用右键菜单添加快捷菜单。");

return false;
} },
    "anchor": "100% 100%",
    "store": getNSValue('quickMenu'),
    "title": "",
    "selModel": {
      "id": getNSValue('checkboxSelectionModel1'),
      "xtype": "checkboxSelectionModel",
      "listeners": {}
    },
    "bbar": {
      "id": getNSValue('paging1'),
      "xtype": "paging",
      "listeners": {},
      "pageSize": 100,
      "displayMsg": "显示 {0} - {1} 共 {2} 条",
      "emptyMsg": "没有数据",
      "displayAddButton": true,
      "displayDelButton": true,
      "displaySaveButton": true
    },
    "footer": true,
    "buttonAlign": "center",
    "height": 211,
    "autoLoadData": true,
    "width": 480,
    "columns": [
      {
        "id": getNSValue('commongrid1_menuName'),
        "xtype": "column",
        "listeners": {},
        "width": 138,
        "header": "菜单名称",
        "sortable": false,
        "align": "left",
        "dataIndex": "menuName",
        "editor": {
          "id": getNSValue('textfield4'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "menuName"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_systemName'),
        "xtype": "column",
        "listeners": {},
        "width": 153,
        "header": "所属应用",
        "sortable": false,
        "align": "left",
        "dataIndex": "systemName",
        "editor": {
          "id": getNSValue('textfield1'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "systemName"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_sort'),
        "xtype": "column",
        "listeners": {},
        "width": 67,
        "header": "显示顺序",
        "sortable": false,
        "align": "left",
        "dataIndex": "sort",
        "editor": {
          "id": getNSValue('numberfield1'),
          "xtype": "numberfield",
          "listeners": {},
          "fieldLabel": "",
          "value": "",
          "emptyText": "请输入数字...",
          "hideLabel": false,
          "width": 135,
          "name": "sort"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_openMode'),
        "xtype": "column",
        "listeners": {},
        "width": 142,
        "header": "打开方式",
        "sortable": false,
        "align": "left",
        "dataIndex": "openMode",
        "editor": {
          "id": getNSValue('combo1'),
          "xtype": "combo",
          "listeners": {},
          "fieldLabel": "",
          "displayField": "",
          "valueField": "",
          "emptyText": "请选择...",
          "width": 135,
          "forceSelection": true,
          "hideLabel": false,
          "dataList": "0:在新窗口中打开;1:在新tab页中打开;2:在同一tab页中打开"
        },
        "hidden": false
      }
    ]
  }]
}
	);
	var quickMenu;
		quickMenu = EOS.getDataSource('quickMenu', _ns);

	var quickMenuWindow, commongrid1, commongrid1_menuName, commongrid1_systemName, commongrid1_sort, commongrid1_openMode, checkboxSelectionModel1, paging1, textfield4, textfield1, numberfield1, combo1;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		quickMenuWindow = EOS.getCmp('quickMenuWindow', _ns);
		commongrid1 = EOS.getCmp('commongrid1', _ns);
		commongrid1_menuName = EOS.getCmp('commongrid1_menuName', _ns);
		commongrid1_systemName = EOS.getCmp('commongrid1_systemName', _ns);
		commongrid1_sort = EOS.getCmp('commongrid1_sort', _ns);
		commongrid1_openMode = EOS.getCmp('commongrid1_openMode', _ns);
		checkboxSelectionModel1 = EOS.getCmp('checkboxSelectionModel1', _ns);
		paging1 = EOS.getCmp('paging1', _ns);
		textfield4 = EOS.getCmp('textfield4', _ns);
		textfield1 = EOS.getCmp('textfield1', _ns);
		numberfield1 = EOS.getCmp('numberfield1', _ns);
		combo1 = EOS.getCmp('combo1', _ns);


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