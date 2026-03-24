<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/webui/nazca/common.jsp"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.gocom.abframe.auth.bizlet.LogonUtil"%>

<%

//TODO 如果要设置客户端缓存页面，注释以下三行

response.setHeader("Pragma","No-Cache"); 

response.setHeader("Cache-Control","No-Cache");

response.setHeader("Content-Type", "text/html; charset=utf-8");

response.setDateHeader("Expires",   0);

String contextPath = request.getContextPath();

%>

<%@page import="java.util.*" %>

<%@page import="com.primeton.portal.purview.service.AppManagerService"%>

<%@page import="com.primeton.portal.purview.entity.Application"%>

<%@page import="com.primeton.json.JSONObject"%>

<%@page import="commonj.sdo.DataObject"%>

<%@page import="com.eos.foundation.database.DatabaseUtil"%>

<%@page import="com.eos.foundation.data.DataObjectUtil"%>

<%@page import="com.eos.data.datacontext.UserObject"%>

<%
		
	    System.out.println("=========================================");
	    System.out.println("=========================================");
		Object menu = session.getAttribute("menu");

	    String entityName = "com.yd.soa.comm.portalData.PortalApp";

	    DataObject criteriaEntity = DataObjectUtil.createDataObject("com.primeton.das.criteria.criteriaType");

		criteriaEntity.set("_entity", entityName);

		criteriaEntity.set("_expr[1]/issystemmenu",1);
		//portalData
		criteriaEntity.set("_orderby[1]/_property","sort");
		criteriaEntity.set("_orderby[1]/_sort","asc");



		DataObject[] sysmenus = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
	    

	    

	   	JSONObject menuInfos = new JSONObject();

	    

		String defaultAppCode = "";

	    

	    for(DataObject sysmenu:sysmenus)

	    {

	  

	     	JSONObject menuInfo = new JSONObject();

            menuInfo.put("id",sysmenu.getString("appid"));

	        menuInfo.put("appName",sysmenu.getString("appname"));

	        menuInfo.put("appDisplayName",sysmenu.getString("appdisplayname"));

	        menuInfo.put("icon",sysmenu.getString("icon"));

	        menuInfo.put("openMode",sysmenu.getString("openmode"));

	        menuInfo.put("treeDataUrl",sysmenu.getString("treedataurl"));

	        menuInfo.put("treeOpenMode",sysmenu.getString("treeopenmode"));

	        menuInfo.put("treeRootName",sysmenu.getString("treerootname"));

	        menuInfo.put("treeShowRoot",sysmenu.getString("treeshowroot"));

	        menuInfo.put("url",sysmenu.getString("url"));

	        menuInfo.put("appAction",sysmenu.getString("appaction"));

	        menuInfo.put("localApp",sysmenu.getString("localapp"));

	        menuInfo.put("logintype",sysmenu.getString("logintype"));

	        menuInfo.put("section",sysmenu.getString("section"));
	        menuInfo.put("version",sysmenu.getString("version"));

            menuInfos.put(sysmenu.getString("appid"),menuInfo);

            String v = sysmenu.getString("version");

            if("1".equals(v)){

            	defaultAppCode = sysmenu.getString("appid");

            }

           

	    }



        

out.println("var menuInfos=" +  menuInfos.toString()+";");



 %>




//<script type="text/javascript">

<%
String  havesetpwd = "N";//是否修改过密码
String  pwd = "";     //密码

String  havesetbqq = "S";//是否有BQQ号码 Y/S
String  havesetmobile = "N";//是否有手机号码 Y/N

String  bqq = "";     //bqq号码
String  mobileno = "";//手机号码
String  ismsgwarn ="";//ISMSGWARN短信提醒 0/1 0提醒/开启 1不提醒/禁用

