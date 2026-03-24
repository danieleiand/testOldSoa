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
{
  "getNSValue('ds_app')": {
    "id": getNSValue('ds_app'),
    "name": getNSValue('ds_app'),
    "xtype": "servicestore",
    "listeners": {"load": function load( thisObj , records , options ){
publishedWidgetGrid.loadData();
} },
    "entityType": "com.primeton.portal.purview.entity.Application",
    "root": "dataList",
    "dataProvider": "JavaBean",
    "url": window.WEB_ROOT+"/com.primeton.portal.purview.service.AppManagerService.searchAll().java",
    "saveUrl": null,
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "autoLoad": true,
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
        "displayName": "应用ID",
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
      }
    ]
  },
  "getNSValue('widgetStore')": {
    "id": getNSValue('widgetStore'),
    "name": getNSValue('widgetStore'),
    "xtype": "servicestore",
    "listeners": {},
    "entityType": "com.primeton.widget.impl.Widget",
    "root": "dataList",
    "dataProvider": "JavaBean",
    "url": window.WEB_ROOT+"/com.primeton.widget.impl.WidgetContainer.getNewWidgets().java",
    "saveUrl": null,
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "fields": [
      {
        "id": getNSValue('widgetStoreshared'),
        "xtype": "datafield",
        "listeners": {},
        "name": "shared",
        "type": "boolean",
        "mapping": "shared",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "shared",
        "canbenull": true
      },
      {
        "id": getNSValue('widgetStorecharset'),
        "xtype": "datafield",
        "listeners": {},
        "name": "charset",
        "type": "string",
        "mapping": "charset",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "charset",
        "canbenull": true
      },
      {
        "id": getNSValue('widgetStoretype'),
        "xtype": "datafield",
        "listeners": {},
        "name": "type",
        "type": "string",
        "mapping": "type",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "type",
        "canbenull": true
      },
      {
        "id": getNSValue('widgetStorewidgetId'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetId",
        "type": "string",
        "mapping": "widgetId",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "widgetId",
        "canbenull": true
      },
      {
        "id": getNSValue('widgetStorename'),
        "xtype": "datafield",
        "listeners": {},
        "name": "name",
        "type": "string",
        "mapping": "name",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "name",
        "canbenull": true
      },
      {
        "id": getNSValue('widgetStoredescription'),
        "xtype": "datafield",
        "listeners": {},
        "name": "description",
        "type": "string",
        "mapping": "description",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "description",
        "canbenull": true
      },
      {
        "id": getNSValue('widgetStoretitle'),
        "xtype": "datafield",
        "listeners": {},
        "name": "title",
        "type": "string",
        "mapping": "title",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "title",
        "canbenull": true
      },
      {
        "id": getNSValue('widgetStoreuri'),
        "xtype": "datafield",
        "listeners": {},
        "name": "uri",
        "type": "string",
        "mapping": "uri",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "uri",
        "canbenull": true
      },
      {
        "id": getNSValue('widgetStoreicon'),
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
      }
    ]
  },
  "getNSValue('publishedWidgetStore')": {
    "id": getNSValue('publishedWidgetStore'),
    "name": getNSValue('publishedWidgetStore'),
    "xtype": "servicestore",
    "listeners": {},
    "entityType": "com.primeton.portal.purview.entity.Widget",
    "root": "dataList",
    "url": window.WEB_ROOT+"/com.primeton.widget.impl.WidgetContainer.getSharedWidgets().java",
    "saveUrl": window.WEB_ROOT+"/com.primeton.widget.manager.WidgetManager.saveWidget(com.primeton.portal.purview.entity.Widget[] insertWidgets, com.primeton.portal.purview.entity.Widget[] updateWidgets, com.primeton.portal.purview.entity.Widget[] deleteWidgets).java",
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "dataProvider": "JavaBean",
    "deletedProperty": "deleteWidgets",
    "insertedProperty": "insertWidgets",
    "updatedProperty": "updateWidgets",
    "fields": [
      {
        "id": getNSValue('publishedWidgetStoreid'),
        "xtype": "datafield",
        "listeners": {},
        "name": "id",
        "type": "string",
        "mapping": "id",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "标识",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStorewidgetName'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetName",
        "type": "string",
        "mapping": "widgetName",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "名称",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStorecatalog'),
        "xtype": "datafield",
        "listeners": {},
        "name": "catalog",
        "type": "int",
        "mapping": "catalog",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "分类",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStorewidgetType'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetType",
        "type": "int",
        "mapping": "widgetType",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "widget类别",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStorepath'),
        "xtype": "datafield",
        "listeners": {},
        "name": "path",
        "type": "string",
        "mapping": "path",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "URI",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStorewidgetId'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetId",
        "type": "string",
        "mapping": "widgetId",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "widget编号",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStorestatus'),
        "xtype": "datafield",
        "listeners": {},
        "name": "status",
        "type": "int",
        "mapping": "status",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "0",
        "displayName": "状态",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStoreapplication.appId'),
        "xtype": "datafield",
        "listeners": {},
        "name": "application.appId",
        "type": "string",
        "mapping": "application.appId",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "应用Id",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStoreapplication.appName'),
        "xtype": "datafield",
        "listeners": {},
        "name": "application.appName",
        "type": "string",
        "mapping": "application.appName",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "应用名",
        "canbenull": true
      },
      {
        "id": getNSValue('publishedWidgetStoreversion'),
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
      }
    ]
  }
}
	);
	UIManager.registerHiddenWidgets(
{
  "listeners": {},
  "hiddenWidgets": []
}
	);
	UIManager.register(
{
  "id": getNSValue('mainpage'),
  "xtype": "viewport",
  "listeners": {},
  "layout": "anchor",
  "items": [{
    "id": getNSValue('panel1'),
    "xtype": "panel",
    "listeners": {},
    "border": false,
    "frame": false,
    "anchor": "100% 100%",
    "layout": "border",
    "footer": true,
    "buttonAlign": "center",
    "autoScroll": true,
    "bodyBorder": false,
    "items": [
      {
        "id": getNSValue('top_panel'),
        "xtype": "panel",
        "listeners": {"beforeCreate": function beforeCreate( config ){
config.collapseMode="mini";
config.split = true;
} },
        "border": false,
        "frame": false,
        "height": 240,
        "layout": "anchor",
        "region": "north",
        "footer": true,
        "anchor": "100%",
        "collapsible": false,
        "title": "待导入widget列表",
        "bodyBorder": false,
        "width": 840,
        "items": [{
          "id": getNSValue('widgetGrid'),
          "xtype": "commongrid",
          "listeners": {},
          "anchor": "100% 100%",
          "store": getNSValue('widgetStore'),
          "title": "",
          "selModel": {
            "id": getNSValue('checkboxSelectionModel2'),
            "xtype": "checkboxSelectionModel",
            "listeners": {},
            "singleSelect": false
          },
          "footer": true,
          "buttonAlign": "center",
          "bbar": {
            "id": getNSValue('paging2'),
            "xtype": "paging",
            "listeners": {},
            "pageSize": 10,
            "displayMsg": "显示 {0} - {1} 共 {2} 条",
            "emptyMsg": "没有数据",
            "displayAddButton": false,
            "displayDelButton": false,
            "displayPaging": false,
            "displaySaveButton": false,
            "items": [
              {
                "id": getNSValue('tbitem1'),
                "xtype": "tbseparator",
                "listeners": {}
              },
              {
                "id": getNSValue('button1'),
                "xtype": "button",
                "listeners": {"click": function click( thisObj , e ){
var url = getWebRoot()+"/portal/action/reloadWidgets.jsp"
					
	
			ajaxCall(url, {}, function() {
			
			widgetStore.reload();
			
			
			}, function() {
						alert("Reload failed!")
					});
	
} },
                "text": "重载",
                "icon": window.WEB_ROOT+"/portal/images/reload.png",
                "iconCls": "import"
              },
              {
                "id": getNSValue('tbitem3'),
                "xtype": "tbseparator",
                "listeners": {}
              },
              {
                "id": getNSValue('button10'),
                "xtype": "button",
                "listeners": {"click": function click( thisObj , e ){
var records = widgetGrid.getSelectionModel().getSelections();
var TopicRecord = Ext.data.Record.create([
   {name: 'widgetName', mapping: 'widgetName'},
   {name: 'widgetId', mapping: 'widgetId'},
   {name: 'widgetType', mapping: 'widgetType'},
   {name: 'path', mapping: 'path'},
   {name: 'status', mapping: 'status'},
   {name: 'id', mapping: 'id'},
   {name: 'application',mapping: 'application'},
   {name: 'catalog',mapping: 'catalog'}
]);
var typeMapping = {
	"ui":1,
	"url":2,
	"google":3,
	"html":4,
	"portal":5
};
var newRecords = [];
for(var i=0;i<records.length;i++){
	var record = records[i];
	var newRecord = new TopicRecord({
		"widgetName":record.get("name"),
		"widgetId":record.get("widgetId"),
		"widgetType":typeMapping[record.get("type")],
		"path":record.get("uri"),
		"status":"1",
		"catalog":1
	});
	newRecords.push(newRecord);
	widgetStore.remove(record);
}
if(newRecords.length>0){
	publishedWidgetStore.add(newRecords);
}

} },
                "text": "导入",
                "fieldLabel": "",
                "colspan": 1,
                "name": "",
                "hidden": false,
                "hideLabel": false,
                "icon": window.WEB_ROOT+"/portal/images/down.gif",
                "iconCls": "import"
              }
            ]
          },
          "autoLoadData": true,
          "height": 181,
          "width": 829,
          "autoExpandColumn": "commongrid3_icon",
          "columns": [
            {
              "id": getNSValue('commongrid3_widgetId'),
              "xtype": "column",
              "listeners": {},
              "width": 92,
              "header": "编号",
              "sortable": true,
              "align": "left",
              "dataIndex": "widgetId",
              "hidden": false
            },
            {
              "id": getNSValue('commongrid3_name'),
              "xtype": "column",
              "listeners": {},
              "width": 116,
              "header": "名称",
              "sortable": true,
              "align": "left",
              "dataIndex": "name",
              "hidden": false
            },
            {
              "id": getNSValue('commongrid3_title'),
              "xtype": "column",
              "listeners": {},
              "width": 133,
              "header": "标题",
              "sortable": true,
              "align": "left",
              "dataIndex": "title",
              "hidden": false
            },
            {
              "id": getNSValue('commongrid3_description'),
              "xtype": "column",
              "listeners": {},
              "width": 163,
              "header": "描述",
              "sortable": false,
              "align": "left",
              "dataIndex": "description",
              "hidden": false
            },
            {
              "id": getNSValue('commongrid3_uri'),
              "xtype": "column",
              "listeners": {},
              "width": 104,
              "header": "URI",
              "sortable": false,
              "align": "left",
              "dataIndex": "uri",
              "hidden": false
            },
            {
              "id": getNSValue('commongrid3_type'),
              "xtype": "column",
              "listeners": {},
              "width": 72,
              "header": "类型",
              "sortable": true,
              "align": "left",
              "dataIndex": "type",
              "hidden": false
            },
            {
              "id": getNSValue('commongrid3_icon'),
              "xtype": "column",
              "listeners": {},
              "width": 235,
              "header": "图标",
              "sortable": false,
              "align": "left",
              "dataIndex": "icon",
              "hidden": false
            }
          ]
        }]
      },
      {
        "id": getNSValue('main_panel'),
        "xtype": "panel",
        "listeners": {},
        "border": false,
        "frame": false,
        "layout": "anchor",
        "region": "center",
        "footer": true,
        "height": 346,
        "anchor": "100%",
        "autoScroll": false,
        "bodyBorder": false,
        "items": [{
          "id": getNSValue('publishedWidgetGrid'),
          "xtype": "commongrid",
          "listeners": {},
          "anchor": "100% 100%",
          "store": getNSValue('publishedWidgetStore'),
          "title": "widget列表",
          "selModel": {
            "id": getNSValue('checkboxSelectionModel1'),
            "xtype": "checkboxSelectionModel",
            "listeners": {}
          },
          "footer": true,
          "buttonAlign": "center",
          "height": 449,
          "width": 776,
          "tbar": {
            "id": getNSValue('paging1'),
            "xtype": "paging",
            "listeners": {},
            "pageSize": 10,
            "displayMsg": "显示 {0} - {1} 共 {2} 条",
            "emptyMsg": "没有数据",
            "displayAddButton": false,
            "displayPaging": false,
            "items": [
              {
                "id": getNSValue('tbitem2'),
                "xtype": "tbseparator",
                "listeners": {}
              },
              {
                "id": getNSValue('button_app'),
                "xtype": "button",
                "listeners": {"click": function click( thisObj , e ){
showDialog('appManager.ui',null,null,window,null,true);
} },
                "text": "维护应用",
                "fieldLabel": "",
                "colspan": 1,
                "name": "",
                "hidden": false,
                "hideLabel": false,
                "icon": window.WEB_ROOT+"/portal/images/rightAll.gif",
                "iconCls": "rightAll"
              }
            ]
          },
          "border": false,
          "autoExpandColumn": "publishedWidgetGrid_widgetType",
          "columns": [
            {
              "id": getNSValue('commongrid1_widgetId'),
              "xtype": "column",
              "listeners": {},
              "width": 106,
              "header": "编号",
              "sortable": true,
              "align": "left",
              "dataIndex": "widgetId",
              "hidden": false
            },
            {
              "id": getNSValue('commongrid1_widgetName'),
              "xtype": "column",
              "listeners": {},
              "width": 117,
              "header": "名称",
              "sortable": true,
              "align": "left",
              "dataIndex": "widgetName",
              "hidden": false,
              "editor": {
                "id": getNSValue('textfield1'),
                "xtype": "textfield",
                "listeners": {},
                "fieldLabel": "",
                "hideLabel": false,
                "width": 135,
                "name": "widgetName"
              }
            },
            {
              "id": getNSValue('publishedWidgetGrid_application_appid'),
              "xtype": "column",
              "listeners": {},
              "width": 124,
              "header": "所属应用",
              "sortable": true,
              "align": "left",
              "dataIndex": "application.appId",
              "hidden": false,
              "editor": {
                "id": getNSValue('combo4'),
                "xtype": "combo",
                "listeners": {},
                "fieldLabel": "",
                "displayField": "appId",
                "valueField": "appId",
                "emptyText": "请选择...",
                "width": 135,
                "forceSelection": false,
                "hideLabel": false,
                "name": "application.appId",
                "store": getNSValue('ds_app'),
                "mode": "local",
                "dataList": ""
              }
            },
            {
              "id": getNSValue('commongrid1_status'),
              "xtype": "column",
              "listeners": {},
              "width": 69,
              "header": "状态",
              "sortable": true,
              "align": "left",
              "dataIndex": "status",
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
                "name": "status",
                "dataList": "0:受控;1:共享"
              },
              "hidden": false
            },
            {
              "id": getNSValue('commongrid1_path'),
              "xtype": "column",
              "listeners": {},
              "width": 114,
              "header": "URI",
              "sortable": false,
              "align": "left",
              "dataIndex": "path",
              "hidden": false
            },
            {
              "id": getNSValue('publishedWidgetGrid_widgetType'),
              "xtype": "column",
              "listeners": {},
              "width": 113,
              "header": "widget类别",
              "sortable": true,
              "align": "left",
              "dataIndex": "widgetType",
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
                "name": "widgetType",
                "dataList": "1:ui;2:url;3:google;4:html;5:portal",
                "editable": false,
                "readOnly": true
              },
              "hidden": false
            }
          ]
        }]
      }
    ]
  }]
}
	);
	var ds_app, widgetStore, publishedWidgetStore;
		ds_app = EOS.getDataSource('ds_app', _ns);
		widgetStore = EOS.getDataSource('widgetStore', _ns);
		publishedWidgetStore = EOS.getDataSource('publishedWidgetStore', _ns);

	var mainpage, panel1, top_panel, main_panel, widgetGrid, publishedWidgetGrid, commongrid3_widgetId, commongrid3_name, commongrid3_title, commongrid3_description, commongrid3_uri, commongrid3_type, commongrid3_icon, checkboxSelectionModel2, paging2, commongrid1_widgetId, commongrid1_widgetName, publishedWidgetGrid_application_appid, commongrid1_status, commongrid1_path, publishedWidgetGrid_widgetType, checkboxSelectionModel1, paging1, tbitem1, button1, tbitem3, button10, textfield1, combo4, combo2, combo3, tbitem2, button_app;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		mainpage = EOS.getCmp('mainpage', _ns);
		panel1 = EOS.getCmp('panel1', _ns);
		top_panel = EOS.getCmp('top_panel', _ns);
		main_panel = EOS.getCmp('main_panel', _ns);
		widgetGrid = EOS.getCmp('widgetGrid', _ns);
		publishedWidgetGrid = EOS.getCmp('publishedWidgetGrid', _ns);
		commongrid3_widgetId = EOS.getCmp('commongrid3_widgetId', _ns);
		commongrid3_name = EOS.getCmp('commongrid3_name', _ns);
		commongrid3_title = EOS.getCmp('commongrid3_title', _ns);
		commongrid3_description = EOS.getCmp('commongrid3_description', _ns);
		commongrid3_uri = EOS.getCmp('commongrid3_uri', _ns);
		commongrid3_type = EOS.getCmp('commongrid3_type', _ns);
		commongrid3_icon = EOS.getCmp('commongrid3_icon', _ns);
		checkboxSelectionModel2 = EOS.getCmp('checkboxSelectionModel2', _ns);
		paging2 = EOS.getCmp('paging2', _ns);
		commongrid1_widgetId = EOS.getCmp('commongrid1_widgetId', _ns);
		commongrid1_widgetName = EOS.getCmp('commongrid1_widgetName', _ns);
		publishedWidgetGrid_application_appid = EOS.getCmp('publishedWidgetGrid_application_appid', _ns);
		commongrid1_status = EOS.getCmp('commongrid1_status', _ns);
		commongrid1_path = EOS.getCmp('commongrid1_path', _ns);
		publishedWidgetGrid_widgetType = EOS.getCmp('publishedWidgetGrid_widgetType', _ns);
		checkboxSelectionModel1 = EOS.getCmp('checkboxSelectionModel1', _ns);
		paging1 = EOS.getCmp('paging1', _ns);
		tbitem1 = EOS.getCmp('tbitem1', _ns);
		button1 = EOS.getCmp('button1', _ns);
		tbitem3 = EOS.getCmp('tbitem3', _ns);
		button10 = EOS.getCmp('button10', _ns);
		textfield1 = EOS.getCmp('textfield1', _ns);
		combo4 = EOS.getCmp('combo4', _ns);
		combo2 = EOS.getCmp('combo2', _ns);
		combo3 = EOS.getCmp('combo3', _ns);
		tbitem2 = EOS.getCmp('tbitem2', _ns);
		button_app = EOS.getCmp('button_app', _ns);


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