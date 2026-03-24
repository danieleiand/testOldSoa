<%@page pageEncoding="UTF-8"%>
<html>
<head>
<title>流程说明</title>
</head>
<body>
	<div style="text-align:center; font-weight:bold; font-size:16px; margin-top:50px;"><b:write property="processcomm/processTitle" /></div>
	
	<div style="text-align:right; height:60px;padding-right:10px;" >
		<div style="float:left"><h:img src="/budget/comm/logo.jpg"/></div>
		<div style="float:right; height:100%; width:30%;">
			<p style="margin-top:35px; line-height:20px"><%--<b:write property="viewobject/docId"/> <br/>--%>
			填表时间：<b:write property="viewobject/appdate" formatPattern="yyyy年MM月dd日" /></p>
		</div>
		<!--<div id="myOnPageContent" style="float:right;">		
			<img src="com.yd.soa.budget.comm.createBarcode.flow?docId=<b:write property='viewobject/docId'/>"   id="showImg"  align="right"  />
		</div>-->	
	</div>			
	<div style="clear:both;"></div>
</body>
</html>