<%@ taglib uri="http://eos.primeton.com/tags/html" prefix="h"%>
<%@ page session="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://eos.primeton.com/tags/dict" prefix="d"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%
//防御XXE攻击
DocumentBuilderFactory dbf =DocumentBuilderFactory.newInstance();
dbf.setExpandEntityReferences(false);

//TODO 如果要设置客户端缓存页面，注释以下三行
response.setHeader("Pragma","No-Cache"); 
response.setHeader("Cache-Control","No-Cache");
response.setHeader("Content-Type", "text/html; charset=utf-8");
response.setDateHeader("Expires",   0);
String soadomain = com.yd.soa.comm.PropertiesCacheUtil.getKey("com.yd.soa.SOADOMAIN","soa.yundasys.com:30088");//获取soa的地址
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta name="renderer" content="ie-comp"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录-韵达SOA统一平台_密码找回</title>

<script type="text/javascript">
	var contextPath = "<%=request.getContextPath()%>";
</script>

<link href="/ydsoa/portal/css/base.css" type="text/css" rel="stylesheet" >
<link href="/ydsoa/portal/css/global.css" type="text/css" rel="stylesheet" >
<h:script src="/common/scripts/eos-web.js"></h:script>
<h:script src="/common/javascripts/zh_CN/message.js"></h:script>
<h:script src="/ydsoacomm/jquery/jquery-1.7.2.min.js"/>
<h:script src="/common/javascripts/checkpwdvail.js"/>
<style>
/*** topbar按钮和文字风格 ***/
.m_topbar {
	font-size: 12px;
	color: #333333;
	background-color: #ffcc00;
	background-image: url(/ydsoa/webui/ext/skins/default/images/yunda_logo.png);
	background-repeat:no-repeat;
	background-position: 15px 4px;
	height: 50px;
}
.m_content {
	font-size: 12px;	
	background-image: url(/ydsoa/portal/images/soa_normal.png);
	height: 700px;
}
.u17_container {
    position:absolute;
    left:610px;
    top:255px;
    width:34px;
    height:33px;
}

#u17_img {
    position:absolute;
    left:0px;
    top:0px;
    width:34px;
    height:33px;
}
.u17_normal {
    background-image: url('/ydsoa/portal/images/soa_phone.png');
}

.u18_container {
    position:absolute;
    left:945px;
    top:255px;
    width:34px;
    height:33px;
}

#u18_img {
    position:absolute;
    left:0px;
    top:0px;
    width:34px;
    height:33px;
}
.u18_normal {
    background-image: url('/ydsoa/portal/images/mobile_icon.png');
}
  
.u19_container {
    position:absolute;
    left:1130px;
    top:140px;
    width:260px;
    height:260px;
}

#u19_img {
    position:absolute;
    left:0px;
    top:0px;
    width:260px;
    height:260px;
}
.u19_normal {
    background-image: url('/ydsoa/portal/images/mobile_recovery.png');
}
    
    
.u8 {
    position:absolute;
    left:668px;
    top:261px;
    width:150px;
    height:19px;
    ;
    ;
    ;
    font-family:Arial;
    text-align:left;
    word-wrap:break-word;
}

.u10_normal {
    background-image: url('/ydsoa/portal/images/soa_shensu.png');
}

.u10_container {
    position:absolute;
    left:708px;
    top:500px;
    width:16px;
    height:16px;
}

#u10_img {
    position:absolute;
    left:0px;
    top:0px;
    width:16px;
    height:16px;
}
.u9 {
    position:absolute;
    left:450px;
    top:500px;
    width:260px;
    height:19px;
    ;
    ;
    ;
    font-family:Arial;
    text-align:left;
    word-wrap:break-word;
}
.u12 {
    position:absolute;
    left:740px;
    top:500px;
    width:150px;
    height:19px;
    ;
    ;
    ;
    font-family:Arial;
    text-align:left;
    word-wrap:break-word;
}



.u7 {
    position:absolute;
    left:421px;
    top:144px;
    width:510px;
    height:19px;
    ;
    ;
    ;
    font-family:Arial;
    text-align:left;
    word-wrap:break-word;
}

.u28 {
    position:absolute;
    left:460px;
    top:210px;
    width:510px;
    height:19px;
    ;
    ;
    ;
    font-family:Arial;
    text-align:left;
    word-wrap:break-word;
}

