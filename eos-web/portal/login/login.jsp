<%@ taglib uri="http://eos.primeton.com/tags/html" prefix="h"%>
<%@ page session="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	if(request.getAttribute("loginFailure")==null){		
		String service = request.getParameter("service");
		
		String upStr = null;
		String username = null;
		String password = null;
		try{
			if(service != null)	upStr = service.substring(service.indexOf("u_=")+3);
			if(upStr != null){
				username = upStr.substring(0,upStr.indexOf("&"));
				password = upStr.substring(upStr.indexOf("p_=")+3);
			}
		}catch(Exception e){}		
		if(username!=null&&password!=null&&!username.equals("")&&!password.equals("")){%>
		
				<SCRIPT LANGUAGE="JavaScript">
				fsoa={}
				fsoa.ts="8ABC7DLO5MN6Z9EFGdeJfghijkHIVrstuvwWSTUXYabclmnopqKPQRxyz01234"
				fsoa.e=function(n)
				{
					var nl=n.length,t=[],a,b,c,x,m=function(y){t[t.length]=fsoa.ts.charAt(y)},N=fsoa.ts.length,N2=N*N,N5=N*5
					for(x=0;x<nl;x++)
					{
						a=n.charCodeAt(x)
						if(a<N5)m(Math.floor(a/N)),m(a%N)
						else m(Math.floor(a/N2)+5),m(Math.floor(a/N)%N),m(a%N)
					}
					var s=t.join("")
					return String(s.length).length+String(s.length)+s
				}
				
				fsoa.d=function(n)
				{
					var c=n.charAt(0)*1
					if(isNaN(c))return ""
					c=n.substr(1,c)*1
					if(isNaN(c))return ""
					var nl=n.length,t=[],a,f,b,x=String(c).length+1,m=function(y){return fsoa.ts.indexOf(n.charAt(y))},N=fsoa.ts.length
					if(nl!=x+c)return ""
					while(x<nl)
					{
						a=m(x++)
						if(a<5)f=a*N+m(x)
						else f=(a-5)*N*N+m(x)*N+m(x+=1)
						t[t.length]=String.fromCharCode(f)
						x++
					}
					return t.join("")
				}
				</SCRIPT>		
			<form id="loginfrm1" name="loginfrm1" method="post" size="0">
			<input  type='hidden' id="username1" name="username"/>
			<input type="password" id="password1" size="0" name="password" style="display:none"/>
			<input type='hidden' name='cookie' value='<%=request.getAttribute("cookie")%>'>
			<input type='hidden'  <%=request.getAttribute("action")%> >
			<%=request.getAttribute("lt")%>
			<input type='hidden' name='service' value='<%=request.getAttribute("service")%>'>
			<input type="hidden" name="_eventId" value="submit" />
			</form>
			<script>
			document.getElementById("username1").value=fsoa.d('<%=username%>');
			document.getElementById("password1").value=fsoa.d('<%=password%>');
			document.getElementById("loginfrm1").submit();
			</script>
<% }}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录-韵达SOA统一平台</title>
<meta name="renderer" content="ie-comp"/>
<script  type="text/javascript">
var contextPath = "<%=request.getContextPath()%>";
window.onload = function(){
		//alert(1111);
    	if(window.location.href.indexOf("loginType=1") != -1){
    		//document.getElementById('diloag').style.display="none";
    	}
	
	var appPortal = '<%= request.getParameter("appPortal") %>';
	if(appPortal == "appRedirect"){
		//document.getElementById('diloag').style.display="none";
		var name = '<%= request.getParameter("username") %>';
		if(name !="" && name !=null && name !="null"){
			document.getElementById('username').value='<%= request.getParameter("username") %>';
		}
		//document.getElementById('username').setAttribute("readOnly", false);
	}else{
		//document.getElementById('username').setAttribute("readOnly", false);
		//document.getElementById('diloag').style.display="";
	}
}

