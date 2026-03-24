<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<script type="text/javascript" src="../../common/javascripts/checkpwdvail.js"></script>
<%
 	String contextPath = request.getContextPath();
   
	String skin=null;
    skin=CacheUtil.getUserStyle(session);
%>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/webui/ext/skins/<%=skin%>/css/portal.css" />

<script language="javascript">

function display(objimg,i,url)
	{
	
	    var objimg=objimg.getElementsByTagName("img")[0];
		if (i==1)
		{
		//onmouseover
		objimg.src=url;
		//objimg.className="imgcssonmouseover";
		}
		else
		{
		objimg.src=url;		
		//objimg.className="imgcss";		
		}
	}

function getAction(menuInfo)
{
	var action=menuInfo.appAction;
	if(!action) return;
     if(action.indexOf("/")==0)
	 {//绝对路径处理

	   //路径中不带contextPath
		  if(menuInfo.appName!=""&&menuInfo.appName!=null)
		   action="/"+menuInfo.appName+action;
	  }
	  else
	  if(action.indexOf("http")==0||action.indexOf("https")==0)
       {//完地址处理
	   return action;
	  }
	  else
	  {//相对路径处理
	  if(menuInfo.appName!=""&&menuInfo.appName!=null)
	   action="/"+menuInfo.appName+"/"+action;
	   else
       action="/"+action;


	  }
	 return menuInfo.url+action;

}

function js_openpage(systemId)
   {
   
   var menuInfo=menuInfos[systemId];
//0:在新窗口中打开
//1:在tab页面中打开
//2:在同一tab页面中打开
//3:切换树菜单

   var openUrl="";
 
   if(menuInfo.logintype!= 1)
	   {

	    openUrl=getAction(menuInfo);
	   	
	   }
   	else 
		   {
		   		openUrl ="<%=contextPath %>/portal/login/simlogin.jsp"; //用户映射的jsp页面
		   		var action = getAction(menuInfo);	
				openUrl = openUrl + "?action="+action;
		   }
   

   if(menuInfo.openMode==0 || menuInfo.openMode==1 || menuInfo.openMode==2)
	   {
	     //将皮肤信息传递给应用系统
	   var portalSkin = "<%=skin%>";
	   openUrl = openUrl+(openUrl.indexOf("?")==-1?"?":"&")+"portalSkin="+portalSkin+"&appid="+menuInfo.id;
	   
	   }

  
   if(menuInfo.openMode==0)
	   {
		var newwin=window.open(openUrl,"superwindowname","toolbar=no,resizable=yes,location=no,directories=no,status=no,menubar=no,scrollbars=yes,top="+(screen.availHeight-768)/2+",left="+(screen.availWidth-1024)/2+",width=1024,height=768");
		newwin.focus();
	   }
	   else
		   if(menuInfo.openMode==1)
		   {
		    window.top.portalUtil.showWindowOnTab(openUrl,menuInfo.appDisplayName);	  
		   }
			   else
			   if(menuInfo.openMode==2)
			   {
			      window.top.portalUtil.showWindowOnSameTab(openUrl,menuInfo.appDisplayName,systemId);	  
			 
			   }
				   else
					   if(menuInfo.openMode==3)
					   {
					   
					   window.top.portalUtil.showTree('mtree',menuInfo);
					   
					   
					   }
    }

function submit_bqq(){//此方法不用了
	var bqqnumber = $name("bqqnumber").value;
	var pass_window2 = Ext.getCmp("namespace10000_window2");
	var hasbqq;
	if(document.getElementsByName("hasbqq")[0].checked){
		hasbqq=document.getElementsByName("hasbqq")[0].value;
		
		if(isNull(bqqnumber)){
			$id("msgspan").innerHTML = "请输入正确的BQQ号码，数字或字母的组合";
	    	pass_window2.haveSetBQQNumber = false;
	    	return;
		}
		
		if(bqqnumber.length > 15){
			$id("msgspan").innerHTML = "请输入正确的BQQ号码，长度不能超过15位";
	    	pass_window2.haveSetBQQNumber = false;
	    	return;
		}
		
	}else{
		hasbqq = document.getElementsByName("hasbqq")[1].value;
	}
	
	
	$id("msgspan").innerHTML = "<font color='green'>验证通过</font>";
	
	if(!confirm("确认提交BQQ号码吗？")){
		return;
	}
	
	//alert(bqqnumber);
	var myajax = new Ajax("org.gocom.abframe.org.employee.EmpManager.updateEmployee.biz");
	myajax.addParam("employee/bqq", bqqnumber);
	myajax.addParam("employee/hasbqq", hasbqq);
	myajax.submit();
	
	var recode = myajax.getValue("root/data/recode");
	if(recode == 1){
		pass_window2.haveSetBQQNumber = true;
	    $id("msgspan").innerHTML = "<font color='green'>BQQ号码更新成功</font>";
	    pass_window2.close();
	}else{
		pass_window2.haveSetBQQNumber = false;
	    $id("msgspan").innerHTML = "<font color='red'>BQQ号码更新失败</font>";
	    //pass_window2.close();
	}
}  