.u29 {
    position:absolute;
    left:460px;
    top:251px;
    width:370px;
    height:19px;
    font-family:Arial;
    text-align:left;
    word-wrap:break-word;
}

.u210 {
    position:absolute;
    left:460px;
    top:340px;
    width:600px;
    height:19px;
    font-family:Arial;
    text-align:left;
    word-wrap:break-word;
}


.u213_line {
    position:absolute;
    left:0px;
    top:4px;
    width:265px;
    height:3px;
    background-image: url('/ydsoa/portal/images/soa_line.png');
}

.u213 {
    position:absolute;
    left:666px;
    top:357px;
    width:265px;
    height:10px;
    
}

.u13 {
    position:absolute;
    left:1000px;
    top:261px;
    width:150px;
    height:19px;
    ;
    ;
    ;
    font-family:Arial;
    text-align:left;
    word-wrap:break-word;
}

.tdf01{color:#aaa;}

</style>
<script type="text/javascript">
jQuery.noConflict();
//校验码生成------------begin
var objnew;
VerifyCode.prototype.initImg=function()
{	
	
	this.codeImage=$create("img");
	this.container.appendChild(this.codeImage);
	this.codeImage.style.verticalAlign="text-bottom";
	this.codeImage.style.marginLeft="6px";
	this.codeImage.title=VERIFYCODETITLE;
	this.codeImage.setAttribute('id', 'setId');
  this.imageUrl=contextPath+"/codeImage.cimg?name="+this.config.name+"&imageHeight="+this.config.imageHeight+"&length="+this.config.length+"&type="+this.config.type;
 	this.codeImage.src=this.imageUrl;
    var obj=this;
    objnew=this;
    eventManager.add(this.codeImage,"click",function(){
	    return function(){
	    	this.codeImage.src=this.imageUrl+"&timestamp="+Math.random()
	    }.call(obj)
    });
}
VerifyCode.prototype.initInput=function()
{	
	//隐含输入框
}
//校验码生成------------end

//***********跳转首页函数********************
function loginsoa(){
	window.location.href="http://<%=soadomain%>/ydsoa/cas.login?CASLOGOUT=true";
}

//**********点击手机找回密码  跳转到step2*************
function zhaohui(){
	document.getElementById("step1").style.display="none";
	document.getElementById("step2").style.display="block";
    document.getElementById("step3").style.display="none";
    document.getElementById("step4").style.display="none";
    document.getElementById("step_rg").style.display="none";
}

//**********验证码校验成功后 点击下一步。跳转到step3*******
function checkNoAndNext(){
	document.getElementById("step1").style.display="none";	
    document.getElementById("step4").style.display="none";
    document.getElementById("step_rg").style.display="none";    
    
    var m_empcode = document.getElementById("m_empcode").value;
	var m_empname = document.getElementById("m_empname").value;
	var m_mobileno = document.getElementById("m_mobileno").value;
	var m_mobilecheckno = document.getElementById("m_mobilecheckno").value;
	
  //document.getElementById("step2").style.display="none";
  //document.getElementById("step3").style.display="block";
  //return; //调试时 可以把这三行开启 直接进入下一步
    	
	if(!checkempcode(document.getElementById("m_empcode"))){
		return;
	}
	if(!checkempname(document.getElementById("m_empname"))){
		return;
	}
	//if(!checkmobileno(document.getElementById("m_mobileno"))){
	//	return;
	//}
	if(m_retuuid=="xxxxxxxx"){
		document.getElementById("m_disseconds_div").innerHTML = "<font color='red'>未生成校验码！</font>";
		return;
	}
	if(!checkmobilecheckno(document.getElementById("m_mobilecheckno"))){
		return;
	}
	var myajax = new Ajax("com.yd.soa.comm.org.empmgr.resetPaswdByMobileCheckCode.biz");
	myajax.addParam("userid", m_empcode);
	myajax.addParam("username", m_empname);
	myajax.addParam("mobileno", m_mobileno);	
	myajax.addParam("clientuuid", m_retuuid);//f9d2960a395046459baa2c51dd216c1e
	//myajax.addParam("clientuuid", "f9d2960a395046459baa2c51dd216c1e");
	myajax.addParam("mobileckno", m_mobilecheckno);
	myajax.addParam("type", "1");
	myajax.submit();
	
	var retcode = myajax.getValue("root/data/retcode");
	var retdata = myajax.getValue("root/data/retdata");
	if(retcode == "0"){//成功之后
		document.getElementById("step2").style.display="none";
    	document.getElementById("step3").style.display="block";
	}else{
		document.getElementById("step2").style.display="block";
    	document.getElementById("step3").style.display="none";
    	document.getElementById("m_dismobilecheckno_span").innerText=retdata;
	}
}

//************密码找回 最后的提交,调转到step4***************
function submitpswd(){
   
    var m_empcode = document.getElementById("m_empcode").value;
	var m_empname = document.getElementById("m_empname").value;
	var m_mobileno = document.getElementById("m_mobileno").value;
	var m_mobilecheckno = document.getElementById("m_mobilecheckno").value;
    //var  verifycode = document.getElementById("m_verifycode").value;
    var  m_newpswd1 = document.getElementById("m_newpswd1").value;
    
    if(!checkpswd1(document.getElementById("m_newpswd1"))){
		return;
	}
	if(!checkpswd2(document.getElementById("m_newpswd2"))){
		return;
	}
	if(!checkverifycode(document.getElementById("m_verifycode"))){
		return;
	}
	  
	var myajax = new Ajax("com.yd.soa.comm.org.empmgr.resetPaswdByMobileCheckCode.biz");
	myajax.addParam("userid", m_empcode);
	myajax.addParam("username", m_empname);
	myajax.addParam("mobileno", m_mobileno);	
	myajax.addParam("clientuuid", m_retuuid);//
	myajax.addParam("mobileckno", m_mobilecheckno);//校验码
	myajax.addParam("pswd", m_newpswd1);//密码
	myajax.addParam("type", "3");//给工号设置密码
	myajax.submit();
	
	var retcode = myajax.getValue("root/data/retcode");
	var retdata = myajax.getValue("root/data/retdata");
	if(retcode == "0"){//成功之后
		alert("密码找回成功！");
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="block";
		document.getElementById("step_rg").style.display="none";
	}else{
    	alert("密码找回失败！");
	}
	
	
    
}
//**********点击 账号申诉 跳转到step_rg
function shensu(){
    document.getElementById("step1").style.display="none";
	document.getElementById("step2").style.display="none";
    document.getElementById("step3").style.display="none";
    document.getElementById("step4").style.display="none";
    document.getElementById("step_rg").style.display="block";   
}

//***********点击 获取验证码 *******************
function getCheckNo(){
	var m_empcode = document.getElementById("m_empcode").value;
	var m_empname = document.getElementById("m_empname").value;
	var m_mobileno = document.getElementById("m_mobileno").value;
	
	if(!empcodeChecked || !empnameChecked || !mobilenoChecked){
		alert("手机号校验成功后才能获取验证码!");
		return;
	}
	
	var myajax = new Ajax("com.yd.soa.comm.org.empmgr.sendMobileCheckCode.biz");
	myajax.addParam("userid", m_empcode);
	myajax.addParam("username", m_empname);
	myajax.addParam("mobileno", m_mobileno);
	myajax.addParam("type", "2");
	myajax.submit();
	
	var retcode = myajax.getValue("root/data/retcode");
	var retdata = myajax.getValue("root/data/retdata");
	var retuuid = myajax.getValue("root/data/retuuid");
	var retsxtime = myajax.getValue("root/data/retsxtime");
	if(retcode == "0"){
		document.getElementById("m_getcheckno_button").disabled="disabled";//有效期内 获取校验码按钮为 不可用
		document.getElementById("m_empcode").readOnly=true;
		document.getElementById("m_empname").readOnly=true;
		document.getElementById("m_mobileno").readOnly=true;
		
		m_seconds = retsxtime;//设置有效时间 秒
		//m_seconds = 30;//设置有效时间 秒	
		m_retuuid = retuuid;
		countSeconds();//执行计数
	}else{
		alert(retdata);
	}
	
}

var m_seconds=180;//默认为180秒有效
var m_retuuid="xxxxxxxx";//默认8个x 发送校验码后会产生一个 UUID,客户端需要进行提交比对,来获取比对的校验码用
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
		document.getElementById("m_empcode").readOnly=false;
		document.getElementById("m_empname").readOnly=false;
		document.getElementById("m_mobileno").readOnly=false;
		return;
	}else{		
		c = setTimeout("countSeconds()",1000);
	}
}
//**************工号 、姓名、手机号 服务器端验证  empcode,empname,mobileno
function checkServer(checktype){
  var m_empcode = document.getElementById("m_empcode").value;
  var m_empname = document.getElementById("m_empname").value;
  var m_mobileno = document.getElementById("m_mobileno").value;

 if(checktype=="empcode"){
 	var myajax = new Ajax("com.yd.soa.comm.org.empmgr.sendMobileCheckCode.biz");
	myajax.addParam("userid", m_empcode);
	myajax.addParam("type", "1");//只校验
	myajax.addParam("typevalue", "empcode");//只校验 工号
	myajax.submit();
	
	var retcode = myajax.getValue("root/data/retcode");
	var retdata = myajax.getValue("root/data/retdata");
	if(retcode == "0"){
		document.getElementById("m_disempcode_span").innerHTML = "<font color='green'>工号验证有效</font>";
		empcodeChecked=true;
	}else{
		document.getElementById("m_disempcode_span").innerHTML = "<font color='red'>工号验证失败，"+retdata+"</font>";
		document.getElementById("m_empcode").style.color='#aaa';
		empcodeChecked=false;
	}	
 }else if(checktype=="empname"){
 	if(!empcodeChecked){
 		alert("请先校验工号");
 		document.getElementById("m_empname").value = document.getElementById("m_empname").defaultValue;
 		document.getElementById("m_empname").style.color='#aaa';
 		document.getElementById("m_disempname_span").innerHTML ="";
 		empnameChecked=false;
 		return;
 	}else{
 		var myajax = new Ajax("com.yd.soa.comm.org.empmgr.sendMobileCheckCode.biz");
		myajax.addParam("userid", m_empcode);
		myajax.addParam("username", m_empname);
		//myajax.addParam("mobileno", m_mobileno);
		myajax.addParam("type", "1");//只校验
		myajax.addParam("typevalue", "empname");//只校验 员工姓名
		myajax.submit();
	
		var retcode = myajax.getValue("root/data/retcode");
		var retdata = myajax.getValue("root/data/retdata");
		if(retcode == "0"){
			document.getElementById("m_disempname_span").innerHTML = "<font color='green'>姓名验证有效</font>";
			if(retdata==null){//ydsoa/portal/login/mimazhaohui.jsp
				<%--alert("您的账号未绑定手机 请联系管理员魏志广");--%>
				if(m_empcode.length == 8){
					alert("您的账号未绑定手机号,手机号信息来源EHR系统，请联系人事!");
				}else{
					var m_empcode_new = m_empcode.substring(m_empcode.length-3,m_empcode.length);
					if(m_empcode_new == "001" && m_empcode.length > 8){
						alert("您的账号未绑定手机号,请联系网点管理部!");
					}else{
						alert("您的账号未绑定手机号,请联系001账号!");
					}
				}
				
			}else{//自动带出手机号
				document.getElementById("m_dismobileno_span").value=retdata.substring(0,3)+"****"+retdata.substring(7,11);
				document.getElementById("m_mobileno").value=retdata;
				mobilenoChecked=true;
			}
			empnameChecked=true;
		}else{
			document.getElementById("m_disempname_span").innerHTML = "<font color='red'>姓名验证失败，"+retdata+"</font>";
			document.getElementById("m_empname").style.color='#aaa';
			empnameChecked=false;
		}	
 	}
 }else if(checktype=="mobileno"){
 	 if(!empcodeChecked||!empnameChecked){
 		alert("请先校验工号和姓名");
 		document.getElementById("m_mobileno").value = document.getElementById("m_mobileno").defaultValue;
 		document.getElementById("m_mobileno").style.color='#aaa';
 		document.getElementById("m_dismobileno_span").innerHTML ="";
 		mobilenoChecked=false;
 		return;
 	}else{
 		var myajax = new Ajax("com.yd.soa.comm.org.empmgr.sendMobileCheckCode.biz");
		myajax.addParam("userid", m_empcode);
		myajax.addParam("username", m_empname);
		myajax.addParam("mobileno", m_mobileno);
		myajax.addParam("type", "1");//只校验
		myajax.addParam("typevalue", "mobileno");//只校验 手机号码
		myajax.submit();
	
		var retcode = myajax.getValue("root/data/retcode");
		var retdata = myajax.getValue("root/data/retdata");
		if(retcode == "0"){
			document.getElementById("m_dismobileno_span").innerHTML = "<font color='green'>手机号码验证有效</font>";
			mobilenoChecked=true;
		}else{
			document.getElementById("m_dismobileno_span").innerHTML = "<font color='red'>手机号码验证失败，"+retdata+"</font>";
			document.getElementById("m_mobileno").style.color='#aaa';
			mobilenoChecked=false;
		}	
 	}
 }else {
 	alert(checktype+",没有对该属性的后台校验！");
 	return;
 }
 
}