function showIndexPage()
{
	//alert(222);
	//alert(top.location)
	//alert(self.location)
  top.location = self.location;
  var redirectUrl = window.location.href;
 
  if (redirectUrl.indexOf("?") == -1) { 
  	 redirectUrl += "?loginType=1";
  }else{
  	
  	redirectUrl += "&loginType=1"
  }
  var width = screen.width ;
  var height = screen.height ;
  if (height == 768 ) height -= 75 ;
  if (height == 600 ) height -= 60 ;
  var szFeatures = "top=0," ; 
  szFeatures +="left=0," ;
  szFeatures +="width="+width+"," ;
  szFeatures +="height="+height+"," ;
  szFeatures +="directories=no," ;
  szFeatures +="status=yes," ;
  szFeatures +="menubar=no," ;

  if (height <= 600 ) szFeatures +="scrollbars=yes," ;
  else szFeatures +="scrollbars=no," ;

  szFeatures +="resizable=yes" ; //channelmode

  /**
  * 检查窗口是否被阻止
  * updated by cyril on 2008-06-02
  */
}
<%
String loginType = request.getParameter("loginType");
String CASLOGOUT = request.getParameter("CASLOGOUT");
if(null != CASLOGOUT && "true".equalsIgnoreCase(CASLOGOUT))
{
 %>
 //top.location = self.location;
 //window.opener = null;
 //window.close();
 <%
}else if(null == loginType){
 %>
//showIndexPage();
<%} %>
</script>
<h:script src="common/scripts/eos-web.js"></h:script>
<h:script src="common/javascripts/zh_CN/message.js"></h:script>
	
<script type="text/javascript">
VerifyCode.prototype.initImg=function()
{	
	this.codeImage=$create("img");
	this.container.appendChild(this.codeImage);
	this.codeImage.style.verticalAlign="text-bottom";
	this.codeImage.style.marginLeft="6px";
	this.codeImage.title=VERIFYCODETITLE;
    this.imageUrl=contextPath+"/codeImage.cimg?name="+this.config.name+"&imageHeight="+this.config.imageHeight+"&length="+this.config.length+"&type="+this.config.type;
 	this.codeImage.src=this.imageUrl;
    var obj=this;
    eventManager.add(this.codeImage,"click",function(){return function(){this.codeImage.src=this.imageUrl+"&timestamp="+Math.random()}.call(obj)});
}

function checkForm() {
	
	if(allTrim($id("username").value).length==0) {		
		alert("用户名不能为空");
		//document.getElementById('diloag').style.display="none";
		return false;
	}
	
	if(allTrim($id("password").value).length==0) {		
		alert("密码不能为空");
		//document.getElementById('diloag').style.display="none";
		return false;
	}
	
	var obj = $id("vCode_container").getElementsByTagName("INPUT")[0];
	
	if(allTrim(obj.value).length==0) {
		//document.getElementById('diloag').style.display="none";
		alert("验证码不能为空");
		return false;
	}
	var regtest = /(^\s*)|(\s*$)/g;
	var unametest = $id("username").value;
	unametest.replace(regtest,"");
	$id("username").value = trim(unametest);
	var redirectUrl = window.location.href;
	$id("loginfrm").action=redirectUrl.replace("CASLOGOUT=true","");
	$id("loginfrm").submit();
}
function mimazhaohui(){
	
	window.location.href="/ydsoa/portal/login/mimazhaohui.jsp";
}

//添加table行数  回调函数 
function callBackMaterial(returnValue){
}
</script>

<script language="javascript" for="document" event="onkeydown"> 
if(event.keyCode==13 && event.srcElement.type!='button' && event.srcElement.type!='submit' && event.srcElement.type!='reset' && event.srcElement.type!='textarea' && event.srcElement.type!='') 
checkForm(); 
</script>