//提交函数
function submit_form(){
 		var oldPwdValue = $name("oldpassword").value;
        var passValue = $name("newpassword").value;
        var rePassValue = $name("repassword").value;;
        var pass_window1 = Ext.getCmp("namespace10000_window1");
        
        if(null==oldPwdValue || oldPwdValue == ""){
        	$id("msgspan").innerHTML = "请输入原有密码";
        	pass_window1.haveSetPassword = false;
        	return;
        }
        /*
        if(!(passValue.length >=7 && passValue.length <=12 )){
        	$id("msgspan").innerHTML = "新密码长度必须在7-12个字符之间";
        	pass_window1.haveSetPassword = false;
        	return;
        }*/
        
        if (passValue == oldPwdValue){
				alert('新密码不得与原有密码一样'); 
				return;
		}
        
        var regStr_1 = /\d+/;
        var regStr_2 = /[a-zA-Z]+/;
        var reg_1 = passValue.match(regStr_1);
        var reg_2 = passValue.match(regStr_2);
        var checkresult = checkpwd(passValue);
        if('true'!=checkresult.flag){
        		$id("msgspan").innerHTML = ""+checkresult.msg;
	        	pass_window1.haveSetPassword = false;
	        	return;
        }
        else if(reg_1 == passValue || reg_2 == passValue){
        	$id("msgspan").innerHTML = "新密码，请填写数字、字母或符号的组合";
        	pass_window1.haveSetPassword = false;
        	return;
        }else{
        }
        
        if(passValue != rePassValue){
        	$id("msgspan").innerHTML = "两次输入密码不同，请重新输入";
        	pass_window1.haveSetPassword = false;
        	return;
        }
        
        $id("msgspan").innerHTML = "<font color='green'>验证通过</font>";
        
		if(!confirm("确认修改密码？")){
			return;
		}
		
			var url = "org.gocom.abframe.auth.PasswordManager.initPassword.biz";
			
			var myAjax = new Ajax(url);
			myAjax.addParam("newpass", passValue );
			myAjax.addParam("inputOldPwd", oldPwdValue );
			myAjax.submit();
			
			var returnNode = myAjax.getResponseXMLDom();
			
			if( returnNode ) {
				var returnmsg = myAjax.getValue("root/data/returnmsg");
				if( returnmsg == "1" ){
					pass_window1.haveSetPassword = true;
				    $id("msgspan").innerHTML = "<font color='green'>密码设置成功</font>";
				    //
				    pass_window1.close();
				    
				}else if(returnmsg == "-1"){
					pass_window1.haveSetPassword = false;
			    	$id("msgspan").innerHTML = "密码设置失败，请重试...";
				}else if(returnmsg == "-2"){
					pass_window1.haveSetPassword = false;
			    	$id("msgspan").innerHTML = "新密码与原密码相同";
				}else if(returnmsg == "-3"){
					pass_window1.haveSetPassword = false;
			    	$id("msgspan").innerHTML = "原密码输入有误";
				}else{
					pass_window1.haveSetPassword = false;
			    	$id("msgspan").innerHTML = "密码设置失败，请重试...";
				}
			}else{
				pass_window1.haveSetPassword = false;
				$id("msgspan").innerHTML = "密码设置失败，请重试...";
			}
}//end of submit_form
//退出系统
function this_logout(){
	window.location.href=getWebRoot()+"/cas.login?CASLOGOUT=true";
}
/*
获取手机校验码
*/
var m_seconds=180;//默认为180秒有效
var m_mobilecheckretuuid="xxxxxxxxM";//默认8个x加一个M 发送校验码后会产生一个 UUID,客户端需要进行提交比对,来获取比对的校验码用
var m_mobilenoChecked = false;//手机号码校验是否成功
var m_mobilenoChecked_uuid = false;//校验码 是否有
function getMobilenoCheckno(){
	var m_mobileno = document.getElementById("m_mobileno").value;
	if(m_mobileno==""||m_mobileno==null){
	alert("请填写手机号");
	return;
	}
	var myajax = new Ajax("com.yd.soa.comm.org.newCheckPhoneNumber.check_first.biz");	
	myajax.addParam("mobileNum", m_mobileno);
	myajax.addParam("source", "P2");
	myajax.addParam("type", "0");
	myajax.submit();
	
	var retcode = myajax.getValue("root/data/res_code");
	var result = myajax.getValue("root/data/result");
	var retuuid = myajax.getValue("root/data/retuuid");
	var retsxtime = myajax.getValue("root/data/retsxtime");
	m_mobilecheckretuuid = retuuid;
	m_seconds = retsxtime;//设置有效时间 秒
	if(retcode == "4"){
		document.getElementById("m_mobileno_span").innerHTML = "<font color='green'>验证码已发送</font>";
		document.getElementById("m_getcheckno_button").disabled="disabled";//有效期内 获取校验码按钮为 不可用		
		document.getElementById("m_mobileno").readOnly=true;
		m_mobilenoChecked_uuid = true;
		countSeconds();//执行计数
	}else{
		document.getElementById("m_mobileno_span").innerHTML = "<font color='green'>"+result+"</font>";
		m_mobilenoChecked_uuid = false;
		return;
	}
	
}
//验证码输入框鼠标事件
function check_mobilecheckno(obj){
	if(!obj){
		document.getElementById("m_mobileno_span").innerHTML = "<font color='red'>校验码不能为空</font>";		
		return false;
	}
	var m_mobileno = document.getElementById("m_mobileno").value;
	var mobileckno=obj.value;
	var myajax = new Ajax("com.yd.soa.comm.org.newCheckPhoneNumber.check_first.biz");
	myajax.addParam("type","1");
	myajax.addParam("mobileckno",mobileckno);
	myajax.addParam("mobileNum",m_mobileno);
	myajax.addParam("retuuid_rs",m_mobilecheckretuuid);//f9d2960a395046459baa2c51dd216c1e
	myajax.submit();
	var retcode = myajax.getValue("root/data/retcode");
	if(retcode == "3"){//成功之后
	m_mobilenoChecked=true;
    	document.getElementById("m_mobileno_spanck").innerHTML = "<font color='green'>验证码正确</font>";
	}else{
    	document.getElementById("m_mobileno_spanck").innerHTML="<font color='green'>验证码校验失败</font>";
    	m_mobilenoChecked=false;
	}
}
//倒计时秒
function countSeconds(){
  var c;
  	var m_disseconds_div = document.getElementById("m_disseconds_div");
  	if(m_disseconds_div==null || m_disseconds_div==undefined){
  		return;
  	}
	document.getElementById("m_disseconds_div").innerText ="校验码已经发送，还有("+m_seconds+")秒有效！";
	m_seconds = m_seconds-1;
	if(m_seconds<0){
		document.getElementById("m_getcheckno_button").disabled="";
		document.getElementById("m_mobileno").readOnly=false;
		return;
	}else{		
		c = setTimeout("countSeconds()",1000);
	}
}



