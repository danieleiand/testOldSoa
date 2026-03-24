<style type="text/css">
#img1{width:59px;height:61px;position:absolute;top:43px;left:2px;z-index:10;}
#img1 div{width:200px;text-align:right;font-size:12px;}
#img1 div a:link{text-decoration:none;}
#img1 div a:hover{color:red;text-decoration:none;}
#img1 img{width:200px;height:200px;border:0px solid black;}
#img2 img{width:15px;height:15px;border:0px solid black;}
p{margin-top:50px;text-align:center;}
</style>
<div id="img1" onmouseover="pause_resume()" onmouseout="pause_resume()">
<div id="img2"><a href="javascript:void(0);" onclick="closediv2()" title="点击关闭"><img src="<%=request.getContextPath()%>/portal/images/delete.gif"></a></div>
<a target="_blank" ><img src="<%=request.getContextPath()%>/portal/images/hangshang.png" alt="单击查看使用说明,右上角关闭" onclick="docViewtwo()"></a>
</div>
<SCRIPT type="text/javascript">
var xPos = 300;
var yPos = 200; 
var step = 1;
var delay = 30; 
var height = 0;
var Hoffset = 0;
var Woffset = 0;
var yon = 0;
var xon = 0;
var pause = true;
var interval;
var divid = img1; //浮动DIV的ID.
divid.style.top = yPos;
function changePos(){
   width = document.body.clientWidth;
   height = document.body.clientHeight;
   Hoffset = divid.offsetHeight;
   Woffset = divid.offsetWidth;
   divid.style.left = xPos + document.body.scrollLeft;
   divid.style.top = yPos + document.body.scrollTop;
   if(yon){yPos = yPos + step;}else{yPos = yPos - step;}
   if(yPos < 0){yon = 1;yPos = 0;}
   if(yPos >= (height - Hoffset)){yon = 0; yPos = (height - Hoffset);}
   if(xon){xPos = xPos + step;}else{xPos = xPos - step;}
   if(xPos < 0){xon = 1;xPos = 0;}
   if(xPos >= (width - Woffset)){xon = 0; xPos = (width - Woffset);}
}
function start(){
   divid.visibility = "visible";
   interval = setInterval('changePos()',delay);
}
function pause_resume(){
   if(pause){
   clearInterval(interval);
   pause = false;}
   else{
   interval = setInterval('changePos()',delay);
   pause = true; 
   }
}
//关闭
function closediv2(){
   clearInterval(interval);
   divid.style.display = "none";
}
//初始化
start();

function docViewtwo(RecordID,EditType,ShowType){
	<%--var RecordID = '<%=com.yd.soa.comm.PropertiesCacheUtil.getKey("yd.soa.weixingdocid","1390876437660") %>';
	var	EditType = '0,0';
	var ShowType = 1;
    var action = "com.yd.soa.document.viewdoc.flow";
    var url = action+"?RecordID="+RecordID+"&EditType="+EditType+"&ShowType="+ShowType;--%>
    var url = "com.yd.soa.document.viewdoc.flow?RecordID=1474187657771&EditType=0,0&ShowType=1";
    openFullWindowtwo(url,"查看文档"+new Date().getTime());
}
function openFullWindowtwo(urlPath,winName){
		var objNewWin;				
	    var w=screen.availWidth-8;
		var h=screen.availHeight-32;
		//objNewWin = window.open(urlPath,winName,"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=" + w + ",height=" + h + ",top=0,left=0");
		objNewWin = window.open(urlPath,winName,"toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=0,width=" + w + ",height=" + h + ",top=0,left=0,scrollbars=yes");
}
</SCRIPT>