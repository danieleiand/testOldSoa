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
var haveSetBQQNumber = false;
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



var formHTML = "<form><table class='fuck' align='center' border='0' width='100%' height='100%' style='border-collapse: collapse;border:1px solid ##DDDDDD;background:#ffffff;padding-left:5px;'>"
				+ "<tr><td align='center' width='30%' style='height:25px;border:1px solid #DDDDDD;'>"
				+ "您的BQQ号码</td><td   style='height:25px;border:1px solid ##DDDDDD;border-right:none'>"+
			   "<input type='text' name='bqqnumber'/>"+
			   "<input type='radio' name='hasbqq' value='Y' checked='true'>有<input type='radio' name='hasbqq' value='S'>无</td></td>"+
			   "</tr>"+
			   "<tr><td colspan='2' align='center' style='height:25px;border:1px solid #DDDDDD;'>"+
			   "<span id='msgspan' style='color:red'>BQQ号码，请填写数字或字母的组合</span>"+
			   "</td></tr>"+
			   "<tr><td colspan='2'>绑定说明:</td></tr>"+
			   "<tr><td colspan='2'>由于SOA系统已和BQQ企业工具进行系统集成，在此请您输入您日常工作所使用的BQQ号码进行绑定，绑定后，有关SOA消息提醒将自动推送至BQQ上，如无BQQ账号，但因工作需要，请您在SOA中提交BQQ申请流程，由信息中心_体系管理组开通。</td></tr>"+
			   "<tr ><td colspan='2' align='right'>信息中心_体系管理组</td></tr>"+
			   "<tr><td colspan='2' align='center' style='height:30px;border:1px solid #DDDDDD;'>"+
			   "<input type='button' onclick='submit_bqq()' value='提交更改' style='background-color:#ffe57d;height:20px;BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 0px; BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid;'/>"+
			   "<input type='button' onclick='this_logout()' value='退出系统' style='background-color:#ffe57d;height:20px;BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 0px; BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid;'/>"+
			   "</td></tr>"+
			   "</table></form>";

	UIManager.register(
{
  "id": getNSValue('window2'),
  "xtype": "window",
  "haveSetBQQNumber":false,
  "listeners": {"beforeclose": function (){
  		if(!this.haveSetBQQNumber){
  			$id("msgspan").innerHTML = "请输入正确的BQQ号码";
	  		return false;
  		}else{
  			return true;
  		}
	}
	},
  "layout": "anchor",
  "width": 350,
  "height": 240,
  "title": "绑定BQQ号码",
  "footer": false,
  "modal": true,
  "iconCls": "widget-password",
  "html":formHTML
}
	);

	var window2, form1, bqqnumber,button1, button2;

   if ( __temp_isSubUI && _params!==undefined ){
   	initLoadParams.apply(this,[_params,_ns]);
   }
	var __loadFunc=function(){
		UIManager.renderAll();
		window2 = EOS.getCmp('window2', _ns);
		form1 = EOS.getCmp('form1', _ns);
		bqqnumber = EOS.getCmp('bqqnumber', _ns);
		//password = EOS.getCmp('password', _ns);
		//repassword = EOS.getCmp('repassword', _ns);
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