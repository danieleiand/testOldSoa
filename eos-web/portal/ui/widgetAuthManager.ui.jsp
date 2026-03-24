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
  "getNSValue('role')": {
    "id": getNSValue('role'),
    "name": getNSValue('role'),
    "xtype": "servicestore",
    "listeners": {},
    "entityType": "com.primeton.widget.auth.role.Role",
    "root": "dataList",
    "dataProvider": "JavaBean",
    "url": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.getAllRoles().java",
    "saveUrl": null,
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "fields": [
      {
        "id": getNSValue('roleroleId'),
        "xtype": "datafield",
        "listeners": {},
        "name": "roleId",
        "type": "string",
        "mapping": "roleId",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "roleId",
        "canbenull": true
      },
      {
        "id": getNSValue('roleroleName'),
        "xtype": "datafield",
        "listeners": {},
        "name": "roleName",
        "type": "string",
        "mapping": "roleName",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "roleName",
        "canbenull": true
      }
    ]
  },
  "getNSValue('unAccessableWidget')": {
    "id": getNSValue('unAccessableWidget'),
    "name": getNSValue('unAccessableWidget'),
    "xtype": "servicestore",
    "listeners": {"beforeload": function beforeload( thisObj , options ){
	options.params = options.params||{};
	options.params.roleId=roleGrid.getSelectionModel().getSelected().get("roleId");
} },
    "entityType": "com.primeton.portal.purview.entity.Widget",
    "root": "dataList",
    "dataProvider": "JavaBean",
    "url": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.getUnaccessableWidgetByRole(java.lang.String roleId).java",
    "saveUrl": null,
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "fields": [
      {
        "id": getNSValue('unAccessableWidgetid'),
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
        "id": getNSValue('unAccessableWidgetwidgetName'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetName",
        "type": "string",
        "mapping": "widgetName",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "widgetName",
        "canbenull": true
      },
      {
        "id": getNSValue('unAccessableWidgetcatalog'),
        "xtype": "datafield",
        "listeners": {},
        "name": "catalog",
        "type": "int",
        "mapping": "catalog",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "catalog",
        "canbenull": true
      },
      {
        "id": getNSValue('unAccessableWidgetwidgetType'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetType",
        "type": "int",
        "mapping": "widgetType",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "widgetType",
        "canbenull": true
      },
      {
        "id": getNSValue('unAccessableWidgetapplication'),
        "xtype": "datafield",
        "listeners": {},
        "name": "application",
        "type": "Object",
        "mapping": "application",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "application",
        "canbenull": true
      }
    ]
  },
  "getNSValue('accessableWidget')": {
    "id": getNSValue('accessableWidget'),
    "name": getNSValue('accessableWidget'),
    "xtype": "servicestore",
    "listeners": {
      "beforeload": function beforeload( thisObj , options ){
options.params = options.params||{};
options.params.roleId=roleGrid.getSelectionModel().getSelected().get("roleId");

} ,
      "beforeSave": function beforeSave( config , params ){
params.roleId=roleGrid.getSelectionModel().getSelected().get("roleId");
        	var ins =[];
        	for(var i=0;i<params.insertedRecords.length;i++){
        		var record= params.insertedRecords[i];
       			for(var j=0;j<params.deletedRecords.length;j++){
        			var n = params.deletedRecords[j];
        			if(n.id==record.id){
        				params.deletedRecords.splice(j,1);
        				record=null; 
        				break;
        			}
        		}
        		if(record!=null)
        			ins[ins.length]=record; 
        	}
			params.insertedRecords=ins;

} ,
      "onSaveSuccess": function onSaveSuccess( response ){
Ext.Msg.alert("提示信息", "授权信息保存成功！"); 
unAccessableWidget.reload();
} 
    },
    "entityType": "com.primeton.portal.purview.entity.Widget",
    "root": "dataList",
    "dataProvider": "JavaBean",
    "url": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.getAccessableWidgetByRole(java.lang.String roleId).java",
    "saveUrl": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.saveWidgetRole(com.primeton.portal.purview.entity.Widget[] insertedRecords, com.primeton.portal.purview.entity.Widget[] deletedRecords, java.lang.String roleId).java",
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "fields": [
      {
        "id": getNSValue('accessableWidgetid'),
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
        "id": getNSValue('accessableWidgetwidgetName'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetName",
        "type": "string",
        "mapping": "widgetName",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "widgetName",
        "canbenull": true
      },
      {
        "id": getNSValue('accessableWidgetcatalog'),
        "xtype": "datafield",
        "listeners": {},
        "name": "catalog",
        "type": "int",
        "mapping": "catalog",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "catalog",
        "canbenull": true
      },
      {
        "id": getNSValue('accessableWidgetapplication.appName'),
        "xtype": "datafield",
        "listeners": {},
        "name": "application.appName",
        "type": "string",
        "mapping": "application.appName",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "appName",
        "canbenull": true
      }
    ]
  },
  "getNSValue('allWidget')": {
    "id": getNSValue('allWidget'),
    "name": getNSValue('allWidget'),
    "xtype": "servicestore",
    "listeners": {"beforeSave": function beforeSave( config , params ){

        	var ins =[];
        	for(var i=0;i<params.updatedRecords.length;i++){
        		var status= params.updatedRecords[i].status.trim();
				if(status==""){
					Ext.Msg.alert("提示信息","widget状态不可为空");
					return false;
				}	
        	}


} },
    "entityType": "com.primeton.portal.purview.entity.Widget",
    "root": "dataList",
    "dataProvider": "JavaBean",
    "url": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.getAllWidgets().java",
    "saveUrl": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.saveWidgetStatus(com.primeton.portal.purview.entity.Widget[] updatedRecords).java",
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "fields": [
      {
        "id": getNSValue('allWidgetid'),
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
        "id": getNSValue('allWidgetwidgetName'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetName",
        "type": "string",
        "mapping": "widgetName",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "widgetName",
        "canbenull": true
      },
      {
        "id": getNSValue('allWidgetcatalog'),
        "xtype": "datafield",
        "listeners": {},
        "name": "catalog",
        "type": "int",
        "mapping": "catalog",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "catalog",
        "canbenull": true
      },
      {
        "id": getNSValue('allWidgetwidgetType'),
        "xtype": "datafield",
        "listeners": {},
        "name": "widgetType",
        "type": "int",
        "mapping": "widgetType",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "widgetType",
        "canbenull": true
      },
      {
        "id": getNSValue('allWidgetpath'),
        "xtype": "datafield",
        "listeners": {},
        "name": "path",
        "type": "string",
        "mapping": "path",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "path",
        "canbenull": true
      },
      {
        "id": getNSValue('allWidgetwidgetId'),
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
        "id": getNSValue('allWidgetstatus'),
        "xtype": "datafield",
        "listeners": {},
        "name": "status",
        "type": "int",
        "mapping": "status",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "status",
        "canbenull": true
      },
      {
        "id": getNSValue('allWidgetapplication'),
        "xtype": "datafield",
        "listeners": {},
        "name": "application",
        "type": "Object",
        "mapping": "application",
        "sortType": "",
        "sortDir": "",
        "dateFormat": "",
        "defaultValue": "",
        "displayName": "application",
        "canbenull": true
      },
      {
        "id": getNSValue('allWidgetversion'),
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
    "layout": "anchor",
    "footer": true,
    "title": "widget发布授权管理",
    "height": "",
    "buttonAlign": "center",
    "anchor": "100% 100%",
    "items": [{
      "id": getNSValue('tabpanel1'),
      "xtype": "tabpanel",
      "listeners": {},
      "border": false,
      "frame": false,
      "activeTab": 0,
      "height": "",
      "title": "widget授权管理",
      "footer": false,
      "buttonAlign": "center",
      "anchor": "100% 100%",
      "bodyBorder": false,
      "items": [
        {
          "id": getNSValue('panel2'),
          "xtype": "panel",
          "listeners": {},
          "border": false,
          "frame": false,
          "layout": "anchor",
          "footer": true,
          "title": "受控widget管理",
          "buttonAlign": "center",
          "iconCls": "widget-lock",
          "bodyBorder": false,
          "anchor": "100% 100%",
          "items": [{
            "id": getNSValue('panel4'),
            "xtype": "panel",
            "listeners": {},
            "border": false,
            "frame": false,
            "anchor": "100% 100%",
            "layout": "border",
            "footer": true,
            "buttonAlign": "center",
            "bodyBorder": false,
            "items": [
              {
                "id": getNSValue('left_panel'),
                "xtype": "panel",
                "listeners": {"beforeCreate": function beforeCreate( config ){
config.collapseMode="mini";
config.split = true;
} },
                "border": false,
                "frame": false,
                "layout": "anchor",
                "region": "west",
                "width": 238,
                "footer": true,
                "buttonAlign": "center",
                "title": "",
                "bodyBorder": false,
                "items": [{
                  "id": getNSValue('roleGrid'),
                  "xtype": "commongrid",
                  "listeners": {},
                  "anchor": "100% 100%",
                  "store": getNSValue('role'),
                  "title": "角色列表",
                  "selModel": {
                    "id": getNSValue('rowSelectionModel1'),
                    "xtype": "rowSelectionModel",
                    "listeners": {"rowselect": function rowselect( thisObj , rowIndex , r ){
accessableWidget.load();
unAccessableWidget.load();
} }
                  },
                  "footer": true,
                  "buttonAlign": "center",
                  "autoLoadData": true,
                  "width": 231,
                  "border": true,
                  "autoExpandColumn": "commongrid1_roleName",
                  "iconCls": "widget-role",
                  "icon": "/images/control.png",
                  "columns": [
                    {
                      "id": getNSValue('commongrid1_roleId'),
                      "xtype": "column",
                      "listeners": {},
                      "width": 100,
                      "header": "角色编号",
                      "sortable": true,
                      "align": "left",
                      "dataIndex": "roleId",
                      "hidden": false
                    },
                    {
                      "id": getNSValue('commongrid1_roleName'),
                      "xtype": "column",
                      "listeners": {},
                      "width": 100,
                      "header": "角色名称",
                      "sortable": true,
                      "align": "left",
                      "dataIndex": "roleName",
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
                "layout": "border",
                "region": "center",
                "footer": true,
                "width": 632,
                "title": "",
                "buttonAlign": "center",
                "bodyBorder": false,
                "items": [
                  {
                    "id": getNSValue('panel3'),
                    "xtype": "panel",
                    "listeners": {},
                    "border": false,
                    "frame": false,
                    "layout": "border",
                    "footer": false,
                    "title": "",
                    "height": "100%",
                    "region": "west",
                    "width": "53%",
                    "buttonAlign": "center",
                    "bodyBorder": false,
                    "anchor": "",
                    "items": [
                      {
                        "id": getNSValue('accessablegrid'),
                        "xtype": "commongrid",
                        "listeners": {},
                        "region": "center",
                        "width": "",
                        "anchor": "-36 100%",
                        "store": getNSValue('accessableWidget'),
                        "title": "可访问widget列表",
                        "selModel": {
                          "id": getNSValue('checkboxSelectionModel1'),
                          "xtype": "checkboxSelectionModel",
                          "listeners": {}
                        },
                        "footer": false,
                        "buttonAlign": "center",
                        "iconCls": "widget-access",
                        "border": true,
                        "autoExpandColumn": "commongrid3_application_appName",
                        "frame": false,
                        "columns": [
                          {
                            "id": getNSValue('commongrid3_widgetName'),
                            "xtype": "column",
                            "listeners": {},
                            "width": 95,
                            "header": "widget名称",
                            "sortable": true,
                            "align": "left",
                            "dataIndex": "widgetName",
                            "hidden": false
                          },
                          {
                            "id": getNSValue('commongrid3_application_appName'),
                            "xtype": "column",
                            "listeners": {},
                            "width": 113,
                            "header": "所属应用",
                            "sortable": true,
                            "align": "left",
                            "dataIndex": "application.appName",
                            "hidden": false
                          }
                        ]
                      },
                      {
                        "id": getNSValue('panel5'),
                        "xtype": "panel",
                        "listeners": {},
                        "border": true,
                        "frame": true,
                        "layout": "anchor",
                        "footer": false,
                        "title": "",
                        "height": 200,
                        "region": "east",
                        "width": 36,
                        "buttonAlign": "center",
                        "bodyBorder": false,
                        "anchor": "36 100%",
                        "items": [
                          {
                            "id": getNSValue('button2'),
                            "xtype": "button",
                            "listeners": {"click": function click( thisObj , e ){
	
	accessablegrid.getSelectionModel().selectAll();
	var records=accessablegrid.getSelectionModel().getSelections();
	
	for(var i=0;i<records.length;i++)
	{
	var record=records[i];
	var newRecord=unAccessableWidget.createDefaultRecord();
	newRecord.set("id",record.get("id"));
	newRecord.set("widgetName",record.get("widgetName"));
	newRecord.set("catalog",record.get("catalog"));
	newRecord.set("application.appName",record.get("application.appName"));
	unaccessgrid.addRecord(newRecord);
	accessablegrid.getStore().remove(record);
	}
} },
                            "text": "",
                            "region": "west",
                            "width": 100,
                            "style": "margin-top:80px",
                            "icon": window.WEB_ROOT+"/portal/images/rightAll.gif",
                            "iconCls": "rightAll"
                          },
                          {
                            "id": getNSValue('button3'),
                            "xtype": "button",
                            "listeners": {"click": function click( thisObj , e ){
	var records=accessablegrid.getSelectionModel().getSelections();
	
	for(var i=0;i<records.length;i++)
	{
	var record=records[i];
	var newRecord=unAccessableWidget.createDefaultRecord();
	newRecord.set("id",record.get("id"));
	newRecord.set("widgetName",record.get("widgetName"));
	newRecord.set("catalog",record.get("catalog"));
	newRecord.set("application.appName",record.get("application.appName"));
	unaccessgrid.addRecord(newRecord);
	accessablegrid.getStore().remove(record);
	}
} },
                            "text": "",
                            "region": "west",
                            "width": 100,
                            "style": "margin-top:10px",
                            "icon": window.WEB_ROOT+"/portal/images/right.gif",
                            "iconCls": "right"
                          },
                          {
                            "id": getNSValue('button4'),
                            "xtype": "button",
                            "listeners": {"click": function click( thisObj , e ){
var records=unaccessgrid.getSelectionModel().getSelections();

for(var i=0;i<records.length;i++)
{
var record=records[i];
var newRecord=accessableWidget.createDefaultRecord();
newRecord.set("id",record.get("id"));
newRecord.set("widgetName",record.get("widgetName"));


newRecord.set("catalog",record.get("catalog"));
newRecord.set("application.appName",record.get("application.appName"));

accessablegrid.addRecord(newRecord);
unaccessgrid.getStore().remove(record);
}

} },
                            "text": "",
                            "region": "west",
                            "width": 100,
                            "style": "margin-top:10px",
                            "icon": window.WEB_ROOT+"/portal/images/left.gif",
                            "iconCls": "left"
                          },
                          {
                            "id": getNSValue('button5'),
                            "xtype": "button",
                            "listeners": {"click": function click( thisObj , e ){
unaccessgrid.getSelectionModel().selectAll();
var records=unaccessgrid.getSelectionModel().getSelections();

for(var i=0;i<records.length;i++)
{
var record=records[i];
var newRecord=accessableWidget.createDefaultRecord();
newRecord.set("id",record.get("id"));
newRecord.set("widgetName",record.get("widgetName"));


newRecord.set("catalog",record.get("catalog"));
newRecord.set("application.appName",record.get("application.appName"));

accessablegrid.addRecord(newRecord);
unaccessgrid.getStore().remove(record);
}

} },
                            "text": "",
                            "region": "west",
                            "width": 100,
                            "style": "margin-top:10px",
                            "icon": window.WEB_ROOT+"/portal/images/leftAll.gif",
                            "iconCls": "leftAll"
                          },
                          {
                            "id": getNSValue('reload'),
                            "xtype": "button",
                            "listeners": {"click": function click( thisObj , e ){
accessableWidget.reload();
unAccessableWidget.reload();
} },
                            "text": "",
                            "region": "west",
                            "width": 100,
                            "style": "margin-top:20px",
                            "icon": window.WEB_ROOT+"/portal/images/refresh.gif",
                            "iconCls": "refresh",
                            "tooltip": "刷新"
                          },
                          {
                            "id": getNSValue('saveRole'),
                            "xtype": "button",
                            "listeners": {"click": function click( thisObj , e ){
if(accessableWidget.inserted!=""||accessableWidget.deleted!="")
accessableWidget.save();
else
	unAccessableWidget.reload();

} },
                            "text": "",
                            "region": "west",
                            "width": 100,
                            "style": "margin-top:10px",
                            "icon": window.WEB_ROOT+"/portal/images/save.gif",
                            "iconCls": "save",
                            "tooltip": "保存"
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "id": getNSValue('unaccessgrid'),
                    "xtype": "commongrid",
                    "listeners": {},
                    "region": "center",
                    "width": "47%",
                    "anchor": "",
                    "store": getNSValue('unAccessableWidget'),
                    "title": "不可访问widget列表",
                    "selModel": {
                      "id": getNSValue('checkboxSelectionModel3'),
                      "xtype": "checkboxSelectionModel",
                      "listeners": {}
                    },
                    "footer": false,
                    "buttonAlign": "center",
                    "iconCls": "widget-unaccess",
                    "border": true,
                    "autoExpandColumn": "commongrid1_application",
                    "height": "100%",
                    "frame": false,
                    "columns": [
                      {
                        "id": getNSValue('commongrid1_widgetName'),
                        "xtype": "column",
                        "listeners": {},
                        "width": 95,
                        "header": "widget名称",
                        "sortable": true,
                        "align": "left",
                        "dataIndex": "widgetName",
                        "hidden": false
                      },
                      {
                        "id": getNSValue('commongrid1_application'),
                        "xtype": "column",
                        "listeners": {},
                        "width": 102,
                        "header": "所属应用",
                        "sortable": true,
                        "align": "left",
                        "dataIndex": "application.appName",
                        "hidden": false
                      }
                    ]
                  }
                ]
              }
            ]
          }]
        },
        {
          "id": getNSValue('commongrid2'),
          "xtype": "commongrid",
          "listeners": {},
          "anchor": "100% 100%",
          "store": getNSValue('allWidget'),
          "title": "共享widget管理",
          "selModel": {
            "id": getNSValue('checkboxSelectionModel2'),
            "xtype": "rowSelectionModel",
            "listeners": {}
          },
          "footer": true,
          "buttonAlign": "center",
          "iconCls": "widget-shared",
          "autoLoadData": true,
          "bbar": {
            "id": getNSValue('toolbar2'),
            "xtype": "toolbar",
            "listeners": {},
            "height": 30,
            "items": [
              {
                "id": getNSValue('button6'),
                "xtype": "button",
                "listeners": {"click": function click( thisObj , e ){
allWidget.save();
} },
                "text": "保存",
                "region": "north",
                "width": 100,
                "icon": window.WEB_ROOT+"/portal/images/save.gif",
                "iconCls": "save",
                "disabled": false
              },
              {
                "id": getNSValue('tbitem1'),
                "xtype": "tbseparator",
                "listeners": {}
              },
              {
                "id": getNSValue('button1'),
                "xtype": "button",
                "listeners": {"click": function click( thisObj , e ){
allWidget.reload();
} },
                "text": "刷新",
                "icon": window.WEB_ROOT+"/portal/images/refresh.gif",
                "iconCls": "refresh"
              }
            ]
          },
          "columns": [
            {
              "id": getNSValue('commongrid2_status'),
              "xtype": "column",
              "listeners": {},
              "width": 100,
              "header": "状态",
              "sortable": true,
              "align": "left",
              "dataIndex": "status",
              "hidden": false,
              "editor": {
                "id": getNSValue('numberfield3'),
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
                "dataList": "1:共享;0:受控",
                "allowBlank": false,
                "editable": false
              }
            },
            {
              "id": getNSValue('commongrid2_widgetName'),
              "xtype": "column",
              "listeners": {},
              "width": 199,
              "header": "widget名称",
              "sortable": true,
              "align": "left",
              "dataIndex": "widgetName",
              "hidden": false
            },
            {
              "id": getNSValue('commongrid2_application'),
              "xtype": "column",
              "listeners": {},
              "width": 161,
              "header": "所属应用",
              "sortable": true,
              "align": "left",
              "dataIndex": "application.appName",
              "hidden": false
            }
          ]
        }
      ]
    }]
  }]
}
	);
	var role, unAccessableWidget, accessableWidget, allWidget;
		role = EOS.getDataSource('role', _ns);
		unAccessableWidget = EOS.getDataSource('unAccessableWidget', _ns);
		accessableWidget = EOS.getDataSource('accessableWidget', _ns);
		allWidget = EOS.getDataSource('allWidget', _ns);

	var mainpage, panel1, tabpanel1, panel2, commongrid2, panel4, commongrid2_status, commongrid2_widgetName, commongrid2_application, checkboxSelectionModel2, toolbar2, left_panel, main_panel, numberfield3, button6, tbitem1, button1, roleGrid, panel3, unaccessgrid, commongrid1_roleId, commongrid1_roleName, rowSelectionModel1, accessablegrid, panel5, commongrid1_widgetName, commongrid1_application, checkboxSelectionModel3, commongrid3_widgetName, commongrid3_application_appName, checkboxSelectionModel1, button2, button3, button4, button5, reload, saveRole;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		mainpage = EOS.getCmp('mainpage', _ns);
		panel1 = EOS.getCmp('panel1', _ns);
		tabpanel1 = EOS.getCmp('tabpanel1', _ns);
		panel2 = EOS.getCmp('panel2', _ns);
		commongrid2 = EOS.getCmp('commongrid2', _ns);
		panel4 = EOS.getCmp('panel4', _ns);
		commongrid2_status = EOS.getCmp('commongrid2_status', _ns);
		commongrid2_widgetName = EOS.getCmp('commongrid2_widgetName', _ns);
		commongrid2_application = EOS.getCmp('commongrid2_application', _ns);
		checkboxSelectionModel2 = EOS.getCmp('checkboxSelectionModel2', _ns);
		toolbar2 = EOS.getCmp('toolbar2', _ns);
		left_panel = EOS.getCmp('left_panel', _ns);
		main_panel = EOS.getCmp('main_panel', _ns);
		numberfield3 = EOS.getCmp('numberfield3', _ns);
		button6 = EOS.getCmp('button6', _ns);
		tbitem1 = EOS.getCmp('tbitem1', _ns);
		button1 = EOS.getCmp('button1', _ns);
		roleGrid = EOS.getCmp('roleGrid', _ns);
		panel3 = EOS.getCmp('panel3', _ns);
		unaccessgrid = EOS.getCmp('unaccessgrid', _ns);
		commongrid1_roleId = EOS.getCmp('commongrid1_roleId', _ns);
		commongrid1_roleName = EOS.getCmp('commongrid1_roleName', _ns);
		rowSelectionModel1 = EOS.getCmp('rowSelectionModel1', _ns);
		accessablegrid = EOS.getCmp('accessablegrid', _ns);
		panel5 = EOS.getCmp('panel5', _ns);
		commongrid1_widgetName = EOS.getCmp('commongrid1_widgetName', _ns);
		commongrid1_application = EOS.getCmp('commongrid1_application', _ns);
		checkboxSelectionModel3 = EOS.getCmp('checkboxSelectionModel3', _ns);
		commongrid3_widgetName = EOS.getCmp('commongrid3_widgetName', _ns);
		commongrid3_application_appName = EOS.getCmp('commongrid3_application_appName', _ns);
		checkboxSelectionModel1 = EOS.getCmp('checkboxSelectionModel1', _ns);
		button2 = EOS.getCmp('button2', _ns);
		button3 = EOS.getCmp('button3', _ns);
		button4 = EOS.getCmp('button4', _ns);
		button5 = EOS.getCmp('button5', _ns);
		reload = EOS.getCmp('reload', _ns);
		saveRole = EOS.getCmp('saveRole', _ns);


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