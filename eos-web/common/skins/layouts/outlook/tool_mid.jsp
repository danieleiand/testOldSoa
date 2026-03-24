<%@include file="/common.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>

<script>
function oa_tool(){
	if(window.parent.oa_frame.cols=="0,10,*"){
		frameshow.src='<%=SkinUtil.getLayoutStyleFileForTag("img/p_1.gif",request) %>';
		oa_tree.title="隐藏工具栏"
		window.parent.oa_frame.cols="180,10,*";
	}
	
	else{
		frameshow.src='<%=SkinUtil.getLayoutStyleFileForTag("img/p_2.gif",request) %>';
		oa_tree.title="显示工具栏"
		window.parent.oa_frame.cols="0,10,*";
	}
}
</script>
<style type="text/css">
<!--
body {
	background-image: url('<%=SkinUtil.getLayoutStyleFileForTag("img/Abg.gif",request) %>');
}
-->
</style></head>
<body text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">
<table width="9" border="0" height="100%" cellpadding="0" cellspacing="0" align="left">
  <tr align="center"> 
    <td background='<%=SkinUtil.getLayoutStyleFileForTag("img/bg_1_hr.gif",request) %>' width=10> 
      <div id=oa_tree onclick="oa_tool();" title=隐藏工具栏><br>
        <img id=frameshow src='<%=SkinUtil.getLayoutStyleFileForTag("img/p_1.gif",request) %>' width="9" height="50" ></div>
    </td>
  </tr>
</table>
</body>
</html>