String  userId ="";//登陆账号
String cardno = "";//身份证号
String legalPwd= "true";
try{

	Map map = new HashMap();
	UserObject user = (UserObject)session.getAttribute("userObject");
	legalPwd = (String)session.getAttribute("legalPwd");
	//if(null != legalPwd)session.removeAttribute("legalPwd");
	userId = user.getUserId();
	map.put("userid",userId);
	Map rtnMap = new HashMap();
	Object[] mapArr = null;
	mapArr = (Object[])com.eos.foundation.database.DatabaseExt.queryByNamedSql("default","com.yd.soa.logmgr.query_log.queryUserInfo",map);	
	if(null != mapArr && mapArr.length > 0){
		rtnMap = (Map)mapArr[0];
	}

	if(null != rtnMap){
		pwd = rtnMap.get("PASSWORD")== null ?"":rtnMap.get("PASSWORD").toString();
		havesetpwd = rtnMap.get("HAVESETPWD") == null ? "N" : rtnMap.get("HAVESETPWD").toString();
		
		
		mobileno = rtnMap.get("MOBILENO")== null ?"":rtnMap.get("MOBILENO").toString();		
		havesetmobile = rtnMap.get("HASMOBILE") == null ? "N" : rtnMap.get("HASMOBILE").toString();
		
		bqq = rtnMap.get("BQQ")== null ?"":rtnMap.get("BQQ").toString();
		havesetbqq = rtnMap.get("HASBQQ") == null ? "S" : rtnMap.get("HASBQQ").toString();
		
		ismsgwarn  = rtnMap.get("ISMSGWARN") == null ? "1" : rtnMap.get("ISMSGWARN").toString();
		
		cardno  = rtnMap.get("CARDNO") == null ? "1" : StringUtils.right(rtnMap.get("CARDNO").toString(),6);
		cardno = LogonUtil.getPassword(pwd);
		
	}
	if("ZwsUcorZkCrsujLiL6T2vQ==".equals(pwd)||cardno.equals(pwd)){//是6个0的强制修改密码
		havesetpwd = "N";
		//System.out.println("密码为0，需要重置");
	}else{
		havesetpwd = "Y";
	}
	if("false".equals(legalPwd)){// [SOA-775] 关于SOA系统用户密码安全漏洞的解决方案 密码复杂度不够重设密码
		havesetpwd = "N";
	}
	if(userId.equals("sysadmin")){//系统管理员不需要设置
		havesetpwd = "Y";
		havesetbqq = "S";
		havesetmobile = "Y";
	}
	
}catch(Exception e){
	e.printStackTrace();
	havesetpwd = "N";
	havesetbqq = "S";
	havesetmobile = "N";
}

System.out.println("login_userid："+userId +"[havesetpwd="+ havesetpwd+",havesetbqq="+havesetbqq+"_"+bqq+",havesetmobile="+havesetmobile+"_"+mobileno+"_"+ismsgwarn+"]");

out.println("var m_userid_value='"+userId+"';");
out.println("var m_mobileno_value='"+mobileno+"';");
out.println("var m_havesetmobile_value='"+havesetmobile+"';");
out.println("var m_ismsgwarn_value='"+ismsgwarn+"';");

out.println("var m_bqq_value='"+bqq+"';");
out.println("var m_havesetbqq_value='"+havesetbqq+"';");
 %>

<% if(havesetpwd.equalsIgnoreCase("N")){ 

%>

    top.showDialog('changePassword.ui',null,null,top,null,null);

<% } %>
<%
	if(havesetmobile.equalsIgnoreCase("N")){
 %>
 	window.top.showDialog('addMobile.ui',null,null,top,null,null);
<%} %>

