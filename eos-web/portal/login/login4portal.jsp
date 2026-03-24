<%@ page session="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
	body{
		font-family:arial,sans-serif;
		font-size:12px;
	}
 .bg_login{
		background:url(<%=request.getContextPath() %>/portal/login/Bg.jpg);
		
	}

	.fg_login{
		background:url(<%=request.getContextPath() %>/portal/login/div_bg.jpg) no-repeat; 
		width:794px;
		height:669px; 
		margin-top:1px !important; 
		margin-top:2px;
		margin-left:231px !important;
		margin-left:auto;		
		margin-right:auto;		
		border-collapse:collapse;		
	}
	.tb{
		color:#0c3569;
		height:130px;
		position:relative;
		top:245px;
		margin-left:auto; 
		margin-right:auto;
		}
  .txt_input
  {
  	height:16px;
  	width:180px;
  	background:#e7f4f8;
  	border:1px solid #7fb8ed;
  	color:#0c3569;
  	}
  .btn {
  	background:url(<%=request.getContextPath() %>/portal/login/log_bt.jpg) no-repeat;
  	width:44px;
  	height:23px;
  	border:0px;
  	color:#0c3569;
  	
		/* BORDER-RIGHT: #7b9ebd 1px solid; 
		PADDING-RIGHT: 2px; 
		BORDER-TOP: #7b9ebd 1px solid; 
		PADDING-LEFT: 2px; 
		FONT-SIZE: 12px; 
		BORDER-LEFT: #7b9ebd 1px solid; 
		CURSOR: hand; 
		COLOR: black; 
		PADDING-TOP: 2px; 
		BORDER-BOTTOM: #7b9ebd 1px solid; */
    }

</style>

</head>

<body class="bg_login" marginheight="0" marginwidth="0">

<div class="fg_login">
<form method="post" action="validate.jsp">
<table class="tb">
	<tr>
		<td width="50" >用户名:</td>
		<td width="230">
			<input id="username" name="userId" class="txt_input" size="25" tabindex="1" autocomplete="false" htmlEscape="true"/>
		</td>
	</tr>
	<tr>
		<td width="50" >密码:</td>
		<td width="230">
			<input type="password" id="password" class="txt_input" size="25" tabindex="2" name="password" htmlEscape="true"/>
		</td>
	</tr>
	<tr>		
		<td style="padding-right:50px;text-align:right;vertical-align:middle;" colspan=2>
			<%if(request.getAttribute("loginFailure")!=null) out.println("<font color='red'>用户名或密码错误!</font>"); %>
			<input class="btn" name="submit" value="登录" type="submit" />
      <input class="btn" name="reset" value="重置" type="reset" />
		</td>
		
		</tr>
	
	<tr height="35" valign="bottom">
		<td>
			<input type='hidden' name='isLogin' value='true'>
		</td>
		
	</tr>
</table>

</form>
</div>
</body>
</html>