//**************手机号 服务器端验证 mobileno
function checkServerMobileno(){
  var m_mobileno = document.getElementById("m_mobileno").value;
 var checktype = "mobileno";
 if(checktype=="mobileno"){ 	
 		var myajax = new Ajax("com.yd.soa.comm.org.empmgr.sendMobileCheckCode.biz");		
		myajax.addParam("mobileno", m_mobileno);
		myajax.addParam("type", "4");//只校验
		myajax.addParam("typevalue", "mobileno");//只校验 手机号码
		myajax.submit();
	
		var retcode = myajax.getValue("root/data/retcode");
		var retdata = myajax.getValue("root/data/retdata");
		if(retcode == "0"){
			document.getElementById("m_mobileno_span").innerHTML = "<font color='green'>手机号码验证有效</font>";
			m_mobilenoChecked=true;
		}else{
			document.getElementById("m_mobileno_span").innerHTML = "<font color='red'>手机号码验证失败，"+retdata+"</font>";			
			m_mobilenoChecked=false;
		}
 }else {
 	alert(checktype+",没有对该属性的后台校验！");
 	return;
 }
 
}

/*
手机号码提交
*/
function submit_mobile(){
	var windowmobile = Ext.getCmp("namespace10001_windowmobile");
	//--------------手机号码-------------
	var mobileno = $name("m_mobileno").value;//手机号码	
	var ismsgwarn;//短信提醒
	/* 注释掉校验码
	if(!checkmobileNo()){//校验手机号码
		return;
	}
	
	var m_mobilenocheck = $name("m_mobilenocheck").value;
	if(	!m_mobilenoChecked_uuid){
		Ext.Msg.alert("警告","手机验证码还未生成!");
		return;
	}
	
	if(m_mobilenocheck==""){
		Ext.Msg.alert("警告","手机验证码必填!");
		return;
	}
	*/
	
	
	
	if(!m_mobilenoChecked){
		$id("m_msgspan").innerHTML = "<font color='red'>验证失败，请检查信息，重新发起验证</font>";	
		return;
	}else
	{
	$id("m_msgspan").innerHTML = "<font color='green'>验证通过</font>";	
	}
	
	if(document.getElementsByName("m_ismsgwarn")[0].checked){//手机号码校验通过后才考虑 短信提醒
		ismsgwarn=document.getElementsByName("m_ismsgwarn")[0].value;
	}else{
		ismsgwarn = document.getElementsByName("m_ismsgwarn")[1].value;
	}
	
	//---------------BQQ------------------
	
	var bqqnumber = $name("m_bqqnumber").value;//BQQ
	var hasbqq;
	if(document.getElementsByName("m_hasbqq")[0].checked){
		hasbqq=document.getElementsByName("m_hasbqq")[0].value;
		if(bqqnumber==""){
			$id("m_msgspan").innerHTML = "<font color='red'>错误：当BQQ选择为有时，BQQ号码为必填!</font>";
		}
		if(!checkBqqNo()) return;
		
	}else{
		hasbqq = document.getElementsByName("m_hasbqq")[1].value;
	}
	
	
	
	//if(!confirm("确认要提交绑定的手机、BQQ号码吗？")){
	//	return;
	//}
	
	Ext.Msg.confirm('系统提示','确认要提交绑定的手机号码吗？',
	     function(btn){
		        if(btn=='yes'){
		              var myajax = new Ajax("com.yd.soa.comm.org.empmgr.updateEmpMobile.biz");	
						myajax.addParam("mobileno", mobileno);
						myajax.addParam("ismsgwarn", ismsgwarn);
						myajax.addParam("bqqnumber", bqqnumber);	
						myajax.addParam("hasbqq", hasbqq);
						myajax.addParam("clientuuid", m_mobilecheckretuuid);//校验码唯一标示
						/* 注释掉校验码
						myajax.addParam("mobileckno", m_mobilenocheck);//手机校验码
						*/
						myajax.submit();
						
						var retcode = myajax.getValue("root/data/retcode");
						if(retcode == 0){
							$name("m_submit_mobile").disabled="disabled";//设置提交按钮不可用
							windowmobile.haveSetMobile = true;
						    $id("m_msgspan").innerHTML = "<font color='green'>手机、BQQ号码更新成功</font>";
						    setTimeout("windowmobileclose()",2000);//2秒钟后关闭此窗口
						}else{
							windowmobile.haveSetMobile = false;
						    $id("m_msgspan").innerHTML = "<font color='red'>错误：手机、BQQ号码更新失败</font>";
						    //windowmobile.close();
						}
		         }else{}
	         },this);
}//end of submit_mobile
function windowmobileclose(){
	var windowmobile = Ext.getCmp("namespace10001_windowmobile");
	windowmobile.close();
}
function checkHasNoBqq(){//无BQQ
	$name("m_bqqnumber").value="";
	$id("m_msgspan").innerHTML = "<font color='red'>提示：BQQ号码选择为无时，不需要填写!</font>";
}
function checkBqqNo(){//校验BQQ号码
	var bqqnumber = $name("m_bqqnumber").value;
	if(document.getElementsByName("m_hasbqq")[0].checked){//有BQQ时
		if(bqqnumber==""){
			$id("m_msgspan").innerHTML = "<font color='red'>错误：当BQQ选择为有时，BQQ号码为必填!</font>";
		}else{
			if(!/^[1-9]\d*/g.test(bqqnumber)){
			$id("m_msgspan").innerHTML = "<font color='red'>错误：BQQ号码填写有误,必须为整数且小于15位!</font>";
				return false;
			}else{
				if(bqqnumber.length > 15){
					$id("m_msgspan").innerHTML = "<font color='red'>错误：BQQ号码填写有误,必须为整数且小于15位!</font>";
					return false;
				}else{
					$id("m_msgspan").innerHTML = "<font color='red'>提示信息<br>手机号码：请填写有效的手机号码&nbsp;&nbsp;&nbsp;&nbsp;<br>BQQ号码：请填写正整数且小于15位</font>";
					return true;
				}
			}
		}
	}else{//无BQQ时
		$name("m_bqqnumber").value="";
		$id("m_msgspan").innerHTML = "<font color='red'>提示：BQQ号码选择为无时，不需要填写!</font>";
		return false;
	}
}
/*
//校验手机号码 客户端校验
*/
function checkmobileNo(){
	var mobileno = $name("m_mobileno").value;
	if(mobileno==""){
		m_mobilenoChecked=false;
		return false;
	}else{
		if(isMobel(mobileno)){//有效手机号码
			$id("m_mobileno_span").innerHTML = "<font color='green'>号码格式有效</font>";
			m_mobilenoChecked = true;
			return true;
		}else{
			$id("m_mobileno_span").innerHTML = "<font color='red'>号码格式无效</font>";
			m_mobilenoChecked = false;
			return false;
		}
	}
}
//核心提示：手机号码验证，验证13系列和150-159(154除外)、180、185、186、187、188、189几种号码，长度11位
/**
*	2015-10-10 改为 业务字段配 手机号 正则表达式 如果没配沿用老的方式
*	移动至common/javascripts/common.js
* 下次再改此方法 可删除 这个方法 用 common.js  现在不删除是防止 common.js 缓存在用户浏览器中 没有更新导致校验失败
*/
function isMobel(value){
	var mobileReg = /<%=BusinessDictUtil.getDictName("YD_REGULAR_EXPRESSION","moblie") %>/;
	 if(null != mobileReg && undefined != mobileReg){
		if(mobileReg.test(value)){ return true; }
		else{ return false; }
	 }else{
	 	if(/^13\d{9}$/g.test(value)||(/^14\d{9}$/g.test(value))||(/^15\d{9}$/g.test(value))|| (/^18\d{9}$/g.test(value))) 
		{ return true; }
		else{ return false; }
	 }
}