var __temp_ns = __temp_ns|| '';
var __temp_params = __temp_params|| null;
var __temp_parent = __temp_parent|| null;
var __temp_ui = null;
var __temp_isSubUI = __temp_isSubUI|| false;
var _temp_pw_c = "first";

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
{"listeners": {
  "afterRender": function afterRender(  ){
	//alert(Ext.ComponentMgr.create)
	/*var mainPage = Ext.ComponentMgr.create({
		xtype : 'portal',
		id : "mainPage",
		items : createPortInfo(),
		listeners : {
			'drop' : function(e) {
				updateMainLayout();
			}
		},
		anchor : '100% 100%',
		title:'首页',
		iconCls:'widget-mainPage'
	});
	portalTab.insert(0, mainPage);
	portalTab.doLayout();
	portalTab.setActiveTab(0);
 */

for(var i=0;i<themes.length;i++)
{
var theme=themes[i];
var idString = theme.tabId;

idString = idString.substring(0,4);
var mainPage = Ext.ComponentMgr.create({
		xtype : 'portal',
		id : theme.tabId,
		isSys:theme.isSys,
		closable:idString==='main' || idString==='nSYS'?false:true,

		listeners : {
			'drop' : function(e) {
				updateMainLayout();
			}
			,
			'beforerender': function(o){

				try{

					o.add.apply(o, createPortInfo(o));

				}catch(e){

				

				}
	
			}
			
		},
		anchor : '100% 100%',
		title:theme.tabTitle
	});
	if(theme.icon)
		Ext.apply(mainPage,{
			icon:WEB_ROOT+"/" +theme.icon,
			iconCls:'portal'
		});
	portalTab.add(mainPage);
		}
	portalTab.doLayout();
	setTimeout(function(){
		 portalTab.setActiveTab(0);

		
		var h=portalTab.getEl().getHeight()-portalTab.header.getHeight();
		
	    portalTab.body.setHeight( h-portalTab.header.getHeight()+4);
	    
		 
	
		 
		
	},1
	)

	

} ,
  "beforeRender": function beforeRender(  ){
document.body.oncontextmenu=function(){return false}
} 
}}
	);
	if (!__temp_isSubUI) { document.title=""  }
  UIManager.UI.arguments= _params; 
  UIManager.setParentWidget(_parent); 
	UIManager.initDataContext(
{}
	);
	UIManager.registerHiddenWidgets(
{
  "listeners": {
    "afterRender": function afterRender(  ){
	//alert(Ext.ComponentMgr.create)
	/*var mainPage = Ext.ComponentMgr.create({
		xtype : 'portal',
		id : "mainPage",
		items : createPortInfo(),
		listeners : {
			'drop' : function(e) {
				updateMainLayout();
			}
		},
		anchor : '100% 100%',
		title:'首页',
		iconCls:'widget-mainPage'
	});
	portalTab.insert(0, mainPage);
	portalTab.doLayout();
	portalTab.setActiveTab(0);
 */

for(var i=0;i<themes.length;i++)
{
var theme=themes[i];

var mainPage = Ext.ComponentMgr.create({
		xtype : 'portal',
		id : theme.tabId,
		isSys:theme.isSys,
		closable:theme.tabId==='main'?false:true,

		listeners : {
			'drop' : function(e) {
				updateMainLayout();
			}
			,
			'beforerender': function(o){

			o.add.apply(o, createPortInfo(o))
	
	
			}
			
		},
		anchor : '100% 100%',
		title:theme.tabTitle
	});
	if(theme.icon)
		Ext.apply(mainPage,{
			icon:WEB_ROOT+"/" +theme.icon,
			iconCls:'portal'
		});
	portalTab.add(mainPage);
		}
	portalTab.doLayout();
	setTimeout(function(){
		 portalTab.setActiveTab(0);

		
		var h=portalTab.getEl().getHeight()-portalTab.header.getHeight();
		
	    portalTab.body.setHeight( h-portalTab.header.getHeight()+4);
	    
		 
	
		 
		
	},1
	)

	

} ,
    "beforeRender": function beforeRender(  ){
document.body.oncontextmenu=function(){return false}
} 
  },
  "hiddenWidgets": [{
    "id": getNSValue('menu'),
    "xtype": "menu",
    "listeners": {"show": function show( thisObj ){
if(currentItem.isSys==true) 
        deleteTab.setVisible(false);
        else
        deleteTab.setVisible(true);
        
} },
    "items": [
      {
        "id": getNSValue('addTab'),
        "xtype": "menuitem",
        "listeners": {"click": function click( thisObj , e ){
showDialog('addTheme.ui',null,null,window,null,null);
} },
        "text": "新增主题",
        "icon": window.WEB_ROOT+"/portal/images/theme.png"
      },
      {
        "id": getNSValue('deleteTab'),
        "xtype": "menuitem",
        "listeners": {"click": function click( thisObj , e ){
Ext.Msg.confirm(
	"信息",
	"你确定要刪除"+  currentItem.title+ "？",
	function(choose){
	//回调方法，会传入选择结果

	if(choose=="yes") 
	{      
    var url = getWebRoot()+"/portal/action/deletePortalTheme.jsp?theme=" + currentItem.getId();
		ajaxCall(url, {}, function() {
      			portalTab.remove(currentItem)
				
				}, function() {
					alert("Delete theme failed!")
				});
				}
	}
	)

	

} },
        "text": "删除主题",
        "icon": window.WEB_ROOT+"/portal/images/delete.gif"
      },
      {
        "id": getNSValue('menuseparator1'),
        "xtype": "menuseparator",
        "listeners": {}
      },
      {
        "id": getNSValue('addWidget'),
        "xtype": "menuitem",
        "listeners": {"click": function click( thisObj , e ){
showDialog('addWidget.ui',null,null,window,null,null);
} },
        "text": "新增widget",
        "icon": window.WEB_ROOT+"/portal/images/widget.png"
      },
      {
        "id": getNSValue('layout'),
        "xtype": "menuitem",
        "listeners": {"click": function click( thisObj , e ){
showDialog('layout.ui',null,null,window,null,null);
} },
        "text": "设置部局",
        "icon": window.WEB_ROOT+"/portal/images/layout.gif",
        "iconCls": "config"
      }
    ]
  }]
}
	);
	UIManager.register(
{
  "id": getNSValue('mainpage'),
  "xtype": "viewport",
  "listeners": {"beforeCreate": function beforeCreate( config ){
window.themes

// <jsp:include page="/portal/action/getPortalTheme.jsp" />


} },
  "layout": "anchor",
  "items": [{
    "id": getNSValue('panel1'),
    "xtype": "panel",
    "listeners": {},
    "border": true,
    "frame": false,
    "anchor": "100% 100%",
    "layout": "border",
    "footer": true,
    "buttonAlign": "center",
    "items": [
      {
        "id": getNSValue('top_panel'),
        "xtype": "panel",
        "listeners": {"beforeCreate": function beforeCreate( config ){

config.collapseMode="mini";

config.split = true;

}



},
        "border": false,
        "frame": false,
        "height": 50,
        "layout": "anchor",
        "region": "north",
        "footer": false,
        "style": "",
        "ctCls": "",
        "cls": "portal-bar",
        "hideBorders": true,
        "html": "<iframe width='100%' height='50' frameborder='0' src='topBar.jsp' id='topmsg' ALLOWTRANSPARENCY=true><\/iframe>",
        "bodyStyle": "background:transparent",
        "bodyBorder": false,
        "buttons": []
      },
      {
        "id": getNSValue('main_panel'),
        "xtype": "panel",
        "listeners": {"afterlayout": function afterlayout( thisObj , layout ){

} },
        "border": false,
        "frame": false,
        "layout": "anchor",
        "region": "center",
        "footer": true,
        "height": 537,
        "items": [{
          "id": getNSValue('panel2'),
          "xtype": "panel",
          "listeners": {},
          "border": false,
          "frame": false,
          "anchor": "100% 100%",
          "layout": "border",
          "footer": true,
          "buttonAlign": "center",
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
              "width": 200,
              "footer": true,
              "buttonAlign": "center",
              "titleCollapse": true,
              "hideCollapseTool": false,
              "baseCls": "menu",
              "collapsed": false,
              "height": "",
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
                "items": [
                  
                  {
                    "id": getNSValue('panel6'),
                    "xtype": "panel",
                    "listeners": {},
                    "border": false,
                    "frame": false,
                    "layout": "anchor",
                    "region": "center",
                    "footer": true,
                    "items": [{
                      "id": getNSValue('panel5'),
                      "xtype": "panel",
                      "listeners": {},
                      "border": false,
                      "frame": false,
                      "anchor": "100% 100%",
                      "layout": "border",
                      "footer": true,
                      "buttonAlign": "center",
                      "items": [
                        

		                        {

				                "id": getNSValue('portalTab_1'),

				                "xtype": "tabpanel",

				                "border": true,

				                "frame": false,

				                "activeTab": 0,

				                "height": "",

				                "title": "系统菜单",

				                "footer": false,

				                "buttonAlign": "center",

				                "region": "center",

				                "width": "",

				                "anchor": "100% 100%",

				                "enableTabScroll": false,

				                "cls": "mainframe mainframe_2",

				                "activeItem": "",

				                "tabMargin": 0,

				                "deferredRender": true,

				                "baseCls": "",

				                 "items": [

				               			  

				               			  {

				               			    "id": getNSValue('left_tab_section1'),

				               			  	"title": '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;办公模块',

				               			  	"xtype":"panel",

				               			  	"layout":'accordion',

				               			  	"icon": window.WEB_ROOT+"/portal/images/layout.gif",

				               			  	"items":[

				               			  			{

				               			  				"xtype":"panel",

				               			  				"listeners":{},

				               			  				"border":true,

				               			  				"frame":false,

				               			  				"footer":true,

				               			  				"layout":"anchor",

				               			  				"region":"center",

				               			  				"title":"我的链接",

				               			  				"anchor":"100%",

				               			  				"autoScroll":true,

				               			  				"rootVisible":false,

				               			  				"iconCls":"icon_deault_link",

				               			  				"height":"",

				               			  					"items":[

				               			  						{

				               			  						"id":"section1_tree_default",

						               			  				"xtype":"panel",

						               			  				"listeners":{},

						               			  				"border":true,

						               			  				"frame":false,

						               			  				"footer":true,

						               			  				"header":false,

						               			  				"layout":"anchor",

						               			  				"region":"center",

						               			  				"title":"我的链接",

						               			  				"anchor":"100%",

						               			  				"rootVisible":false,

						               			  				"height":""

						               			  				}

				               			  					]

				               			  			}

				               			  			

				               			  	<%

				               			  		//2012-2-24 新版菜单

				               			 		StringBuffer sbTreeCode = new StringBuffer(",");

				               			  		int menuLength = sysmenus.length;

				               			  		boolean isTree = true;

				               			  		for(DataObject sm:sysmenus){

					               			  		if(!"1".equals(sm.getString("section"))){

				               			  				continue;

				               			  			}

				               			  			if("3".equals(sm.getString("openmode"))){

				               			  				isTree = true;	

				               			  			}else{

				               			  				isTree = false;	

				               			  			}

				               			  			if(!isTree){

				               			  				continue;

				               			  			}

				               			  			

				               			  			//System.out.println(treeIndex);

				               			  			

					               			  		sbTreeCode.append("{");

						               			  	sbTreeCode.append("\"id\":\"section1_tree_"+sm.getString("appid")+"\",");

						               			 	sbTreeCode.append("\"listeners\": {},");

						               			 	sbTreeCode.append("\"border\": true,");

						               				sbTreeCode.append("\"frame\": false,");

						               				sbTreeCode.append("\"footer\": true,");

						               				sbTreeCode.append("\"layout\": \"anchor\",");

						               				sbTreeCode.append("\"region\": \"center\",");

						               				sbTreeCode.append("\"title\": \""+sm.getString("appdisplayname")+"\",");

						               				sbTreeCode.append("\"anchor\": \"100%\",");

						               				sbTreeCode.append("\"rootVisible\":false,");
						               				

						               				sbTreeCode.append("\"iconCls\":\"icon_"+sm.getString("appid")+"\",");

						               				sbTreeCode.append("\"height\": \"\"");

						               				sbTreeCode.append("}");

						               				sbTreeCode.append(",");	

				               			  		}

				               			  		out.println(sbTreeCode.toString());

				               			  		

				               			  	%>

				               			  			]

				               			  },

				               			  

				               			  {

				               			  	"id": getNSValue('left_tab_section2'),

				               			  	"title": '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业务模块',

				               			  	"xtype":"panel",

				               			  	"layout":'accordion',

				               			  	"icon": window.WEB_ROOT+"/portal/images/layout.gif",

				               			  	"items":[

				               			  	<%

				               			  		//2012-2-24 新版菜单

				               			 		StringBuffer sbTreeCode_2 = new StringBuffer();

				               			  		for(DataObject sm:sysmenus){

				               			  			if(!"2".equals(sm.getString("section"))){

				               			  				continue;

				               			  			}

				               			  			

				               			  			if("3".equals(sm.getString("openmode"))){

					               			  			isTree = true;	

				               			  			}else{

				               			  				isTree = false;	

				               			  			}

				               			  			

				               			  			if(!isTree){

				               			  				continue;

				               			  			}

				               			  			

					               			  		sbTreeCode_2.append("{");

						               			  	sbTreeCode_2.append("\"id\":\"section2_tree_"+sm.getString("appid")+"\",");

						               			 	sbTreeCode_2.append("\"listeners\": {},");

						               			 	sbTreeCode_2.append("\"border\": true,");

						               				sbTreeCode_2.append("\"frame\": false,");

						               				sbTreeCode_2.append("\"footer\": true,");

						               				sbTreeCode_2.append("\"layout\": \"anchor\",");

						               				sbTreeCode_2.append("\"region\": \"center\",");

						               				sbTreeCode_2.append("\"title\": \""+sm.getString("appdisplayname")+"\",");

						               				sbTreeCode_2.append("\"anchor\": \"100%\",");

						               				sbTreeCode_2.append("\"rootVisible\":false,");

						               				sbTreeCode_2.append("\"iconCls\":\"icon_"+sm.getString("appid")+"\",");

						               				sbTreeCode_2.append("\"height\": \"\"");

						               				sbTreeCode_2.append("}");

							               			sbTreeCode_2.append(",");	

				               			  		}

				               			  		

				               			  		out.println(sbTreeCode_2.toString());

				               			  		

				               			  	%>

				               			  	]

				               			  }

				               			  

				                 		]

				              }

                        
                      ]
                    }]
                  }
                ]
              }]
            },
            {
              "id": getNSValue('panel3'),
              "xtype": "panel",
              "listeners": {},
              "border": true,
              "frame": false,
              "layout": "anchor",
              "region": "center",
              "footer": true,
              "cls": "main",
              "style": "",
              "items": [{
                "id": getNSValue('portalTab'),
                "xtype": "tabpanel",
                "listeners": {"contextmenu": function contextmenu( thisObj , tab , e ){
currentItem = tab;
menu.showAt(e.getPoint());

} },
                "border": false,
                "frame": false,
                "activeTab": 1,
                "height": "",
                "title": "首页",
                "footer": false,
                "buttonAlign": "center",
                "region": "center",
                "width": "",
                "anchor": "100% 100%",
                "enableTabScroll": true,
                "cls": "mainframe",
                "activeItem": "",
                "tabMargin": 40,
                "deferredRender": true,
                "baseCls": ""
              }]
            }
          ]
        }]
      }
    ]
  }]
}
	);


	var mainpage, panel1, top_panel, main_panel, panel2, left_panel, panel3, rollingNews, panel4, portalTab,portalTab_1, panel6, panel5, PORTALMENUTREE, PORTALQUICKMENU,left_tab_section1,left_tab_section2;
	var menu, addTab, deleteTab, menuseparator1, addWidget, layout;
   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		mainpage = EOS.getCmp('mainpage', _ns);
		panel1 = EOS.getCmp('panel1', _ns);
		top_panel = EOS.getCmp('top_panel', _ns);
		main_panel = EOS.getCmp('main_panel', _ns);
		panel2 = EOS.getCmp('panel2', _ns);
		left_panel = EOS.getCmp('left_panel', _ns);
		panel3 = EOS.getCmp('panel3', _ns);
		rollingNews = EOS.getCmp('rollingNews', _ns);
		panel4 = EOS.getCmp('panel4', _ns);
		portalTab = EOS.getCmp('portalTab', _ns);

		portalTab_1 = EOS.getCmp('portalTab_1', _ns);
		panel6 = EOS.getCmp('panel6', _ns);
		panel5 = EOS.getCmp('panel5', _ns);
		PORTALMENUTREE = EOS.getCmp('PORTALMENUTREE', _ns);
		PORTALQUICKMENU = EOS.getCmp('PORTALQUICKMENU', _ns);

		menu = EOS.getCmp('menu', _ns);
		addTab = EOS.getCmp('addTab', _ns);
		deleteTab = EOS.getCmp('deleteTab', _ns);
		menuseparator1 = EOS.getCmp('menuseparator1', _ns);
		addWidget = EOS.getCmp('addWidget', _ns);
		layout = EOS.getCmp('layout', _ns);

		

		left_tab_section1 = EOS.getCmp('left_tab_section1', _ns);

		left_tab_section2 = EOS.getCmp('left_tab_section2', _ns);

		UIManager.fireEvent('afterRender',[]);
	}
   if (__temp_isSubUI){
	    __loadFunc();
   }else{
	    EOS.onLoad( __loadFunc );
   } 
   return UIManager; 
})(__temp_ns,__temp_params,__temp_parent);




