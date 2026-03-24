<%@page pageEncoding="UTF-8"%>
<html>
<head>
<title>流程说明</title>
<script type="text/javascript">
function showProcessChart(defName)
{
	//设置模态窗口的大小
	var iWidth = window.screen.width * (3/4);   //弹出窗口的宽度;
    var iHeight = window.screen.height * (3/4); //弹出窗口的高度;
	var url= "<%=request.getContextPath()%>/comm/common/jsp/ProcessChart.jsp?processName=" + defName;
	url = "com.yd.soa.bpsclient.helptopic.ProcessChart.flow?processName=" + defName;
	showModalCenter(url,null,null,iWidth,iHeight,"流程图")
}

function showProcessDoc(defName)
{
	//设置模态窗口的大小
	var iWidth = window.screen.width * (3/4);   //弹出窗口的宽度;
    var iHeight = window.screen.height * (3/4); //弹出窗口的高度;
	var url= "com.yd.soa.bpsclient.helptopic.HelptopicDocView.flow?processName=" + defName;
	showModalCenter(url,null,null,iWidth,iHeight,"流程相关文档")
}
<!-- 20150715wxr 意见反馈窗口-->
function showFeedback(url,title){
	window.top.portalUtil.showWindowOnTab(url,title);
}
</script>
</head>
<body>
<l:notEmpty property="helptopic">
<div style="text-align:left;margin-left:10px;">
	<input type="button" class="button" onclick="showProcessDoc('<b:write property="helptopic/topicprodefname" />')" style="margin-right:20px; width:60px;" value="相关文档">
	<input type="button" class="button" onclick="showProcessChart('<b:write property="helptopic/topicprodefname" />')" style=" width:80px;" value="查看流程图">
	<input type="button" class="button" onclick="showFeedback('/ydsoa/com.yd.soa.application.feedback.SuggestionSubmit.flow','意见反馈')"  style="margin-left:20px; width:60px;" value="意见反馈">
</div>
</l:notEmpty>
	<div style="text-align:center; font-weight:bold; font-size:16px; margin-top:50px;"><b:write property="processcomm/processTitle" /></div>
	<div style="text-align:right; height:60px; padding-right:10px;" >
		<div style="float:left"><h:img src="/budget/comm/logo.jpg" /></div> 
		<div style="float:right;">
			<p style="margin-top:15px; line-height:20px"><%--<b:write property="ydtbmbase/docId"/>--%> <br/>
			填表时间：<b:write property="processcomm/cuutrdate" formatPattern="yyyy年MM月dd日" /></p>
		</div>
	</div>
	<div style="clear:both;"></div>
</body>
</html>