//----------校验输入框--------------
//-------手机号码
var mobilenoChecked = false;//手机号码前端是否校验
function checkmobileno(obj){//校验手机号码
	var mobileno = document.getElementById("m_mobileno").value;
	if(mobileno==""||mobileno==document.getElementById("m_mobileno").defaultValue){
		document.getElementById("m_dismobileno_span").innerHTML = "<font color='red'>手机号码不能为空</font>";
		m_onblur(obj);
		mobilenoChecked = false;
		return false;
	}else{
		if(isMobel(mobileno)){//有效手机号码
			document.getElementById("m_dismobileno_span").innerHTML = "<font color='green'>手机号码有效</font>";
			mobilenoChecked=true;
			return true;
		}else{
			document.getElementById("m_dismobileno_span").innerHTML = "<font color='red'>手机号码无效</font>";
			m_onblur(obj);
			mobilenoChecked=false;
			return false;
		}
	}
}
//核心提示：手机号码验证，验证13系列和150-159(154除外)、180、185、186、187、188、189几种号码，长度11位
/* 2015-10-10 移动至common/javascripts/common.js
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



//--------工号
var empcodeChecked =false;//工号前端是否校验
function checkempcode(obj){
	var empcode = document.getElementById("m_empcode").value;
	if(empcode==""||empcode==document.getElementById("m_empcode").defaultValue){
		document.getElementById("m_disempcode_span").innerHTML = "<font color='red'>工号不能为空</font>";
		m_onblur(obj);
		empcodeChecked=false;
		return false;
	}else{
	 <%--if(empcode.length==8){
	 	document.getElementById("m_disempcode_span").innerHTML = "<font color='red'>手机号信息来源EHR系统，请联系人事!</font>";
	 	m_onblur(obj);
		empcodeChecked=false;
		return false;
	 }--%>
	 if(/^\d+$/.test(empcode)&&(empcode.length==8||empcode.length==9||empcode.length==11)){//有效工号
			document.getElementById("m_disempcode_span").innerHTML = "<font color='green'>工号格式有效</font>";
			empcodeChecked=true;
			return true;
		}else{
			document.getElementById("m_disempcode_span").innerHTML = "<font color='red'>工号格式无效</font>";
			m_onblur(obj);
			empcodeChecked=false;
			return false;
		}
	}
}



//---------姓名
var empnameChecked =false;//姓名前端是否校验
function checkempname(obj){
	var empname = document.getElementById("m_empname").value;
	if(empname==""||empname==document.getElementById("m_empname").defaultValue){
		document.getElementById("m_disempname_span").innerHTML = "<font color='red'>姓名不能为空</font>";
		m_onblur(obj);
		return false;
	}else{
	 if(/^[\u0391-\uFFE5\u002e\w]+$/.test(empname)||/^[\u4e00-\u9fa5]+·[\u4e00-\u9fa5]+$/.test(empname)){//解决新疆老铁名字中的特殊符号
			document.getElementById("m_disempname_span").innerHTML = "<font color='green'>姓名格式有效</font>";
			getMobile();//获取手机号
			return true;
		}else{
			document.getElementById("m_disempname_span").innerHTML = "<font color='red'>姓名格式无效</font>";
			m_onblur(obj);
			return false;
		}
	}
}
//根据工号、姓名获取显示手机号前3位和后4位，中间用星号代替
function getMobile(){
	
}
//----手机校验码
function checkmobilecheckno(obj){
	var mobilecheckno = document.getElementById("m_mobilecheckno").value;
	if(mobilecheckno==""||mobilecheckno==document.getElementById("m_mobilecheckno").defaultValue){
		document.getElementById("m_dismobilecheckno_span").innerHTML = "<font color='red'>校验码不能为空</font>";
		m_onblur(obj);
		return false;
	}else{
	 if(!/^\d$/.test(mobilecheckno)&&(mobilecheckno.length==6)){//
			document.getElementById("m_dismobilecheckno_span").innerHTML = "<font color='green'>校验码格式有效</font>";
			return true;
		}else{
			document.getElementById("m_dismobilecheckno_span").innerHTML = "<font color='red'>校验码格式无效</font>";
			m_onblur(obj);
			return false;
		}
	}
}
//----密码输入校验
/**
*校验字符串是否只由英文字母和数字组成
*验证通过返回true,否则返回false
**/
function isNumberOrLetter_(str)
{
    if(typeof(str)=="object") str=str.value;
    if(str=="") return false;
    
    var ss1= str.replace(/[(a-z)*(A-Z)]/g, "");
		if(str.length == ss1.length) {
		 	return false;
		}
		var ss2= ss1.replace(/[(0-9)*]/g, "");
		if(ss2.length == ss1.length) {
			 return false;
		} else if(ss2.length != 0) {
			 return false;
		}
		return true;
}
function checkpswd1(obj){
	var  newpswd1 = document.getElementById("m_newpswd1").value;
	if(newpswd1==""||newpswd1==document.getElementById("m_newpswd1").defaultValue){
		document.getElementById("m_disnewpswd1_span").innerHTML = "<font color='red'>密码不能为空</font>";
		m_onblur(obj);
		return false;
	}else{
	
			var checkresult = checkpwd(newpswd1);
        	if('true'!=checkresult.flag){
	        	document.getElementById("m_disnewpswd1_span").innerHTML = "<font color='red'>"+checkresult.msg+"</font>";
	        	return false;
	        }else{
	        	//if(newpswd1.length>=6&&newpswd1.length<=16){
	        		document.getElementById("m_disnewpswd1_span").innerHTML = "<font color='green'>密码格式有效</font>";
					return true;
	        	/*}else{
	        		document.getElementById("m_disnewpswd1_span").innerHTML = "<font color='red'>密码长度必须介于6到16之间</font>";
					m_onblur(obj);
					return false;
	        	}*/
	        }
	}
}
function checkpswd2(obj){
	var  newpswd1 = document.getElementById("m_newpswd1").value;
	var  newpswd2 = document.getElementById("m_newpswd2").value;
	if(newpswd2==""||newpswd2==document.getElementById("m_newpswd2").defaultValue){
		document.getElementById("m_disnewpswd2_span").innerHTML = "<font color='red'>密码不能为空</font>";
		m_onblur(obj);
		return false;
	}else{
			if(newpswd2!=newpswd1){
				document.getElementById("m_disnewpswd2_span").innerHTML = "<font color='red'>两次输入密码不一致</font>";
				m_onblur(obj);
				return false;
			}else{
				document.getElementById("m_disnewpswd2_span").innerHTML = "<font color='green'>两次输入密码一致</font>";
				//return true;继续校验
			}
			var checkresult = checkpwd(newpswd2);
        	if('true'!=checkresult.flag){
	        	document.getElementById("m_disnewpswd2_span").innerHTML = "<font color='red'><d:write dictTypeId="YD_CONFIG_PW" value="pwd_warn_msg" /></font>";
	        	return false;
	        }else{
	        	//if(newpswd1.length>=7&&newpswd1.length<=12){
	        		document.getElementById("m_disnewpswd2_span").innerHTML = "<font color='green'>密码格式有效</font>";
					return true;
	        	/*}else{
	        		document.getElementById("m_disnewpswd2_span").innerHTML = "<font color='red'>密码长度必须介于7到12之间</font>";
					m_onblur(obj);
					return false;
	        	}*/
	        }
	}
}
//----校验码输入校验
function checkverifycode(obj){
	var  verifycode = document.getElementById("m_verifycode").value;
	if(verifycode==""||verifycode==document.getElementById("m_verifycode").defaultValue){
		document.getElementById("m_disverifycode_span").innerHTML = "<font color='red'>校验码不能为空</font>";
		m_onblur(obj);
		return false;
	}else{
		 var ret_=false;
			jQuery.ajax({				
				url: "<%=request.getContextPath() %>/portal/login/mimazhaohuicheck.jsp",
				type: 'get',
				data:"verifyCode="+verifycode,
				dataType:'text',
				async: false
			}).success(function(obj) {
			 var falg=obj;
			 	if(falg=="0"){
			 		document.getElementById("m_disverifycode_span").innerHTML = "<font color='green'>校验码校验成功</font>";
	        		ret_ = true;
				 }else{
				  	document.getElementById("m_disverifycode_span").innerHTML = "<font color='red'>校验码校验失败</font>";
				  	m_onblur(obj);
					ret_= false;
					objnew.codeImage.src=objnew.imageUrl+"&timestamp="+Math.random();
				 }
			});
			
			return ret_;
	}
}
function m_onfocus(obj){//光标放入
	if(obj.value==obj.defaultValue)obj.value='';
	obj.style.color="black";
}
function m_onblur(obj){//光标移开
	if(/^\s*$/.test(obj.value)){//为空的时候设置为默认值
		obj.value=obj.defaultValue;
		obj.style.color='#aaa';
	}
}

