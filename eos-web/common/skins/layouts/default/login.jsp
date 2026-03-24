<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<h:script src="/common/javascripts/eos-verifyCode.js"/>
<style>

BODY {
	color: #333333;
	background-color: #ffffff;
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 8pt;
	background-position: top left;
	background-repeat: repeat-x;
}



.toptable h1 {
	display: none;
}

.toptable h3 {
	font-size: 12pt;
	display: inline;
}

.toptable h2 {
	font-size: 10pt;
	font-style: italic;
	display: inline;
}

.centertable {
	background-image: url(<%=SkinUtil.getStyleFile("images/abf/login.jpg",request)%>);
}


.footercontent {
	font-size: 8pt;
	text-align: right;
	line-height: 1.1em;
}

.footercontent p {
	font-size: 8pt;
	text-align: right;
	line-height: 1.5em;
}
.content {
	padding: 10px;
}

.content p,ul,li,td,tr {
	font-size: 8pt;
}

.content h1 {
	font-size: 10pt;
	font-weight: bold;
}

.nav_manage th {
	background-color: #cccccc;
}

.message {
	color: red;
}
</style>
<%@page import="org.gocom.abframe.auth.bizlet.LogonUtil"%>
<html>
<head>
<title><b:message key="auth_login_title" /></title>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<br>

<div align="center">
<br>
<br>
<br>
<br>
<br>
<table border="0" cellpadding="0" cellspacing="0" class="centertable">
	<tr>
		<td>
		<table border='0' cellspacing='0' cellpadding='0' width="">
		   <l:equal property="authValue" value="-2">
		   <tr>
				<td valign='top' class='content'>
				<b:message key="auth_login_invaildpassword"/>
		   </td>
		   </tr>
		   </l:equal>

		   <l:equal property="authValue" value="-1">
		   <tr>
				<td valign='top' class='content'>
				<b:message key="auth_login_nothisaccount"/>
		   </td>
		   </tr>
		   </l:equal>
			<tr>
				<td width='447' height="330" valign='top' class='content' align="center">

				<h:form checkType="blur" method="post"action="org.gocom.abframe.auth.Login.flow">
					<input type="hidden" name="_eosFlowAction" value="login">

					<table align="center" border="0">
					    <tr>
					       <td colspan="3"  height="130">&nbsp;</td>
					    </tr>
					    <%
						  if(LogonUtil.useChooseLanguange()){
						%>
					    <tr>
							<td><b:message key="auth_choose_lang"/><b:message key="l_colon" /></td>

							<td><d:select name="choose_lang" dictTypeId="ABF_CHOOSE_LANG" value="<%=LogonUtil.getDefaultLanguange()%>"/></td>

							<td>&nbsp;</td>

						</tr>
					    <%}else{%><h:hidden property="choose_lang" value="<%=LogonUtil.getDefaultLanguange()%>" /><%} %>
						<tr>
							<td><b:message key="auth_login_userid"/><b:message key="l_colon" /></td>

							<td><h:text id="userid" property="acOperator/userid" validateAttr="allowNull=false" size="20" /></td>

							<td><font style="color:red"><h:errorMessage name="acOperator/userid" style="color:red;"/>
							<l:equal property="retCode" targetValue="-1"><b:message key="auth_login_nothisaccount"/></l:equal>&nbsp;</font></td>

						</tr>

						<tr>

							<td><b:message key="auth_login_password"/><b:message key="l_colon" /></td>

							<td><h:password id="password" property="acOperator/password" validateAttr="maxLength=100;minLength=4;allowNull=false" size="22" /></td>

							<td><font style="color:red"><h:errorMessage name="acOperator/password" style="color:red;" />
							<l:equal property="retCode" targetValue="-2"><b:message key="auth_login_invaildpassword"/></l:equal>&nbsp;</font></td>

						</tr>
						<%
						  if(LogonUtil.useVerifyCode()){
						%>
						<tr>

							<td><b:message key="auth_login_checkcode"/><b:message key="l_colon" /></td>

							<td><h:verifyCode name="verifyCode" validateAttr="allowNull=false" /></td>

							<td><font color="red"><h:errorMessage name="verifyCode" style="color:red;"/>&nbsp;</font></td>

						</tr>
						<%}%>
						<tr>
						    <td colspan="3" align="center" >
						      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="button" value=" <b:message key="l_login"/> ">
						      <input type="reset" class="button"  value=" <b:message key="l_reset"/> ">
						    </td>
						</tr>

					</table>


				</h:form>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
</body>
<script type="text/javascript">
	 /*
	  * 功能：初始化页面
	  *
	  *
	  */
     function custInit()
     {
     	//初始化焦点
     	<l:notPresent property="retCode">   
     	    $id("userid").focus();
     	</l:notPresent>
     	<l:present property="retCode">        
	     	<l:equal property="retCode" targetValue="-1">
	     	    $id("userid").focus();
	     	</l:equal>
	     	<l:equal property="retCode" targetValue="-2">
	     	   $id("password").focus();
	     	</l:equal>
     	</l:present>     	     	
     }
     
	 //初始化页面按钮样式
     eventManager.add(window,"load",custInit);
</script>
</html>
