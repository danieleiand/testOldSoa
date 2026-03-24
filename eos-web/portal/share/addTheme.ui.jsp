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

themeIcon.getEl().setX(theme.getEl().getX());
themeIcon.icon="/portal/images/home.gif";


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

themeIcon.getEl().setX(theme.getEl().getX());
themeIcon.icon="/portal/images/home.gif";


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
  "title": "新增主题",
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
        "listeners": {"beforeCreate": function beforeCreate( config ){


} },
        "text": "home.gif",
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
themeIcon.icon=baseItem.value;
themeIcon.btnEl.setStyle('background-image', 'url('+WEB_ROOT+themeIcon.icon +')');;
themeIcon.setText(baseItem.text);
themeIcon.getEl().setX(theme.getEl().getX());


} 
          }
        },
        "iconCls": "exit",
        "icon": window.WEB_ROOT+"/portal/images/home.gif"
      }
    ],
    "buttons": [
      {
        "id": getNSValue('button1'),
        "xtype": "button",
        "listeners": {"click": function click( thisObj , e ){
		var url = getWebRoot()+"/portal/action/addPortalTheme.jsp?theme=" + encodeURI(theme.getValue()+"&icon="+themeIcon.icon);
				
       if(form1.isValid())
		ajaxCall(url, {}, function() {
					//var mainFrame = top.document.getElementById("portalMainFrame");
					//mainFrame.src = mainFrame.src;
					
			var text=this.responseText;
			var result = text?eval("("+text+")"):text;	
		    var newTheme = Ext.ComponentMgr.create({
			xtype : 'portal',
			id : result.themeId,
			closable:false,
			isSys:false,
			listeners : {
				'beforerender': function(o){
				 o.add.apply(o, createSysPortInfo(o.id))
				}
				
			},
			icon:WEB_ROOT+themeIcon.icon,
			anchor : '100% 100%',
			title:theme.getValue(),
			iconCls:'widget-mainPage'
		});
	       var portalTab= Ext.getCmp("portalTab");
			portalTab.add(newTheme);
			portalTab.setActiveTab(newTheme);
                window1.close();					
				}, function() {
					alert("Add theme failed!")
				});




} },
        "text": "新增"
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


	var window1, form1, theme, label1, themeIcon, button1, button2, menu1;

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
		button1 = EOS.getCmp('button1', _ns);
		button2 = EOS.getCmp('button2', _ns);
		menu1 = EOS.getCmp('menu1', _ns);


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