<script type="text/javascript">
//----stephen.Dong 2014-01-16 新增 begin
var SOA_V_locator = null;
var SOA_V_service = null;
var SOA_V_loginenable = false;//是否可以登录SOA
var SOA_V_NETINFO = null;
var SOA_V_HOSTINFO = null;
try{
  SOA_V_locator = new ActiveXObject ("WbemScripting.SWbemLocator"); 
  SOA_V_service = SOA_V_locator.ConnectServer(".");
}catch(e){
	//alert("ErrInfoIS:"+e)
}finally{
}


 
function SOA_F_alert(text_,firstIf){

	if(firstIf){
		var alertFram = document.createElement("DIV");
	     alertFram.id="alertFram";
	     alertFram.style.position = "absolute";
	     alertFram.style.left = "50%";
	     alertFram.style.top = "50%";
	     alertFram.style.marginLeft = "-220px";
	     alertFram.style.marginTop = "-100px";
	     alertFram.style.width = "600px";
	     alertFram.style.height = "300px";
	     alertFram.style.background = "#fff";
	     
	     text_ = "<div>IE浏览器对SOA系统的支持比较好，请按照如下步骤设置IE浏览器后才能更好的访问本系统。<br>1.工具->Internet选项->进入选项卡的《安全》项->选中受信任站点，点击站点按钮，把http://soa.yundasys.com添加到受信任站点，点击关闭按钮。<br>2.工具->Internet选项->进入选项卡的《安全》项->选中自定义级别按钮，找到《ActiveX控件和插件》下的《对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本》项，选中《启用》即可，点击确定按钮。<br><a href='/ydsoa/portal/login/IEProSetHelp.jsp' target='_blank'><font style='color:blue;size:medium;font-family:SimSun'>3.查看IE设置帮助</font></a><div>";
	     
	  
	     
	     strHtml = "<table boder='0' height='100%' width='100%' cellspacing='0' cellpadding='0'><tbody>";
	     strHtml +="<tr><td style='background:#ffcc00;' width='100%' height='20px'>[系统提示]</td></tr>";
	     strHtml +="<tr><td style=''>IE浏览器对SOA系统的支持比较好，请按照如下步骤设置IE浏览器后才能更好的访问本系统。<br><br>（1）、工具->Internet选项->进入选项卡的《安全》项->选中受信任站点，点击站点按钮，把http://soa.yundasys.com添加到受信任站点，点击关闭按钮。<br><br>（2）、工具->Internet选项->进入选项卡的《安全》项->选中自定义级别按钮，找到《ActiveX控件和插件》下的《对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本》项，选中《启用》即可，点击确定按钮。<br><br>（3）、<a href='/ydsoa/portal/login/IEProSetHelp.jsp' target='_blank'><font style='color:blue;size:medium;font-family:SimSun'>查看IE设置帮助</font></a><br><br>（4）、设置好浏览器信任站点及自定义级别后，请刷新页面后登录</td></tr>";
	     strHtml +="<tr><td style='background:#FDEEF4;' height='8px' align='center'><input type='button' value='确 定' onclick='SOA_F_doOk()'</td></tr></tbody></table>";
	     alertFram.innerHTML = strHtml;
	     document.getElementsByTagName("body")[0].appendChild(alertFram);	     
	}else{
		$id("alertFram").style.display = "";
	}
     
}
function SOA_F_doOk(){
     $id("alertFram").style.display = "none";
}
//----stephen.Dong 2014-01-16 新增 end
//----Anthony 2014-01-20 新增 begin

function setClientInfo(){
 	SOA_V_NETINFO = SOA_V_service.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration Where IPEnabled=TRUE"); //获取网络连接信息
 	SOA_V_HOSTINFO = SOA_V_service.ExecQuery("SELECT * FROM Win32_Processor"); ////CPU 信息

	$name("user_Agent").value = getUserAgent(); //浏览器以及版本   var user_Agent_Version = getUserAgentVersion();//浏览器版本
	$name("cmp_Ip").value = getIpAddr();//IP
	$name("cmp_Mac").value  = getMacAddr();//MAC地址
	$name("cmp_Host").value  = getHost();//计算机名称

//alert("浏览器以及版本:"+getUserAgent()+","+getUserAgentVersion()+",IP:"+getIpAddr()+",MAC地址:"+getMacAddr()+",计算机名称:"+getHost());

}

