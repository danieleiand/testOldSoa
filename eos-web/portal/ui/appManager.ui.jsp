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
{"getNSValue('ds_app')": {
  "id": getNSValue('ds_app'),
  "name": getNSValue('ds_app'),
  "xtype": "servicestore",
  "listeners": {
    "beforeSave": function beforeSave( config , params ){

		for(var i=0;i<params.insertedRecords.length;i++){
			var insAppId=params.insertedRecords[i].appId.trim();
			params.insertedRecords[i].appId=insAppId;
			if(insAppId==""){
				Ext.Msg.alert("提示信息","应用的应用Id不能为空");
				return false;
			}
		}

		for(var j=0;j<params.updatedRecords.length;j++){
			var upAppId=params.updatedRecords[j].appId.trim();
			params.updatedRecords[j].appId=upAppId;
			if(upAppId==""){
				Ext.Msg.alert("提示信息","应用的应用Id不能为空");
				return false;
			} 
		} 
		
} ,
    "onSaveSuccess": function onSaveSuccess( response ){
    var ds_app= Ext.getCmp("ds_app");
    ds_app.reload();
} 
  },
  "entityType": "com.primeton.portal.purview.entity.Application",
  "root": "dataList",
  "dataProvider": "JavaBean",
  "url": window.WEB_ROOT+"/com.primeton.portal.purview.service.AppManagerService.searchWithPage(com.primeton.portal.purview.service.PageCond pageCond).java",
  "saveUrl": window.WEB_ROOT+"/com.primeton.portal.purview.service.AppManagerService.save(com.primeton.portal.purview.entity.Application[] insertedRecords, com.primeton.portal.purview.entity.Application[] updatedRecords, com.primeton.portal.purview.entity.Application[] deletedRecords).java",
  "addUrl": null,
  "updateUrl": null,
  "deleteUrl": null,
  "fields": [
    {
      "id": getNSValue('ds_appappId'),
      "xtype": "datafield",
      "listeners": {},
      "name": "appId",
      "type": "string",
      "mapping": "appId",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "应用Id",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appappName'),
      "xtype": "datafield",
      "listeners": {},
      "name": "appName",
      "type": "string",
      "mapping": "appName",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "应用名",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appurl'),
      "xtype": "datafield",
      "listeners": {},
      "name": "url",
      "type": "string",
      "mapping": "url",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "url",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appversion'),
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
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appappDisplayName'),
      "xtype": "datafield",
      "listeners": {},
      "name": "appDisplayName",
      "type": "string",
      "mapping": "appDisplayName",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "appDisplayName",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appopenMode'),
      "xtype": "datafield",
      "listeners": {},
      "name": "openMode",
      "type": "int",
      "mapping": "openMode",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "3",
      "displayName": "openMode",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_apptreeRootName'),
      "xtype": "datafield",
      "listeners": {},
      "name": "treeRootName",
      "type": "string",
      "mapping": "treeRootName",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "treeRootName",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_apptreeOpenMode'),
      "xtype": "datafield",
      "listeners": {},
      "name": "treeOpenMode",
      "type": "int",
      "mapping": "treeOpenMode",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "1",
      "displayName": "treeOpenMode",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appicon'),
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
      "canbenull": true
    },
    {
      "id": getNSValue('ds_applocalApp'),
      "xtype": "datafield",
      "listeners": {},
      "name": "localApp",
      "type": "string",
      "mapping": "localApp",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "true",
      "displayName": "localApp",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_apptreeShowRoot'),
      "xtype": "datafield",
      "listeners": {},
      "name": "treeShowRoot",
      "type": "string",
      "mapping": "treeShowRoot",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "true",
      "displayName": "treeShowRoot",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appsystemMenu'),
      "xtype": "datafield",
      "listeners": {},
      "name": "systemMenu",
      "type": "string",
      "mapping": "systemMenu",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "true",
      "displayName": "systemMenu",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_apptreeDataUrl'),
      "xtype": "datafield",
      "listeners": {},
      "name": "treeDataUrl",
      "type": "string",
      "mapping": "treeDataUrl",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "treeDataUrl",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appappAction'),
      "xtype": "datafield",
      "listeners": {},
      "name": "appAction",
      "type": "string",
      "mapping": "appAction",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "appAction",
      "canbenull": true
    },
    {
      "id": getNSValue('ds_appsort'),
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
      "id": getNSValue('ds_apploginType'),
      "xtype": "datafield",
      "listeners": {},
      "name": "loginType",
      "type": "int",
      "mapping": "loginType",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "0",
      "displayName": "loginType",
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
  "id": getNSValue('window1'),
  "xtype": "window",
  "listeners": {},
  "layout": "anchor",
  "width": 480,
  "height": 300,
  "title": "维护应用",
  "footer": true,
  "modal": true,
  "items": [{
    "id": getNSValue('commongrid1'),
    "xtype": "commongrid",
    "listeners": {},
    "anchor": "100% 100%",
    "store": getNSValue('ds_app'),
    "title": "",
    "bbar": {
      "id": getNSValue('paging1'),
      "xtype": "paging",
      "listeners": {},
      "pageSize": 15,
      "displayMsg": "显示 {0} - {1} 共 {2} 条",
      "emptyMsg": "没有数据",
      "displayAddButton": true,
      "displayDelButton": true,
      "displaySaveButton": true,
      "displayInfo": false
    },
    "footer": true,
    "buttonAlign": "center",
    "autoLoadData": true,
    "border": false,
    "columns": [
      {
        "id": getNSValue('commongrid1_sort'),
        "xtype": "column",
        "listeners": {},
        "width": 36,
        "header": "序号",
        "sortable": true,
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
        "id": getNSValue('commongrid1_appId'),
        "xtype": "column",
        "listeners": {},
        "width": 59,
        "header": "应用Id",
        "sortable": true,
        "align": "left",
        "dataIndex": "appId",
        "editor": {
          "id": getNSValue('textfield1'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "appId"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_appName'),
        "xtype": "column",
        "listeners": {},
        "width": 90,
        "header": "应用名",
        "sortable": true,
        "align": "left",
        "dataIndex": "appName",
        "editor": {
          "id": getNSValue('textfield2'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "appName"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_url'),
        "xtype": "column",
        "listeners": {},
        "width": 130,
        "header": "url",
        "sortable": true,
        "align": "left",
        "dataIndex": "url",
        "editor": {
          "id": getNSValue('textfield3'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "url"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_loginType'),
        "xtype": "column",
        "listeners": {},
        "width": 62,
        "header": "登录模式",
        "sortable": true,
        "align": "left",
        "dataIndex": "loginType",
        "editor": {
          "id": getNSValue('combo4'),
          "xtype": "combo",
          "listeners": {},
          "fieldLabel": "",
          "displayField": "",
          "valueField": "",
          "emptyText": "请选择...",
          "width": 135,
          "forceSelection": true,
          "hideLabel": false,
          "name": "loginType",
          "dataList": "0:单点登录;1:模拟登录"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_appDisplayName'),
        "xtype": "column",
        "listeners": {},
        "width": 79,
        "header": "系统菜单名",
        "sortable": true,
        "align": "left",
        "dataIndex": "appDisplayName",
        "editor": {
          "id": getNSValue('textfield4'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "appDisplayName"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_systemMenu'),
        "xtype": "column",
        "listeners": {},
        "width": 58,
        "header": "是否显示",
        "sortable": true,
        "align": "left",
        "dataIndex": "systemMenu",
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
          "name": "systemMenu",
          "dataList": "true:显示;false:不显示"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_icon'),
        "xtype": "column",
        "listeners": {},
        "width": 148,
        "header": "系统菜单图标",
        "sortable": false,
        "align": "left",
        "dataIndex": "icon",
        "editor": {
          "id": getNSValue('textfield6'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "icon"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_localApp'),
        "xtype": "column",
        "listeners": {},
        "width": 63,
        "header": "本地/远程",
        "sortable": false,
        "align": "left",
        "dataIndex": "localApp",
        "editor": {
          "id": getNSValue('combo5'),
          "xtype": "combo",
          "listeners": {},
          "fieldLabel": "",
          "displayField": "",
          "valueField": "",
          "emptyText": "请选择...",
          "width": 135,
          "forceSelection": true,
          "hideLabel": false,
          "name": "localApp",
          "dataList": "true:本地;false:远程"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_openMode'),
        "xtype": "column",
        "listeners": {},
        "width": 106,
        "header": "系统菜单执行方式",
        "sortable": true,
        "align": "left",
        "dataIndex": "openMode",
        "editor": {
          "id": getNSValue('combo2'),
          "xtype": "combo",
          "listeners": {},
          "fieldLabel": "",
          "displayField": "",
          "valueField": "",
          "emptyText": "请选择...",
          "width": 135,
          "forceSelection": true,
          "hideLabel": false,
          "name": "openMode",
          "dataList": "0:在新窗口中打开;1:在Tab页中打开;2:在同一Tab页中打开;3:链接功能菜单"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_appAction'),
        "xtype": "column",
        "listeners": {},
        "width": 134,
        "header": "系统菜单Action",
        "sortable": false,
        "align": "left",
        "dataIndex": "appAction",
        "editor": {
          "id": getNSValue('textfield5'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "appAction"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_treeDataUrl'),
        "xtype": "column",
        "listeners": {},
        "width": 189,
        "header": "功能菜单url",
        "sortable": false,
        "align": "left",
        "dataIndex": "treeDataUrl",
        "editor": {
          "id": getNSValue('textfield9'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "treeDataUrl"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_treeOpenMode'),
        "xtype": "column",
        "listeners": {},
        "width": 109,
        "header": "功能菜单打开方式",
        "sortable": false,
        "align": "left",
        "dataIndex": "treeOpenMode",
        "editor": {
          "id": getNSValue('combo3'),
          "xtype": "combo",
          "listeners": {},
          "fieldLabel": "",
          "displayField": "",
          "valueField": "",
          "emptyText": "请选择...",
          "width": 135,
          "forceSelection": true,
          "hideLabel": false,
          "name": "treeOpenMode",
          "dataList": "0:在新窗口中打开;1:在Tab页中打开;2:在同一Tab页中打开"
        },
        "hidden": false
      },
      {
        "id": getNSValue('commongrid1_treeShowRoot'),
        "xtype": "column",
        "listeners": {},
        "width": 70,
        "header": "显示根节点",
        "sortable": false,
        "align": "left",
        "dataIndex": "treeShowRoot",
        "hidden": false,
        "editor": {
          "id": getNSValue('textfield8'),
          "xtype": "combo",
          "listeners": {},
          "fieldLabel": "",
          "displayField": "",
          "valueField": "",
          "emptyText": "请选择...",
          "width": 135,
          "forceSelection": true,
          "hideLabel": false,
          "name": "treeShowRoot",
          "dataList": "true:显示;false:不显示"
        }
      },
      {
        "id": getNSValue('commongrid1_treeRootName'),
        "xtype": "column",
        "listeners": {},
        "width": 74,
        "header": "根节点名称",
        "sortable": false,
        "align": "left",
        "dataIndex": "treeRootName",
        "editor": {
          "id": getNSValue('textfield7'),
          "xtype": "textfield",
          "listeners": {},
          "fieldLabel": "",
          "hideLabel": false,
          "width": 135,
          "name": "treeRootName"
        },
        "hidden": false
      }
    ]
  }]
}
	);
	var ds_app;
		ds_app = EOS.getDataSource('ds_app', _ns);

	var window1, commongrid1, commongrid1_sort, commongrid1_appId, commongrid1_appName, commongrid1_url, commongrid1_loginType, commongrid1_appDisplayName, commongrid1_systemMenu, commongrid1_icon, commongrid1_localApp, commongrid1_openMode, commongrid1_appAction, commongrid1_treeDataUrl, commongrid1_treeOpenMode, commongrid1_treeShowRoot, commongrid1_treeRootName, paging1, numberfield1, textfield1, textfield2, textfield3, combo4, textfield4, combo1, textfield6, combo5, combo2, textfield5, textfield9, combo3, textfield8, textfield7;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		window1 = EOS.getCmp('window1', _ns);
		commongrid1 = EOS.getCmp('commongrid1', _ns);
		commongrid1_sort = EOS.getCmp('commongrid1_sort', _ns);
		commongrid1_appId = EOS.getCmp('commongrid1_appId', _ns);
		commongrid1_appName = EOS.getCmp('commongrid1_appName', _ns);
		commongrid1_url = EOS.getCmp('commongrid1_url', _ns);
		commongrid1_loginType = EOS.getCmp('commongrid1_loginType', _ns);
		commongrid1_appDisplayName = EOS.getCmp('commongrid1_appDisplayName', _ns);
		commongrid1_systemMenu = EOS.getCmp('commongrid1_systemMenu', _ns);
		commongrid1_icon = EOS.getCmp('commongrid1_icon', _ns);
		commongrid1_localApp = EOS.getCmp('commongrid1_localApp', _ns);
		commongrid1_openMode = EOS.getCmp('commongrid1_openMode', _ns);
		commongrid1_appAction = EOS.getCmp('commongrid1_appAction', _ns);
		commongrid1_treeDataUrl = EOS.getCmp('commongrid1_treeDataUrl', _ns);
		commongrid1_treeOpenMode = EOS.getCmp('commongrid1_treeOpenMode', _ns);
		commongrid1_treeShowRoot = EOS.getCmp('commongrid1_treeShowRoot', _ns);
		commongrid1_treeRootName = EOS.getCmp('commongrid1_treeRootName', _ns);
		paging1 = EOS.getCmp('paging1', _ns);
		numberfield1 = EOS.getCmp('numberfield1', _ns);
		textfield1 = EOS.getCmp('textfield1', _ns);
		textfield2 = EOS.getCmp('textfield2', _ns);
		textfield3 = EOS.getCmp('textfield3', _ns);
		combo4 = EOS.getCmp('combo4', _ns);
		textfield4 = EOS.getCmp('textfield4', _ns);
		combo1 = EOS.getCmp('combo1', _ns);
		textfield6 = EOS.getCmp('textfield6', _ns);
		combo5 = EOS.getCmp('combo5', _ns);
		combo2 = EOS.getCmp('combo2', _ns);
		textfield5 = EOS.getCmp('textfield5', _ns);
		textfield9 = EOS.getCmp('textfield9', _ns);
		combo3 = EOS.getCmp('combo3', _ns);
		textfield8 = EOS.getCmp('textfield8', _ns);
		textfield7 = EOS.getCmp('textfield7', _ns);


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