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
	if(Ext.getCmp("portalTab").getActiveTab().isSys===undefined)
	    {
	    return false;
		} 

var activeTheme=Ext.getCmp("portalTab").getActiveTab();

var colNum =activeTheme.columNum||1;
cnum.setValue(colNum);
var columWidth = activeTheme.columWidth||"1";
var columArr = columWidth.split(",");
var columData = [];
for (var i = 0; i < colNum; i++) {
	var item = {id:i+1};
	item.width = columArr[i] * 100;
	columData.push(item);
}
store1.loadData(columData);

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
  "listeners": {"beforeload": function beforeload( thisObj , options ){

} },
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
      "type": "float",
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
  "listeners": {"afterRender": function afterRender(  ){
	if(Ext.getCmp("portalTab").getActiveTab().isSys===undefined)
	    {
	    return false;
		} 

var activeTheme=Ext.getCmp("portalTab").getActiveTab();

var colNum =activeTheme.columNum||1;
cnum.setValue(colNum);
var columWidth = activeTheme.columWidth||"1";
var columArr = columWidth.split(",");
var columData = [];
for (var i = 0; i < colNum; i++) {
	var item = {id:i+1};
	item.width = columArr[i] * 100;
	columData.push(item);
}
store1.loadData(columData);

} },
  "hiddenWidgets": []
}
	);
	UIManager.register(
{
  "id": getNSValue('window1'),
  "xtype": "window",
  "listeners": {"beforeshow": function beforeshow( thisObj ){
try{
	if(Ext.getCmp("portalTab").getActiveTab().isSys===undefined)
	    {
		Ext.MessageBox.alert("提示信息","非主题页上不能设置布局.");
	    return false;
		} 
		}
		catch(e){}
} },
  "layout": "anchor",
  "width": 300,
  "height": 275,
  "title": "布局配置",
  "footer": true,
  "modal": true,
  "items": [
    {
      "id": getNSValue('form1'),
      "xtype": "form",
      "listeners": {},
      "columns": 1,
      "footer": true,
      "buttonAlign": "center",
      "height": 50,
      "ds": getNSValue(''),
      "title": "",
      "items": [{
        "id": getNSValue('cnum'),
        "xtype": "combo",
        "listeners": {
          "change": function change( thisObj , newValue , oldValue ){
/*if (newValue){
	var num = newValue;
}
else{
	var num = oldValue || 3;
}
store1.removeAll();
var testData = [];
for(var i=1; i<=num; i++){
	testData.push({'id': i, 'width': 100/num});
};
store1.loadData(testData);*/
} ,
          "select": function select( combo , record , index ){


	var num = combo.getValue();

store1.removeAll();
var testData = [];
for(var i=1; i<=num; i++){
	testData.push({'id': i, 'width': (100/num).toPrecision(4)});
};
store1.loadData(testData);
} 
        },
        "displayField": "",
        "valueField": "",
        "emptyText": "请选择...",
        "width": 89,
        "forceSelection": true,
        "value": "3",
        "fieldLabel": "列数",
        "colspan": 1,
        "name": "cnum",
        "hidden": false,
        "hideLabel": false,
        "dataList": "1:1;2:2;3:3;4:4;5:5"
      }]
    },
    {
      "id": getNSValue('commongrid1'),
      "xtype": "commongrid",
      "listeners": {},
      "anchor": "100% -50",
      "store": getNSValue('store1'),
      "title": "",
      "footer": true,
      "buttonAlign": "center",
      "height": 170,
      "hidden": false,
      "clicksToEdit": 1,
      "columns": [
        {
          "id": getNSValue('commongrid1_id'),
          "xtype": "column",
          "listeners": {},
          "width": 100,
          "header": "列号",
          "sortable": false,
          "align": "left",
          "dataIndex": "id",
          "hidden": false
        },
        {
          "id": getNSValue('commongrid1_width'),
          "xtype": "column",
          "listeners": {},
          "width": 100,
          "header": "列宽(%)",
          "sortable": false,
          "align": "left",
          "dataIndex": "width",
          "editor": {
            "id": getNSValue('numberfield2'),
            "xtype": "numberfield",
            "listeners": {},
            "fieldLabel": "",
            "value": "",
            "emptyText": "0",
            "hideLabel": false,
            "width": 135,
            "name": "width",
            "allowDecimals": true,
            "allowNegative": false,
            "decimalPrecision": 2,
            "maxValue": 100,
            "minValue": 0
          },
          "hidden": false
        }
      ]
    }
  ],
  "buttons": [
    {
      "id": getNSValue('button1'),
      "xtype": "button",
      "listeners": {"click": function click( thisObj , e ){
var activeTheme=Ext.getCmp("portalTab").getActiveTab();
var colNum = activeTheme.columNum;
var columWidth = activeTheme.columWidth;
var newNum = cnum.getValue();
var newWidthArr = [];
var total=0;
for (var i = 0; i < store1.getCount(); i++) {
	var width = store1.getAt(i).get("width") / 100;
	if(width==0){
		Ext.Msg.alert("提示信息","布局中列的宽度不能为0");
		return;
	}
	total+=width;
	if(total>1){
		Ext.Msg.alert("提示信息","新布局的总宽度大于100%，请重新输入");
		return;
	}
	newWidthArr.push(width);
}
if(total<0.99){
		Ext.Msg.alert("提示信息","新布局的总宽度小于100%，请重新输入");
		return;
}
var newWidth = newWidthArr.join(",");
if (colNum == newNum && columWidth == newWidth) {
	// do nothing
	window1.close();
} else {
	function updateLayout() {
		var url = getWebRoot()+"/portal/action/saveWidgets.jsp?colMum=" + newNum
				+ "&colWidth=" + newWidth+"&theme="+activeTheme.id;

		ajaxCall(url, {}, function() {
		
		
		            var theme=Ext.getCmp("portalTab").getActiveTab();
					theme.items.each(function(el)
					{
					theme.remove(el,true)
					}
					)
				    theme.add.apply(theme, createPortInfo(theme));
	             	theme.doLayout();
		
					//var mainFrame = top.document.getElementById("portalMainFrame");
					//mainFrame.src = mainFrame.src;
					/*
					var home_panel = Ext.getCmp("homePanel");
					
					var oldMainPortal = Ext.getCmp("mainPortal");
					home_panel.remove(oldMainPortal, true);
					
					var mainPortal = Ext.ComponentMgr.create({
						xtype : 'portal',
						id : "mainPortal",
						items : createPortInfo(),
						listeners : {
							'drop' : function(e) {
								updateMainLayout();
							}
						},
						anchor : '100% 100%'
					});
					home_panel.insert(0, mainPortal);
					home_panel.doLayout();
					
*/


				}, function() {
					alert("Failed to change layout!");
				});
	}
	if (newNum < colNum) {
		Ext.MessageBox.confirm("确认布局更新", "新布局中的列小于原布局，某些列上的内容会被删除，确定要更新布局吗？",
				function(btn) {
					if(btn == "yes"){
						updateLayout();
					}
				}, this);
	} else {
		updateLayout();
	}
	window1.close();
}

} },
      "text": "保存"
    },
    {
      "id": getNSValue('button2'),
      "xtype": "button",
      "listeners": {"click": function click( thisObj , e ){
window1.close();
} },
      "text": "取消"
    }
  ]
}
	);
	var store1;
		store1 = EOS.getDataSource('store1', _ns);

	var window1, form1, commongrid1, button1, button2, cnum, commongrid1_id, commongrid1_width, numberfield2;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		window1 = EOS.getCmp('window1', _ns);
		form1 = EOS.getCmp('form1', _ns);
		commongrid1 = EOS.getCmp('commongrid1', _ns);
		button1 = EOS.getCmp('button1', _ns);
		button2 = EOS.getCmp('button2', _ns);
		cnum = EOS.getCmp('cnum', _ns);
		commongrid1_id = EOS.getCmp('commongrid1_id', _ns);
		commongrid1_width = EOS.getCmp('commongrid1_width', _ns);
		numberfield2 = EOS.getCmp('numberfield2', _ns);


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