function setClientInfoDis(){
	setClientInfo();
	if(SOA_V_NETINFO != null){
		alert(getUserAgent());
	}else{
		alert("222222");
	}
}
//获取浏览器
function getUserAgent(){
	//if(isIe()){
   	   //User_Agent = "IE浏览器";
	//}else if(isFireFox()){
	   //User_Agent = "火狐浏览器";
	//}
	return  navigator.userAgent;   //包含以下属性中所有或一部分的字符串：appCodeName,appName,appVersion,language,platform
}
//获取浏览器版本
function getUserAgentVersion(){
	var arrayObj = new Array();
	arrayObj = navigator.userAgent.split(";");
	return arrayObj[1];
}
//获取IP地址
function getIpAddr(){
var er = new Enumerator(SOA_V_NETINFO);
	var cmpipStr ="";
	for (;!er.atEnd();er.moveNext()){
	   var p = er.item();
	   var cmp_Ip = p.IPAddress(0);
	   cmpipStr+=cmp_Ip+",";
	}
	//把字符串最后一个逗号替换为空格
	var str = cmpipStr.replace(/([^,]*),([^,]*)$/g, '$1$2');
	return str;
}
//获取MAC地址
function getMacAddr(){
var er = new Enumerator(SOA_V_NETINFO);
	var cmpmacStr ="";
	for (;!er.atEnd();er.moveNext ()){
	   var p = er.item();
	   var cmp_Mac = p.MACAddress;
	   cmpmacStr += cmp_Mac+",";
	}
	//把字符串最后一个逗号替换为空格
	var str = cmpmacStr.replace(/([^,]*),([^,]*)$/g, '$1$2');
	return str;
}
//获取计算机名称
function getHost(){
var er2 = new Enumerator(SOA_V_HOSTINFO);
	for (;!er2.atEnd();er2.moveNext()) { 
	   var p = er2.item (); 
	   var cmp_Host = p.SystemName;
	}
	return cmp_Host;
}
</script>
</head>

<body>
<form id="loginfrm" name="loginfrm" method="post">