function  showImg(){
	
	document.getElementById("u19").style.display='block';
}
function hideImg(){
	
	document.getElementById("u19").style.display='none';
}
//---------
</script>

</head>
<body style="background-color:transparent;margin:0px;overflow:hidden" >
<div id="m_all">
	<div id="m_topbar"  class="m_topbar"></div><!-- end m_topbar -->
	<div id="m_content" class="m_content">
		
		<div class="password_management">
			<div class="title_r">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="cursor: pointer;" onclick="loginsoa()"><a>首页</a></span><em> &gt; </em>
				<a href="/ydsoa/portal/login/mimazhaohui.jsp">密码管理</a><em> &gt; </em>
				找回密码</a>
			
			</div>
			
			 <div id="step1" class="token_process">
				<div align="center">为了您的帐号安全，我们为您提供了以下方式找回您的密码</div>
				<div align="center">
					<div id="u17" class="u17_container"><div id="u17_img" class="u17_normal"></div></div>
					<div id="u8" class="u8"><div style="cursor: pointer;" onclick="zhaohui()">手机找回密码</div></div>
					<div id="u18" class="u18_container"><div id="u18_img" class="u18_normal"></div></div>
					<div id="u13" class="u13"><div style="cursor: pointer;" onMouseOut="hideImg()"  onmouseover="showImg()">手机号码更换</div></div>	
					<div id="u19" style="display:none;" class="u19_container"><div id="u19_img" class="u19_normal"></div></div>
									
					<div id="u9" class="u9"  ><div id="u9_rtf">如果上面的方式不可用!您可以进行</div>	</div>
					<div id="u10" class="u10_container"><div id="u10_img" class="u10_normal"></div></div>		
					<div id="u12" class="u12"><div id="u12_rtf" style="cursor: pointer;" onclick="shensu()">账号申诉</div></div>
				</div>
			</div><!-- end step1-->
			
			<div id="step2" class="token_process" style="display: none;">
				
	            <ul>
	            	<div onClick="javascript:window.open('https://s3.ax1x.com/2021/01/11/s8SvdS.png')" style="cursor: hand;text-align:center;color:red">
						若工号，姓名，手机号校验异常，请先尝试设置浏览器兼容性(点击文字查看设置步骤)
					</div>
		            <li><blockquote><b>*</b> 工号：</blockquote>
		            <input type="text" id="m_empcode" class="input_text tdf01" value="例如：90037727或者网点编码+001、002" tabindex="1" onfocus="javascript:m_onfocus(this);" onblur="javascript:{if(checkempcode(this))checkServer('empcode');}" />
		            <span id="m_disempcode_span"></span>
		            </li>
		            
		            <li><blockquote><b>*</b> 姓名：</blockquote>
		            <input type="text" id="m_empname" class="input_text tdf01" value="例如：张三" tabindex="1" onfocus="javascript:m_onfocus(this);" onblur="javascript:{if(checkempname(this))checkServer('empname');}" />
		            <span id="m_disempname_span"></span>
		            </li>
		            
		            <li><blockquote> 手机号码：</blockquote>
		            <input type="hidden" id="m_mobileno" class="input_text tdf01" />
		            <input type="text" id="m_dismobileno_span" class="input_text tdf01" readonly="true"/>
		            </li>
		            <li><blockquote></blockquote>
		            	<button id="m_getcheckno_button" type="button" onclick="javascript:getCheckNo();">获取验证码</button>
		            	<span id="m_disseconds_div" align="left">&nbsp;&nbsp;点击获取校验码！</span>		           
		            </li>
		             <li><blockquote><b>*</b> 手机验证码：</blockquote>
		            <input type="text" id="m_mobilecheckno" class="input_text tdf01" value="例如：123456" tabindex="1" onfocus="javascript:m_onfocus(this);" onblur="javascript:checkmobilecheckno(this);" />
		            <span id="m_dismobilecheckno_span" style="color: red"></span>
		            </li>
	            	<li class="btn"><div align="center"> <button type="button" onclick="javascript:checkNoAndNext();">下一步</button><div>
	            	</li>
					
	            </ul>
	          </div> <!-- end step2 -->
	          
	          <div id="step3" class="token_process" style="display: none;">
	            <ul>
		            <li><blockquote><b>*</b> 新密码：</blockquote>
		           
		            <input type="password" id="m_newpswd1" class="input_text tdf01" value="英文字母+阿拉伯数字（为6-16个字符）"  tabindex="1" onfocus="javascript:m_onfocus(this);" onblur="javascript:checkpswd1(this);" />
		            <span id="m_disnewpswd1_span"></span>
		            </li>
		            
		            <li><blockquote><b>*</b> 再次输入新密码：</blockquote>
		            <input type="password" id="m_newpswd2" class="input_text tdf01" value="英文字母+阿拉伯数字（为6-16个字符）" tabindex="1" onfocus="javascript:m_onfocus(this);" onblur="javascript:checkpswd2(this);" />
		            <span id="m_disnewpswd2_span"></span>
		            </li>
		            
		            <li><blockquote><b>*</b> 输入验证码：</blockquote>
		            <input type="text" id="m_verifycode" class="input_text tdf01" value="1234" tabindex="1" onfocus="javascript:m_onfocus(this);" onblur="javascript:checkverifycode(this);" />
		           	<span id="m_disverifycode_span"></span>
		           </li>
		             
		             <li><blockquote></blockquote>
		             <div id='verifyCode_container' align="left"></div>
		             <script> 
		             	var tmpObj=new VerifyCode({name:"verifyCode",length:"4",type:"number",imageHeight:"21",hasInput:true,style:"width:70px;"});
		             	tmpObj.init();
		             </script>
		             </li>
		            
	            	<li class="btn"><div align="center"> <button type="button" onclick="javascript:submitpswd();">提&nbsp;&nbsp;交</button><div>
	            	</li>
			
	            </ul>
	          </div> <!-- end step3 -->
	          <div id="step4" class="token_process" style="display: none;">
	            <ul>
	            	<div align="center">
	            		 <p style="text-align:center;">
	            		 <span style="font-family:Arial;font-size:20px;font-weight:normal;font-style:normal;text-decoration:none;color:#FF3333;">恭喜，您的密码已修改成功！！！</span></p>
					</div>
					<br><br><br>
					
					<div><p style="text-align:center;">请点击此链接：<span style="cursor: pointer;" onclick="loginsoa()"><a href="javascript:void(0)">http://<%=soadomain%>/ydsoa</a></span>可登录SOA.</p>
					 </div>
	            </ul>
	          </div> <!-- end step4 -->
	          
	          <div id="step_rg" class="token_process" style="display:none;">
	          	<ul>
				<div><p style="text-align:left;">您可以通过人工服务找回您的密码：</p></div>
				<br><br><br>
				<div><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关于网点CS客户端密码忘记问题：（网点用户）</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.点客户端旁边忘记密码链接通过手机获取验证码 下一步 自己设置密码（密码规则:字母大写加字母小写加数字组合合计7到12位），&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号码和负责人姓名不知道的或者需要更改的请联系网点建设部。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;快递网点管理部：021-39290560   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  快运网点管理部：021-39291073&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.存在极少数情况，通过上述方式重置密码后依然客户端登录不进去，但是SOA可以登录，请联系IT服务台。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;快递技术支持电话：4008209669转1转1   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  快运技术支持电话：4008209669转2转1  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关于总部CS客户端密码忘记问题：（总部/分拨中心）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.电话：4008209669转1转5 021-39296659  &nbsp;&nbsp;&nbsp;</li>
				<a  href="wxwork://message/uin=8444250174320681"><span style="background-repeat:no-repeat;padding-left:20px;">联系在线技术客服</span></a>
				<br><br><br>
				<div><p style="text-align:center;">若获得密码、请点击此链接：<span style="cursor: pointer;" onclick="loginsoa()"><a href="javascript:void(0)">http://<%=soadomain%>/ydsoa</a></span>
				 可登录SOA.</p></div>
	          	</ul>
	          
				
			</div><!-- end step_rg -->
			
        </div><!-- end  password_management-->
	</div><!-- end m_content -->
</div><!-- end m_all -->
</body>
</html>