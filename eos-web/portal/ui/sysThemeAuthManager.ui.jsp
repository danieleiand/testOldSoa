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
		 var portalTab= Ext.getCmp("portalTab");
			
		 status.setValue(portalTab.getActiveTab().status);
} }}
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
    "listeners": {
      "beforeload": function beforeload( thisObj , options ){
options.params = options.params || {}
var portalTab= Ext.getCmp("portalTab");
options.params.tabId=portalTab.getActiveTab().id;

} ,
      "beforeSave": function beforeSave( config , params ){
params.status=status.getValue();
			var portalTab= Ext.getCmp("portalTab");
			params.tabId=portalTab.getActiveTab().id;
        	var ins =[];
        	for(var i=0;i<params.insert.length;i++){
        		var record= params.insert[i];
       			for(var j=0;j<params.deletedRecords.length;j++){        		
        		var n = params.deletedRecords[j];
        			if(n.roleId==record.roleId){
        				params.deletedRecords.splice(j,1);
        				record=null;
        				break;
        			}
        		} 
        		if(record!=null)
        			ins[ins.length]=record;
        	}
			params.insert=ins;  

} ,
      "onSaveSuccess": function onSaveSuccess( response ){
		var portalTab= Ext.getCmp("portalTab");
		portalTab.getActiveTab().status=status.getValue();
        window1.close();
} 
    },
    "entityType": "com.primeton.widget.auth.role.Role",
    "root": "dataList",
    "dataProvider": "JavaBean",
    "url": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.getAccessableRoleBySysThemeId(java.lang.String tabId).java",
    "saveUrl": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.saveSysThemeStatus(java.lang.String tabId, com.primeton.widget.auth.role.Role[] insert, com.primeton.widget.auth.role.Role[] deletedRecords, java.lang.String status).java",
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "autoLoad": true,
    "insertedProperty": "insert",
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
  "getNSValue('role2')": {
    "id": getNSValue('role2'),
    "name": getNSValue('role2'),
    "xtype": "servicestore",
    "listeners": {"beforeload": function beforeload( thisObj , options ){
options.params = options.params || {}
 var portalTab= Ext.getCmp("portalTab");
options.params.tabId=portalTab.getActiveTab().id;
} },
    "entityType": "com.primeton.widget.auth.role.Role",
    "root": "dataList",
    "dataProvider": "JavaBean",
    "url": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.getUnaccessableRoleBySysThemeId(java.lang.String tabId).java",
    "saveUrl": null,
    "addUrl": null,
    "updateUrl": null,
    "deleteUrl": null,
    "autoLoad": true,
    "fields": [
      {
        "id": getNSValue('role2roleId'),
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
        "id": getNSValue('role2roleName'),
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
  }
}
	);
	UIManager.registerHiddenWidgets(
{
  "listeners": {"afterRender": function afterRender(  ){
		 var portalTab= Ext.getCmp("portalTab");
			
		 status.setValue(portalTab.getActiveTab().status);
} },
  "hiddenWidgets": []
}
	);
	UIManager.register(
{
  "id": getNSValue('window1'),
  "xtype": "window",
  "listeners": {},
  "layout": "anchor",
  "width": 520,
  "height": 300,
  "title": "系统主题权限设置",
  "footer": true,
  "modal": true,
  "items": [
    {
      "id": getNSValue('form1'),
      "xtype": "form",
      "listeners": {},
      "columns": 2,
      "footer": false,
      "buttonAlign": "center",
      "height": 42,
      "region": "south",
      "width": "100%",
      "ds": getNSValue(''),
      "frame": false,
      "title": "",
      "items": [{
        "id": getNSValue('status'),
        "xtype": "radiogroup",
        "listeners": {"change": function change( thisObj , newValue , oldValue ){
try{
if(newValue.getValue()==1)
{
button3.setDisabled(true);
button4.setDisabled(true);
button5.setDisabled(true);
button6.setDisabled(true);
}
else
{
button3.enable();
button4.enable();
button5.enable();
button6.enable();
}
}
catch(e)
{}

} },
        "width": 135,
        "fieldLabel": "状态",
        "colspan": 1,
        "name": "column0",
        "hidden": false,
        "hideLabel": false,
        "items": [
          {
            "id": getNSValue('radio1'),
            "xtype": "radio",
            "listeners": {"check": function check( thisObj , checked ){


} },
            "boxLabel": "共享",
            "checked": true,
            "name": "radiogroup",
            "checkValue": "1"
          },
          {
            "id": getNSValue('radio2'),
            "xtype": "radio",
            "listeners": {},
            "boxLabel": "受控",
            "name": "radiogroup",
            "checkValue": "0"
          }
        ]
      }]
    },
    {
      "id": getNSValue('panel1'),
      "xtype": "panel",
      "listeners": {},
      "border": true,
      "frame": false,
      "layout": "anchor",
      "footer": false,
      "title": "",
      "height": "",
      "buttonAlign": "center",
      "anchor": "100% -42",
      "buttons": [
        {
          "id": getNSValue('button1'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){
role.save();

} },
          "text": "保存"
        },
        {
          "id": getNSValue('button2'),
          "xtype": "button",
          "listeners": {"click": function click( thisObj , e ){
window1.close()
} },
          "text": "关闭"
        }
      ],
      "items": [{
        "id": getNSValue('main_panel'),
        "xtype": "panel",
        "listeners": {},
        "border": false,
        "frame": false,
        "layout": "border",
        "region": "center",
        "footer": false,
        "width": "",
        "title": "",
        "buttonAlign": "center",
        "bodyBorder": false,
        "height": "",
        "anchor": "100% 100%",
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
                "width": -37,
                "anchor": "",
                "store": getNSValue('role'),
                "title": "可访问角色列表",
                "selModel": {
                  "id": getNSValue('checkboxSelectionModel1'),
                  "xtype": "checkboxSelectionModel",
                  "listeners": {}
                },
                "footer": true,
                "buttonAlign": "center",
                "iconCls": "widget-access",
                "border": false,
                "height": "100%",
                "autoLoadData": false,
                "autoExpandColumn": "",
                "columns": [
                  {
                    "id": getNSValue('accessablegrid_roleId'),
                    "xtype": "column",
                    "listeners": {},
                    "width": 75,
                    "header": "角色编号",
                    "sortable": true,
                    "align": "left",
                    "dataIndex": "roleId",
                    "editor": {
                      "id": getNSValue('textfield1'),
                      "xtype": "textfield",
                      "listeners": {},
                      "fieldLabel": "",
                      "hideLabel": false,
                      "width": 135,
                      "name": "roleId"
                    },
                    "hidden": false
                  },
                  {
                    "id": getNSValue('accessablegrid_roleName'),
                    "xtype": "column",
                    "listeners": {},
                    "width": 100,
                    "header": "角色名称",
                    "sortable": true,
                    "align": "left",
                    "dataIndex": "roleName",
                    "editor": {
                      "id": getNSValue('textfield2'),
                      "xtype": "textfield",
                      "listeners": {},
                      "fieldLabel": "",
                      "hideLabel": false,
                      "width": 135,
                      "name": "roleName"
                    },
                    "hidden": false
                  }
                ]
              },
              {
                "id": getNSValue('panel5'),
                "xtype": "panel",
                "listeners": {},
                "border": false,
                "frame": true,
                "layout": "anchor",
                "footer": false,
                "title": "",
                "height": "100%",
                "region": "east",
                "width": 37,
                "buttonAlign": "center",
                "bodyBorder": false,
                "items": [
                  {
                    "id": getNSValue('button3'),
                    "xtype": "button",
                    "listeners": {"click": function click( thisObj , e ){
	
	accessablegrid.getSelectionModel().selectAll();
	var records=accessablegrid.getSelectionModel().getSelections();
	
	for(var i=0;i<records.length;i++)
	{
	var record=records[i];
	var newRecord=role2.createDefaultRecord();
	newRecord.set("roleId",record.get("roleId"));
	newRecord.set("roleName",record.get("roleName"));
	unaccessgrid.addRecord(newRecord);
	accessablegrid.getStore().remove(record);
	}
} },
                    "text": "",
                    "region": "west",
                    "width": 100,
                    "style": "margin-top:50px",
                    "icon": window.WEB_ROOT+"/portal/images/rightAll.gif",
                    "iconCls": "rightAll"
                  },
                  {
                    "id": getNSValue('button4'),
                    "xtype": "button",
                    "listeners": {"click": function click( thisObj , e ){
	var records=accessablegrid.getSelectionModel().getSelections();
	
	for(var i=0;i<records.length;i++)
	{
	var record=records[i];
	var newRecord=role2.createDefaultRecord();
	newRecord.set("roleId",record.get("roleId"));
	newRecord.set("roleName",record.get("roleName"));
	unaccessgrid.addRecord(newRecord);
	role.remove(record);
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
                    "id": getNSValue('button5'),
                    "xtype": "button",
                    "listeners": {"click": function click( thisObj , e ){
var records=unaccessgrid.getSelectionModel().getSelections();

for(var i=0;i<records.length;i++)
{
var record=records[i];
var newRecord=role.createDefaultRecord();
newRecord.set("roleId",record.get("roleId"));
newRecord.set("roleName",record.get("roleName"));



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
                    "id": getNSValue('button6'),
                    "xtype": "button",
                    "listeners": {"click": function click( thisObj , e ){
unaccessgrid.getSelectionModel().selectAll();
var records=unaccessgrid.getSelectionModel().getSelections();

for(var i=0;i<records.length;i++)
{
var record=records[i];
var newRecord=role.createDefaultRecord();
newRecord.set("roleId",record.get("roleId"));
newRecord.set("roleName",record.get("roleName"));



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
            "store": getNSValue('role2'),
            "title": "不可访问角色列表",
            "selModel": {
              "id": getNSValue('checkboxSelectionModel3'),
              "xtype": "checkboxSelectionModel",
              "listeners": {}
            },
            "footer": true,
            "buttonAlign": "center",
            "iconCls": "widget-unaccess",
            "border": false,
            "height": "100%",
            "autoExpandColumn": "",
            "columns": [
              {
                "id": getNSValue('unaccessgrid_roleId'),
                "xtype": "column",
                "listeners": {},
                "width": 75,
                "header": "角色编号",
                "sortable": true,
                "align": "left",
                "dataIndex": "roleId",
                "editor": {
                  "id": getNSValue('textfield5'),
                  "xtype": "textfield",
                  "listeners": {},
                  "fieldLabel": "",
                  "hideLabel": false,
                  "width": 135,
                  "name": "roleId"
                },
                "hidden": false
              },
              {
                "id": getNSValue('unaccessgrid_roleName'),
                "xtype": "column",
                "listeners": {},
                "width": 100,
                "header": "角色名称",
                "sortable": true,
                "align": "left",
                "dataIndex": "roleName",
                "editor": {
                  "id": getNSValue('textfield6'),
                  "xtype": "textfield",
                  "listeners": {},
                  "fieldLabel": "",
                  "hideLabel": false,
                  "width": 135,
                  "name": "roleName"
                },
                "hidden": false
              }
            ]
          }
        ]
      }]
    }
  ]
}
	);
	var role, role2;
		role = EOS.getDataSource('role', _ns);
		role2 = EOS.getDataSource('role2', _ns);

	var window1, form1, panel1, status, button1, button2, main_panel, radio1, radio2, panel3, unaccessgrid, accessablegrid, panel5, unaccessgrid_roleId, unaccessgrid_roleName, checkboxSelectionModel3, accessablegrid_roleId, accessablegrid_roleName, checkboxSelectionModel1, button3, button4, button5, button6, textfield5, textfield6, textfield1, textfield2;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		window1 = EOS.getCmp('window1', _ns);
		form1 = EOS.getCmp('form1', _ns);
		panel1 = EOS.getCmp('panel1', _ns);
		status = EOS.getCmp('status', _ns);
		button1 = EOS.getCmp('button1', _ns);
		button2 = EOS.getCmp('button2', _ns);
		main_panel = EOS.getCmp('main_panel', _ns);
		radio1 = EOS.getCmp('radio1', _ns);
		radio2 = EOS.getCmp('radio2', _ns);
		panel3 = EOS.getCmp('panel3', _ns);
		unaccessgrid = EOS.getCmp('unaccessgrid', _ns);
		accessablegrid = EOS.getCmp('accessablegrid', _ns);
		panel5 = EOS.getCmp('panel5', _ns);
		unaccessgrid_roleId = EOS.getCmp('unaccessgrid_roleId', _ns);
		unaccessgrid_roleName = EOS.getCmp('unaccessgrid_roleName', _ns);
		checkboxSelectionModel3 = EOS.getCmp('checkboxSelectionModel3', _ns);
		accessablegrid_roleId = EOS.getCmp('accessablegrid_roleId', _ns);
		accessablegrid_roleName = EOS.getCmp('accessablegrid_roleName', _ns);
		checkboxSelectionModel1 = EOS.getCmp('checkboxSelectionModel1', _ns);
		button3 = EOS.getCmp('button3', _ns);
		button4 = EOS.getCmp('button4', _ns);
		button5 = EOS.getCmp('button5', _ns);
		button6 = EOS.getCmp('button6', _ns);
		textfield5 = EOS.getCmp('textfield5', _ns);
		textfield6 = EOS.getCmp('textfield6', _ns);
		textfield1 = EOS.getCmp('textfield1', _ns);
		textfield2 = EOS.getCmp('textfield2', _ns);


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