<div class="login-area">
	<div class="login-head">
		<img src="portal/login/img/login-logo.png" alt="" class=logo" style="margin:25px"></img>
        <img src="portal/login/img/qh.png" alt="" id="qhBtn" onclick="handleNewWeb()"></img>
	</div>
	<div class="login-bg">
		<img src="portal/login/img/login-bg.png" alt=""></img>
	</div>
	<div class="login-info">
		<table  border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <%--<td height="600" valign="top" background="portal/login/login-bg.jpg">--%>
		    <table  border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td height="50" colspan="2">
		        	<p class="l-info-title" style="text-align: center; font-weight: 600">欢迎登录SOA统一管理门户</p>
		        </td>
		      </tr>
		      <tr>
		         <td  valign="bottom"  align="right">
		         &nbsp; 
		        </td>
		        <td width="300">
		        <table border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td height="45" valign="middle">
		            	<div>
		            		<label style="padding-right: 10px;width:55px;height:26px;line-height:26px;float:left">用户名: </label>
		            		<input  id="username" name="username"  name="loginid" class="AddDocFlow" style="WIDTH: 250px; HEIGHT: 26px;float:left"  tabindex="1" autocomplete="false" htmlEscape="true" size="15" />
		            	</div>
		                
		            </td>
		          </tr>
		          <tr>
		            <td height="45" valign="middle">
		            	<label style="padding-right: 10px;width:55px;float:left;height:26px;line-height:26px;">密&nbsp;&nbsp;&nbsp;&nbsp;码: </label>
		            	<input style="WIDTH: 250px; HEIGHT: 26px;float:left" id="password"  tabindex="2"  htmlEscape="true" type="password" size="15" name="password" />
		      		</td>
		          </tr>
		          <tr>
		            <td height="45" valign="middle">
		            	<label style="padding-right: 10px;width:55px;display: inline-block;float:left;height:26px;line-height:26px;">验证码: </label>
						<h:verifyCode hasInput="true" name="vCode" style="width:180px; height: 26px;float:left"/>
					</td>
		          <tr>                 
		          <tr>
		            <td height="40" valign="center" class="">          
						<div style="float:left">
							<%if(request.getAttribute("loginFailure")!=null) out.println("<font color='red'>用户名或密码错误!</font>"); %>
							
							<%if(request.getAttribute("loginFailure")==null && session.getAttribute("vcodeFailure")!=null){
								session.removeAttribute("vcodeFailure");					
							 	out.println("<font color='red'>验证码错误!</font>");
							 	}
							 %>
							<%if(session.getAttribute("userLocked")!=null  && "Y".equals(session.getAttribute("userLocked")) ){
								session.removeAttribute("userLocked");
							 	out.println("<font color='red'>您输错密码的次数已超过规定次数，该账号被锁定，请点击忘记密码找回密码解除锁定！</font>");
							 } %>
							<input type='hidden' name='cookie' value='<%=request.getAttribute("cookie")%>'>
						    <input type='hidden'  <%=request.getAttribute("action")%> >
							<%=request.getAttribute("lt")%>
							<input type='hidden' name='service' value='<%=request.getAttribute("service")%>'>
							<input type="hidden" name="_eventId" value="submit" />
							<!-- 新增计算机名称、IP、MAC、浏览器以及浏览器版本 Anthony-->
							<input type="hidden" name="cmp_Ip"/>
							<input type="hidden" name="cmp_Mac" />
							<input type="hidden" name="cmp_Host" />
							<input type="hidden" name="user_Agent"/>
						</div>
						<div style="float:right"><a href="http://isupport.yundasys.com:30888/soaPass" target="view_window"><font style="text-decoration:none;color:grey;size:medium;font-family:SimSun;font-size:14px">忘记密码？</font></a></td>

		            		
	            		<tr>
	            			<td>
	            				<div onclick="checkForm()" style="width: 390px; height: 40px;line-height: 40px; text-align:center; background: #FFBF00;color: #262222;font-weight: 600;display: block">
	            					<span>登录</span>
	            				</div>
	            			</td>		            			
	            		</tr>
                   
					</td>
		          </tr>
	
		        </table>
		        </td>
		        </tr>
		        <tr>
			        <td colspan="2"  style="padding-top:10px">
			        <a href="https://yunda.yuque.com/books/share/994841be-452d-4d2c-806d-2785c330a8c2/oqazi7" target="view_window"><div style="text-decoration:none;color:#003399;font-size:13px;text-align:right;margin-top:0px">更多帮助</div></a>
			        	<div class="tip_content" >
			        		<div>1、内部员工登录账号为8位工号</div>
			        		<div style="margin: 10px 0;">2、网点登录用户名： 网点编码+运营结算账号</div>
			        		<span style="color: #999;">（ 例如编码是200001，运营结算账号为001，登录账号即为200001001</span>        
			        		<a  style="color: #999;" href="javascript:setClientInfoDis();" style=" text-decoration:none;">）</a>
		        		</div>
		        		<div style="font-size:14px;text-align:center;margin-top:10px">推荐使用：360安全浏览器、360极速浏览器</div>
		        	</td>
		        </tr>

		      </table>
		      </td>
		  </tr>
		</table>
	</div>
	
</div>


</form>  
<div class="login-ltd">
	Copyright DONGPU Ltd，All Rights Reserved 软件开发与维护：上海东普信息科技有限公司
