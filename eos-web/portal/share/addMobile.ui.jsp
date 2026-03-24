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
var haveSetMobile = true;
var __temp_ns = __temp_ns|| '';
var __temp_params = __temp_params|| null;
var __temp_parent = __temp_parent|| null;
var __temp_ui = null;
var __temp_isSubUI = __temp_isSubUI|| false;
__temp_ui = (function(_ns,_params,_parent){
	//_ns = _ns || (window.isDesigning?'':EOS.DEFAULT_NAMESPACE);
	
	_ns = "namespace10001";
	
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

var formHTML = "<form><table class='' align='center' border='0' width='100%' height='100%' style='border-collapse: collapse;border:1px solid ##DDDDDD;background:#ffffff;padding-left:5px;'>"+
		"<tr>"+
			  "<td align='center' width='30%' style='height:25px;border:none'>"+ "您的手机号码：</td>"+
			  "<td  width='30%' style='height:25px;border:1px solid ##DDDDDD;border-right:none'>"+
			   "<input type='text' name='m_mobileno' value='"+m_mobileno_value+"'/></td>"+
			   "<td   style='height:25px;border:1px solid ##DDDDDD;border-right:none'>"+
			   "&nbsp;<font style='color:red'>*</font>&nbsp;&nbsp;<span id='m_mobileno_span' style='color:red'>号码必填</span></td>"+
	"</tr><tr>"+
	"<td align='center' style='height:25px;border:none'></td>"+
	"<td colspan='2' style='height:25px;border:none'>"+
	"<table><tr><td><button type='button' id='m_getcheckno_button' onclick='javascript:getMobilenoCheckno();'>获取验证码</button></td>"+
	"<td><div id='m_disseconds_div' align='left'>&nbsp;&nbsp;点击获取校验码！</div></td></tr></table>"+
	"</td>"+
	"</tr><tr>"+   
	"<td align='center' width='30%' style='height:25px;border:none'>"+ "手机验证码：</td>"+
	"<td  width='30%' style='height:25px;border:1px solid ##DDDDDD;border-right:none'>"+
	"<input type='text' name='m_mobilenocheck' value=''  onblur='javascript:check_mobilecheckno(this);'/></td>"+
	 "<td   style='height:25px;border:1px solid ##DDDDDD;border-right:none'>"+
	 "&nbsp;<font style='color:red'>*</font>&nbsp;&nbsp;<span id='m_mobileno_spanck' style='color:red'>验证码必填</span></td>"+
		 "</tr>"+
		 "<span id='m_msgspan' style='color:red'></span>"+
		 "<span id='m_ismsgwarn' name= 'm_ismsgwarn' style='color:red'></span>"+ 
		 "<tr><td colspan='3' style='height:30px;border:1px solid ;'>绑定说明:</td></tr>"+
		 "<tr><td colspan='3' style='height:10px;border:1px solid ;'>【手机】已开通手机找回OA密码功能，请绑定的您的手机号码。</td></tr>"+
		 "<tr ><td colspan='3' align='right' style='height:10px;border:1px solid ;'></td></tr>"+
		 "<tr><td colspan='3' align='center' style='height:30px;border:1px solid #DDDDDD;'>"+
			   "<input type='button' name='m_submit_mobile' onclick='submit_mobile()' value='提交更改' style='background-color:#ffe57d;height:20px;BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 0px; BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid;'/>"+
			   "<input type='button' onclick='this_logout()' value='退出系统' style='background-color:#ffe57d;height:20px;BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 0px; BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid;'/>"+
		 "</td></tr></table></form>";

<%--	UIManager.register(
	{
	  "id": getNSValue('windowmobile'),
	  "xtype": "window",
	  "haveSetMobile":true,
	  "listeners": {"beforeclose": function (){
	  		if(!this.haveSetMobile){
	  			$id("m_msgspan").innerHTML = "手机号码必须和SOA登陆账号进行绑定";
		  		return false;
	  		}else{
	  			return true;
	  		}
		}
		},
	  "layout": "anchor",
	  "width": 450,
	  "height": 400,
	  "title": "绑定手机号码",
	  "footer": false,
	  "modal": true,
	  "iconCls": "widget-password",
	  "html":formHTML
	}
	);--%>

	var windowmobile;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		windowmobile = EOS.getCmp('windowmobile', _ns);
		//form1 = EOS.getCmp('form1', _ns);
		//m_bqqnumber = EOS.getCmp('m_bqqnumber', _ns);
		//password = EOS.getCmp('password', _ns);
		//repassword = EOS.getCmp('repassword', _ns);
		//button1 = EOS.getCmp('button1', _ns);
		//button2 = EOS.getCmp('button2', _ns);

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
 var useridLength = m_userid_value.length;
 var useridEnd3Value = m_userid_value.substring(useridLength-3,useridLength);
 if(useridLength > 8 && useridEnd3Value == "001"){
 	//var m_mobile = document.getElementById("m_mobileno");
 	//m_mobile.disabled = true;
 	var wdCode = m_userid_value.substring(0,6);
 	if(useridLength>=11){
 		var wdCode = m_userid_value.substring(0,useridLength-3);
 	}
 	try{
 		var mAjax = new Ajax("com.yd.soa.wd.wdMaintain.queryWdByOrgId.biz");
		mAjax.addParam("wdCode",wdCode);
		mAjax.submit();	
		var persontell = mAjax.getValue("root/data/persontell");
		if(null != persontell){
			m_mobile.value = persontell;
		}else{
			m_mobile.value ="";
		}
 	}catch(e){}
 }

// </script>