<DIV id="imgdiv" style="Z-INDEX: 100; LEFT: 2px; WIDTH: 150px; POSITION: absolute; TOP:90px; HEIGHT: 100px;visibility: visible;">
	<table border=0 cellspacing=0 cellpadding=0>
	<tr valign="top"><td>
	<img id="imgyidong" style="cursor:pointer;height: 500px;width: 150px;" src="<%=request.getContextPath()%>/portal/share/d3oLge.png"   border="0" alt="击查看使用说明,右上角关闭">	
	</td><td>
	<img id="imgyidongclose" src="<%=request.getContextPath()%>/portal/images/delete.gif" width="15" height="15" border="0" onclick="closeCdcode()" alt="关闭">
</td></tr>
</table> 
</DIV>
 
<SCRIPT type="text/javascript">

//设置二维码位置
function position() 
{
	var imgdiv = document.getElementById("imgdiv");//获取层
	var imgyidong = document.getElementById("imgyidong");//获取图片
	//设置层所在位置
	imgdiv.style.left =  document.body.clientWidth-imgyidong.width-15;
	imgdiv.style.top =  document.body.clientHeight/8;
}
//关闭二维码
function closeCdcode(){
	document.getElementById("imgdiv").style.display="none";
}
//初始页面加载
position();

function docView(RecordID,EditType,ShowType){
	<%--var RecordID = '<%=com.yd.soa.comm.PropertiesCacheUtil.getKey("yd.soa.weixingdocid","1440480503399") %>';
	var	EditType = '0,0';
	var ShowType = 1;
    var action = "com.yd.soa.document.viewdoc.flow";--%>
    var url = "com.yd.soa.document.viewdoc.flow?RecordID=1440480503399&EditType=0,0&ShowType=1";
    openFullWindow(url,"查看文档"+new Date().getTime());
}
function openFullWindow(urlPath,winName){
		var objNewWin;				
	    var w=screen.availWidth-8;
		var h=screen.availHeight-32;
		//objNewWin = window.open(urlPath,winName,"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=" + w + ",height=" + h + ",top=0,left=0");
		objNewWin = window.open(urlPath,winName,"toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=0,width=" + w + ",height=" + h + ",top=0,left=0,scrollbars=yes");
}
</SCRIPT>