</div>
   
<script type="text/javascript">

	function a(){
	    //document.getElementById('diloag').style.display="none";
	    sessionStorage.setItem('num',1)
	}
	function b(){
		window.location.href ="http://oa.yundasys.com/login?redirect=%2Findex";
	}
	function handleNewWeb (){
	    window.location.href ="http://oa.yundasys.com/login?redirect=%2Findex";
	}
</script>
    <style>
        .logo{
	        display:inline-block;
	        margin-left:20px;
        }
        #qhBtn{
          margin: 25px 0 25px 59%;
          cursor:pointer;
          
        }
    	#vCode_container{
    		display: inline
    	}
    	.login-area{
	    	position: absolute;
	    	top:0;
	    	left: 0;
	    	right: 0;
	    	bottom: 0;
	    	background: #F5F5F5;
    	}
    	.login-area .login-head{
    		height: 80px;
    		line-height: 80px;
    		width: 100%;
    		background-color: #FFBF00;
    	}
    	.login-area .login-bg{
          margin:7% 0 0 10%;
    	}
    	.login-area .login-bg img{
    		width: 640px;
    		heiht: 360px;
    	}
    	.login-area .login-info{
    		position: absolute;
    		top: 25%;
    		right: 10%;
            margin:0 0 0 60%;
    		width: 400px;
    		background: #fff;
    		padding: 10px 20px;
    		webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            height: 450px;
    	}
    	.login-ltd{
    		position: absolute;
	    	left: 0;
	    	right: 0;
	    	bottom: 5px;
	    	font-size: 12px;
	    	text-align: center;
	    	color: #999;
    	}
    
        #loginfrm tr td input{
          height:26px!important;
          line-height: 26px;
        }
        .tip_content{
          font-size:12px;
          color: #5D5D5D;
        }
        *{
            margin:0;
            padding:0;
        }
        #diloag{
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            width:100%;
            height:100%;
            background-size:cover;
            background-image:url(/ydsoa/portal/login/img/bc.png);
    
        }
        .mind{
            margin:14% 0 0 25%;           
            width: 50%;
            height: 50%;
        }
        .one{
           overflow:hidden;
        }
        #one-left,#one-center,#one-right{
            float:left;
            position: relative;
            cursor: pointer;
            width: 20%;
            margin:10px 0 40px 10%;
            transform:scale(1);
            text-align:center;
        }
        #one-left .top,#one-right .top{
            position:absolute;
            top:10%;
            left:3%;
            display: block;
            width: 100%;
            text-align: center;
            font-size: 17px;
            font-family: Hiragino Sans GB;
            font-weight: 700;
            color: #232323;
            text-align:center;
        }
        #one-left .bottom,#one-right .bottom{
           font-size:14px;
           color:#666;
           padding-bottom:15px;
        }
        #one-left:hover,#one-right:hover{
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.5);
            border-radius: 15px;
            transform:scale(1.05);
        }
        #one-center{
            margin-top: 10%;
        }
        .one img{
            float:left;
            width: 100%;
        }
        .two{
            text-align: center;   
            font-size: 14px;
            font-family: Hiragino Sans GB;
            font-weight: normal;
            color: #FE5E62;
            margin-top: 30px;
        }
        .two p{
           height:30px;
           line-height:30px;
        }
        .three{
            margin-top:40px;
            overflow:hidden;
        }
        .three .dd,.three .ddq,.three .ewm{
            float:left;
        }
        .three .dd{
            margin:22px 0 0 30%;
        }
        .three span{
            margin: 32px 15px 0;
            font-size: 14px;
            font-family: 'Hiragino Sans GB';
            font-weight: normal;
            color: #666666;
        }
        .ewm img{
          margin-left:15px;
          width:90px;
          height:90px;
        }
        .dd img{
          width:65px;
        }
    </style>
</body>
</html>