</script>
<style>

.imgcss{
	width: 15px;
	height: 15px;
}
a:link{
text-decoration:none;
color:#3B6109;
}
a:hover
{
text-decoration:none;
color:#3b6109;
font-weight:800;
}
a:visited
{
text-decoration:none;
color:#3B6109;
}

.txtcssonmouseover{font-size:9pt;color:#3b6109;font-weight:800}
.txtcss{font-size:9pt;color:#3b6109;}
td{font-size:9pt;color:#000000;}
</style>
<!--  
<DIV id=img1 style="Z-INDEX: 100; LEFT: 2px; WIDTH: 200px; POSITION: absolute; TOP: 43px; HEIGHT: 140px;
 visibility: visible;">
 	<div onmouseover="pause_resume();" onmouseout="pause_resume();" style="width:100%;">
 		 <div style="z-index: 999;position: relative;margin-bottom: -16px;width:100%;" align="right" onclick="closeDiv();">
 			<img src="../../portal/adimage/cross.png" width="15" height="15" border="0"  />
 		</div>
 		<div style="z-index: 100;position: absolute;">
 		    <a href="http://www.yundaex.com/" target="_blank"><img src="../../portal/adimage/div_banner.jpg" width="200" height="140" border="0" ></a>
 	    </div>
 	   
 	</div>
 	
 	
 </DIV>
<script type="text/javascript" src="<%=contextPath%>/portal/js/ad_pop.js"></script>-->