//-----------------

//显示树



Ext.onReady(function(){

  //本地应用
  var versionappid="";
  for(var key in menuInfos){

  		if(menuInfos[key]["openMode"]!="3"){

  			continue;

  		}

  		var appSectionCur = menuInfos[key]["section"];

  		
		
  		if(appSectionCur == "1"){

  			window.top.portalUtil.showTree("",menuInfos[key],"section1_tree_"+menuInfos[key]["id"]);	
			if(menuInfos[key]["version"] == "1"){
				versionappid = "section1_tree_"+menuInfos[key]["id"];
				
			}
  		}else if(appSectionCur == "2"){

  			window.top.portalUtil.showTree("",menuInfos[key],"section2_tree_"+menuInfos[key]["id"]);	

  		}else{

  		}

  		//Ext.getCmp("section1_tree_41").expand();

  }
  Ext.getCmp(versionappid).expand();
  //其他应用（构不成树）

  var menuInfosNew = new Array();

  for(var key in menuInfos){

  		if(menuInfos[key]["openMode"]!="3"){

  			menuInfosNew[key] = menuInfos[key];

  		}

  }

  

  drawTree_links(menuInfosNew);

});



//链接的单击事件

function lick_click(node,event){

	var node_url = node.url;

	var node_id = node.id;

	node_id = node_id.replace("links_","");

	js_openpage(node_id);

}



