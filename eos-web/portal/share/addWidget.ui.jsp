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
/*var testData = [
		{'name': '我要处理的Bug', 'catalog': 'Bug系统'},
		{'name': 'Bug查询', 'catalog': 'Bug系统'},
		{'name': '提交新Bug', 'catalog': 'Bug系统'},
		{'name': '我的任务列表', 'catalog': '公共'},
		{'name': '天气预报', 'catalog': '公共'},
		{'name': 'Google地图', 'catalog': '公共'}
];
store1.loadData(testData);
*/


} }}
	);
	if (!__temp_isSubUI) { document.title=""  }
  UIManager.UI.arguments= _params; 
  UIManager.setParentWidget(_parent); 
	UIManager.initDataContext(
{"getNSValue('store1')": {
  "id": getNSValue('store1'),
  "name": getNSValue('store1'),
  "xtype": "servicestore",
  "listeners": {
    "onLoadSuccess": function onLoadSuccess( records , options ){
var viewPort = Ext.getCmp("portalTab").getActiveTab();
		var theme=viewPort.getId();
	var submitStr = "";
	var cols = viewPort.items.length;
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

for(var i=0;i<records.length;i++)

{
var record=records[i];
if(submitStr.indexOf(record.get("id"))!=-1)
{
records.remove(record);
i--;
}

}
} ,
    "beforeload": function beforeload( thisObj , options ){
	if(Ext.getCmp("portalTab").getActiveTab().isSys===undefined)
	    {
	    return false;
		} 
} 
  },
  "entityType": "com.primeton.portal.purview.entity.Widget",
  "root": "dataList",
  "url": window.WEB_ROOT+"/com.primeton.widget.auth.AuthManager.getAccessableWidgetByUser(com.primeton.widget.auth.User s:portal_user).java",
  "saveUrl": null,
  "addUrl": null,
  "updateUrl": null,
  "deleteUrl": null,
  "dataProvider": "JavaBean",
  "autoLoad": true,
  "fields": [
    {
      "id": getNSValue('store1widgetName'),
      "xtype": "datafield",
      "listeners": {},
      "name": "widgetName",
      "type": "string",
      "mapping": "widgetName",
      "sortType": "",
      "sortDir": "",
      "dateFormat": "",
      "defaultValue": "",
      "displayName": "可选widget",
      "canbenull": true
    },
    {
      "id": getNSValue('store1catalog'),
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
      "id": getNSValue('store1id'),
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
    }
  ]
}}
	);
	UIManager.registerHiddenWidgets(
{
  "listeners": {"afterRender": function afterRender(  ){
/*var testData = [
		{'name': '我要处理的Bug', 'catalog': 'Bug系统'},
		{'name': 'Bug查询', 'catalog': 'Bug系统'},
		{'name': '提交新Bug', 'catalog': 'Bug系统'},
		{'name': '我的任务列表', 'catalog': '公共'},
		{'name': '天气预报', 'catalog': '公共'},
		{'name': 'Google地图', 'catalog': '公共'}
];
store1.loadData(testData);
*/


} },
  "hiddenWidgets": []
}
	);
	UIManager.register(
{
  "id": getNSValue('window2'),
  "xtype": "window",
  "listeners": {"beforeshow": function beforeshow( thisObj ){
try{
if(Ext.getCmp("portalTab").getActiveTab().isSys===undefined)
    {
	Ext.MessageBox.alert("提示信息","非主题页上不能添加widget.");
    return false;
	} 
	}
catch(e)
{
}	



} },
  "layout": "anchor",
  "width": 338,
  "height": 306,
  "title": "选择widgets",
  "footer": true,
  "modal": true,
  "iconCls": "widget-config",
  "items": [{
    "id": getNSValue('commongrid1'),
    "xtype": "commongrid",
    "listeners": {
      "beforeshow": function beforeshow( thisObj ){

} ,
      "beforestaterestore": function beforestaterestore( thisObj , state ){

} 
    },
    "anchor": "100% 100%",
    "store": getNSValue('store1'),
    "title": "",
    "footer": true,
    "buttonAlign": "center",
    "selModel": {
      "id": getNSValue('checkboxSelectionModel1'),
      "xtype": "checkboxSelectionModel",
      "listeners": {}
    },
    "columns": [{
      "id": getNSValue('commongrid1_widgetName'),
      "xtype": "column",
      "listeners": {},
      "width": 234,
      "header": "可选widget",
      "sortable": false,
      "align": "left",
      "dataIndex": "widgetName",
      "hidden": false
    }]
  }],
  "buttons": [
    {
      "id": getNSValue('button2'),
      "xtype": "button",
      "listeners": {"click": function click( thisObj , e ){
	var viewPort = Ext.getCmp("portalTab").getActiveTab();
	var theme=viewPort.getId();
var submitStr = "";
var cols = viewPort.items.length;
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
var userportal = submitStr;

var selectionModel = commongrid1.getSelectionModel();
if(!selectionModel.hasSelection()){
	window2.close();
	return;
}
var selected = selectionModel.getSelections();
var portalArr = userportal.split(";");
var oneArr = [];
if((portalArr[0]) && portalArr[0]!=""){
	oneArr = oneArr = portalArr[0].split(",");
}
if((oneArr.length+selected.length)>20){
	Ext.Msg.alert("提示信息","主题页内widget个数将大于20，请减少widget数量！");
	return;
}
if (selected.length == 0) {
	window2.close();
	return;
} else {
	for (var i = 0; i < selected.length; i++) {
		var item = selected[i];
		if(userportal.indexOf(item.get("id"))!=-1) continue;
		oneArr.push(item.get("id"));
	}
	
	portalArr[0] = oneArr.join(",");
    //var theme=Ext.getCmp("portalTab").getActiveTab().getId();
	var url = "<%=request.getContextPath()%>/portal/action/saveWidgets.jsp?widgets=" + portalArr.join(";")+"&theme="+theme;
	ajaxCall(url, {}, function() {
	            var theme=Ext.getCmp("portalTab").getActiveTab();
				theme.items.each(function(el)
				{
				theme.remove(el,true)
				}
				)
			    theme.add.apply(theme, createPortInfo(theme));
             	theme.doLayout();
			}, function() {
				Ext.Msg.alert("提示信息","添加widget失败!"); 
			});
	window2.close();
}

} },
      "text": "添加"
    },
    {
      "id": getNSValue('button3'),
      "xtype": "button",
      "listeners": {"click": function click( thisObj , e ){
window2.close();
} },
      "text": "取消"
    }
  ]
}
	);
	var store1;
		store1 = EOS.getDataSource('store1', _ns);

	var window2, commongrid1, button2, button3, commongrid1_widgetName, checkboxSelectionModel1;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		window2 = EOS.getCmp('window2', _ns);
		commongrid1 = EOS.getCmp('commongrid1', _ns);
		button2 = EOS.getCmp('button2', _ns);
		button3 = EOS.getCmp('button3', _ns);
		commongrid1_widgetName = EOS.getCmp('commongrid1_widgetName', _ns);
		checkboxSelectionModel1 = EOS.getCmp('checkboxSelectionModel1', _ns);


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