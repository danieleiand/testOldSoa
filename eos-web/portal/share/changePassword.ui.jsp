<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/webui/nazca/common.jsp"%>

/**
.form_table
{
border-collapse: collapse;
border:1px solid #AEC2CD;
background:#F7FDFD;
padding-left:5px;
}
.form_table td
{
height:25px;
border:1px solid #AEC2CD;
}
*/

//<script type="text/javascript">
var haveSetPassword = false;
var __temp_ns = __temp_ns|| '';
var __temp_params = __temp_params|| null;
var __temp_parent = __temp_parent|| null;
var __temp_ui = null;
var __temp_isSubUI = __temp_isSubUI|| false;
__temp_ui = (function(_ns,_params,_parent){
	//_ns = _ns || (window.isDesigning?'':EOS.DEFAULT_NAMESPACE);
	
	_ns = "namespace10000";
	
	function getNSValue(oid){
		return EOS.getNSValue(oid,_ns);
	}
	function getCmp(id){
		return Ext.getCmp(getNSValue(id));
	}
	var UIManager = EOS.UIManager.create(_ns);

	UIManager.initUI(
{"listeners": {"afterRender": function afterRender(  ){


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

} },
  "hiddenWidgets": []
}
	);



var formHTML = "<form><table class='fuck' align='center' border='0' width='100%' height='100%' style='border-collapse: collapse;border:1px solid ##DDDDDD;background:#ffffff;padding-left:5px;'>"+
			   "<tr><td align='center' width='30%' style='height:25px;border:1px solid #DDDDDD;'>"+
			   "当前登录密码</td><td  width='60%' style='height:25px;border:1px solid ##DDDDDD;border-right:none'>"+
			   "<input type='password' name='oldpassword'/>"+
			   "<font color='red'>*</font>"+
			   "</td></tr>"+
			   "<tr><td align='center' style='height:25px;border:1px solid #DDDDDD;'>"+
			   "新登录密码</td><td style='height:25px;border:1px solid #DDDDDD;border-right:none;'>"+
			   "<input type='password' name='newpassword'/>"+
			   "<font color='red'>*</font>"+
			   "</td></tr>"+
			   "<tr><td align='center' style='height:25px;border:0px solid #DDDDDD;'>"+
			   "确认新登录密码</td><td style='height:25px;border:1px solid #DDDDDD;border-right:none;'>"+
			   "<input type='password' name='repassword'/>"+
			   "<font color='red'>*</font>"+
			   "</td></tr>"+
			   "<tr><td colspan='3' align='center' style='height:25px;border:1px solid #DDDDDD;'>"+
			   "<span id='msgspan' style='color:red'><d:write dictTypeId="YD_CONFIG_PW" value="pwd_warn_msg" /></span>"+
			   "</td></tr>"+
			   "<tr><td colspan='3' align='center' style='height:30px;border:1px solid #DDDDDD;'>"+
			   "<input type='button' onclick='submit_form()' value='提交更改' style='background-color:#ffe57d;height:20px;BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 0px; BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid;'/>"+
			   "<input type='button' onclick='this_logout()' value='退出系统' style='background-color:#ffe57d;height:20px;BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 0px; BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid;'/>"+
			   "</td></tr>"+
			   "</table></form>";

	UIManager.register(
{
  "id": getNSValue('window1'),
  "xtype": "window",
  "haveSetPassword":false,
  "listeners": {"beforeclose": function (){
  		if(!this.haveSetPassword){
  			$id("msgspan").innerHTML = "请先设置系统密码";
	  		return false;
  		}else{
  			return true;
  		}
	}
	},
  "layout": "anchor",
  "width": 280,
  "height": 162,
  "title": "设置密码",
  "footer": false,
  "modal": true,
  "iconCls": "widget-password",
  "html":formHTML
}
	);

	var window1, form1, oldpassword,password,repassword, button1, button2;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		window1 = EOS.getCmp('window1', _ns);
		form1 = EOS.getCmp('form1', _ns);
		oldpassword = EOS.getCmp('oldpassword', _ns);
		password = EOS.getCmp('password', _ns);
		repassword = EOS.getCmp('repassword', _ns);
		button1 = EOS.getCmp('button1', _ns);
		button2 = EOS.getCmp('button2', _ns);

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
 
// </script>