//画树，只有链接的树

function drawTree_links(treeData){

   //Ext.QuickTips.init();

   var linksTree=new Ext.tree.TreePanel({

       "el":"section1_tree_default",

       "listeners":{},

       "xtype": "treepanel",

       "header":false,

       "autoScroll":true,

		"border":false,

		"frame":false,

		"footer":true,

		"layout":"anchor",

		"region":"center",

		"title":"我的链接",

		"anchor":"100%",

		"buttonAlign": "center",

		"rootVisible":false,

		"height": "100%",

		"height":""

   });

   

   //根节点

   var linksTreeRoot=new Ext.tree.TreeNode({

       id:"link_tree_root",

       text:"我的链接",

       xtype: "commontreenode",

       async: true,

       expanded:true

   });

   

   for(var key2 in treeData){

   		//第一个子节点及其子节点

   		if(undefined == treeData[key2]["id"] || null==treeData[key2]["id"] || treeData[key2]["id"] == ""){

   		 continue;

   		}

	   var sub1=new Ext.tree.TreeNode({

	       id:"links_"+treeData[key2]["id"],

	       text:treeData[key2]["appDisplayName"],

	       href:"#",
	       
	       listeners:{'click':{fn:lick_click}},

	       icon:window.WEB_ROOT +""+treeData[key2]["icon"],

	       singleClickExpand:true

	   });

	   linksTreeRoot.appendChild(sub1);

   }

   linksTree.setRootNode(linksTreeRoot);//设置根节点

   linksTree.render();
   
  ///Ext.getCmp("section2_tree_41").expand();

}


