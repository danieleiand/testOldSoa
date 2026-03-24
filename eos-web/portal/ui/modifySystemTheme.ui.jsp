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
	 
	 theme.setValue(portalTab.getActiveTab().title);

	 status.setValue(portalTab.getActiveTab().status);
	if(portalTab.getActiveTab().icon){
     	var iconPath=portalTab.getActiveTab().icon.split("/");
     
     	themeIcon.setText(iconPath[iconPath.length-1]);
     
     	themeIcon.icon="/portal/icon/"+iconPath[iconPath.length-1];
     
     	themeIcon.btnEl.setStyle('background-image', 'url('+WEB_ROOT+ themeIcon.icon +')');
   }else{
     	Ext.fly(themeIcon.getEl()).removeClass("x-btn-text-icon");
     	themeIcon.icon=""; 
   }  	
     themeIcon.getEl().setX(theme.getEl().getX());
      

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

    
	 
	 var portalTab= Ext.getCmp("portalTab");
	 
	 theme.setValue(portalTab.getActiveTab().title);

	 status.setValue(portalTab.getActiveTab().status);
	if(portalTab.getActiveTab().icon){
     	var iconPath=portalTab.getActiveTab().icon.split("/");
     
     	themeIcon.setText(iconPath[iconPath.length-1]);
     
     	themeIcon.icon="/portal/icon/"+iconPath[iconPath.length-1];
     
     	themeIcon.btnEl.setStyle('background-image', 'url('+WEB_ROOT+ themeIcon.icon +')');
   }else{
     	Ext.fly(themeIcon.getEl()).removeClass("x-btn-text-icon");
     	themeIcon.icon=""; 
   }  	
     themeIcon.getEl().setX(theme.getEl().getX());
      

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
  "width": 377,
  "height": 168,
  "title": "修改系统主题",
  "footer": true,
  "modal": true,
  "iconCls": "widget-theme",
  "items": [{
    "id": getNSValue('form1'),
    "xtype": "form",
    "listeners": {"afterlayout": function afterlayout( thisObj , layout ){

} },
    "columns": 2,
    "footer": true,
    "buttonAlign": "center",
    "height": 74,
    "ds": getNSValue(''),
    "anchor": "100% 100%",
    "title": "",
    "width": 370,
    "items": [
      {
        "id": getNSValue('theme'),
        "xtype": "textfield",
        "listeners": {},
        "width": 135,
        "fieldLabel": "主题名称",
        "colspan": 2,
        "name": "dd",
        "hidden": false,
        "hideLabel": false,
        "allowBlank": false,
        "blankText": "主题名称不能为空"
      },
      {
        "id": getNSValue('label1'),
        "xtype": "label",
        "listeners": {},
        "text": "主题图标:"
      },
      {
        "id": getNSValue('themeIcon'),
        "xtype": "button",
        "listeners": {"click": function click( thisObj , e ){
	
			if(!themeIcon.createItem){
				menu1.add({
					text:"无",
					value:""
				});
				themeIcon.createItem=true;
			} 

} },
        "createItem": false,
        "text": "无",
        "width": 68,
        "menu": {
          "id": getNSValue('menu1'),
          "xtype": "menu",
          "listeners": {
            "beforeCreate": function beforeCreate( config ){
config.items 
// <jsp:include page="/portal/action/getThemeIcon.jsp" />
} ,
            "itemclick": function itemclick( baseItem , e ){

                if(themeIcon.text=="无")
               		Ext.fly(themeIcon.getEl()).addClass("x-btn-text-icon");
               	if(baseItem.value=="")
               		Ext.fly(themeIcon.getEl()).removeClass("x-btn-text-icon"); 	
               	themeIcon.icon=baseItem.value;
				themeIcon.btnEl.setStyle('background-image', 'url('+WEB_ROOT+themeIcon.icon +')');;
				themeIcon.setText(baseItem.text);
				themeIcon.getEl().setX(theme.getEl().getX());

} 
          }
        },
        "iconCls": "exit"
      },
      {
        "id": getNSValue('status'),
        "xtype": "radiogroup",
        "listeners": {},
        "width": 122,
        "fieldLabel": "状态",
        "colspan": 2,
        "name": "status",
        "hidden": false,
        "hideLabel": false,
        "items": [
          {
            "id": getNSValue('radio1'),
            "xtype": "radio",
            "listeners": {},
            "boxLabel": "共享",
            "checked": true,
            "width": "20px",
            "value": 1,
            "name": "status",
            "checkValue": "1"
          },
          {
            "id": getNSValue('radio2'),
            "xtype": "radio",
            "listeners": {},
            "boxLabel": "受控",
            "value": 0,
            "name": "status",
            "checkValue": "0"
          }
        ]
      }
    ],
    "buttons": [
      {
        "id": getNSValue('button1'),
        "xtype": "button",
        "listeners": {"click": function click( thisObj , e ){

        var name = theme.getValue().trim();
		if(name==""){
			theme.setValue("");
		}
if (form1.isValid()){			
        var portalTab= Ext.getCmp("portalTab");
        var activeTab=portalTab.getActiveTab();
		var url = getWebRoot()+"/portal/action/modifySystemTheme.jsp?theme=" + encodeURI(theme.getValue()+"&themeId="+activeTab.id+"&icon="+themeIcon.icon)+"&status="+status.getValue();
			ajaxCall(url, {}, function() {
	
			activeTab.setTitle(theme.getValue());
			activeTab.status=status.getValue();
			if(activeTab.icon!=themeIcon.icon){
				if(!activeTab.icon){
					Ext.fly(activeTab.tabEl).addClass("x-tab-with-icon");
				}
				if(!themeIcon.icon){
					Ext.fly(activeTab.tabEl).removeClass("x-tab-with-icon"); 
				}
				activeTab.icon=themeIcon.icon;
    			Ext.fly(activeTab.tabEl).child('span.x-tab-strip-text', true).style.background = 'url('+WEB_ROOT+themeIcon.icon+') no-repeat center left';
			}
	                window1.close();					
					}, function() {
						alert("Add theme failed!")
					});
}



} },
        "text": "修改"
      },
      {
        "id": getNSValue('button2'),
        "xtype": "button",
        "listeners": {"click": function click( thisObj , e ){
window1.close()
} },
        "text": "取消"
      }
    ]
  }]
}
	);


	var window1, form1, theme, label1, themeIcon, status, button1, button2, menu1, radio1, radio2;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		window1 = EOS.getCmp('window1', _ns);
		form1 = EOS.getCmp('form1', _ns);
		theme = EOS.getCmp('theme', _ns);
		label1 = EOS.getCmp('label1', _ns);
		themeIcon = EOS.getCmp('themeIcon', _ns);
		status = EOS.getCmp('status', _ns);
		button1 = EOS.getCmp('button1', _ns);
		button2 = EOS.getCmp('button2', _ns);
		menu1 = EOS.getCmp('menu1', _ns);
		radio1 = EOS.getCmp('radio1', _ns);
		radio2 = EOS.getCmp('radio2', _ns);


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