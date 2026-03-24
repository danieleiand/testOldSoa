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
{"getNSValue('store1')": {
  "id": getNSValue('store1'),
  "name": getNSValue('store1'),
  "xtype": "servicestore",
  "listeners": {},
  "entityType": "",
  "root": "",
  "url": null,
  "saveUrl": null,
  "addUrl": null,
  "updateUrl": null,
  "deleteUrl": null,
  "fields": [
    {
      "id": getNSValue('store1id'),
      "xtype": "datafield",
      "listeners": {},
      "name": "id",
      "type": "int",
      "mapping": "id",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "列号",
      "canbenull": true
    },
    {
      "id": getNSValue('store1width'),
      "xtype": "datafield",
      "listeners": {},
      "name": "width",
      "type": "int",
      "mapping": "width",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "列宽(%)",
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
  "width": 400,
  "height": 350,
  "title": "风格设置",
  "footer": true,
  "modal": true,
  "iconCls": "widget-skin",
  "html": "<iframe width='100%' height='100%' frameborder='0'  src='selectSkin.jsp' ALLOWTRANSPARENCY=true><\/iframe>"
}
	);
	var store1;
		store1 = EOS.getDataSource('store1', _ns);

	var window1;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		window1 = EOS.getCmp('window1', _ns);


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