</script>

<jsp:include page="/portal/widget/systemMenuV2_init.jsp"/>

<%--二维码浮动页--%>
<jsp:include page="/portal/share/tdcode.jsp"/>
<%--图片漂浮--%>
<%--<jsp:include page="/portal/share/piaofuwu.jsp"/>--%>

<style>

<--

.icon_deault_link{

	background-image:url() !important;

}

<%

	//2012-2-24 新版菜单

	StringBuffer icon_style = new StringBuffer();

	icon_style.append(".icon_deault_link\n");

	icon_style.append("{\n");

	icon_style.append("background-image:");

	icon_style.append("url("+contextPath+"/customization/bigImages/services.png) !important;\n");

	icon_style.append("}\n");

	boolean isTreeCur = true;

	for(DataObject sm:sysmenus){

		

		if("3".equals(sm.getString("openmode"))){

			isTreeCur = true;	

		}else{

			isTreeCur = false;	

		}

		if(!isTreeCur){

			continue;

		}

		

		//System.out.println(treeIndex);

		String appIdCur = sm.getString("appid");

		String iconCur = sm.getString("icon");

		

		icon_style.append(".icon_"+appIdCur+"\n");

		icon_style.append("{\n");

		icon_style.append("background-image:");

		icon_style.append("url("+contextPath+""+iconCur+") !important;\n");

		icon_style.append("}\n");

	}

	out.println(icon_style.toString());

	
	

%>

-->

</style>
<%
out.println("<div id='ttt_owes_id'/>");
 %>
 <script type="text/javascript">
 var menu = '<%= menu%>'
 if(menu != null && menu != 'null' && menu != undefined && menu != 'undefined'){
 	window.location.href="<%=request.getContextPath()%>/"+menu;
 }
 </script>
 