/**
*
*
*/
function clearPathComm(obj){
	var filePath = obj.parentElement.children(0);
	//filePath.outerHTML=filePath.outerHTML.replace(/(value=\").+\"/i,"$1\"");
	
	filePath.outerHTML += "";
	filePath.value = "";
}

/**
*上传文件大小判断
*
* @param  filePath    文件路径
*/
function filessizecheck(obj)    
{ 
	var filename = obj.value;
	var len = filename.length;
	var filesty = filename.substr(filename.lastIndexOf("."),len);   
	var str = ".doc.docx.xls.xlsx.ppt.pptx.txt.jpg.gif.png.rar.zip.";
	var sty = filesty+".";
	if(str.indexOf(sty) !=-1){
	/*
		var image=new Image(); 
		image.dynsrc=filename;
		if(image.fileSize > 1024*5000){
			alert("--上传文件大于5M-"); 
			obj.outerHTML=obj.outerHTML.replace(/(value=\").+\"/i,"$1\"");
		}
		*/
	}else{
		
		//obj.outerHTML=obj.outerHTML.replace(/(value=\").+\"/i,"$1\"");
		//clearPath(obj);
		obj.outerHTML += "";
		obj.value = "";
		alert("--上传文件格式不正确--");
	}
}
/**
* 回退处理
*/
function rollback(activityDefName,processInstID,activityInstID){
	var approveno = $name("oaapprovalinfo/APPROVENO").value;
	var applyNo = $name("applyNo").value;
	var approvedate = $name("oaapprovalinfo/APPROVEDATE").value;
	var approvever = $name("oaapprovalinfo/APPROVEVER").value;
   //弹出模态窗口
    showModalCenter("com.yd.soa.bpsclient.comm.backActivity.flow?processInstID="+processInstID+"&activityInstID="+activityInstID+"&applyNo="+applyNo+"&approvedate="+approvedate+"&approveno="+approveno+"&approvever="+encodeURIComponent(approvever)+"&activityDefName="+encodeURIComponent(activityDefName),null,callBack,400,200,"选择环节页面");
}

/**
*查看处理
*
* @param  processInstID    流程实例ID
* @param  activityInstID   活动实例ID
* @param  workItemID       工作项ID
* @param  actionUrl        活动节点URL
* @param  activityDefID    活动定义ID
* @param  activityDefName  活动定义名称
* @param  applyNo          申请编号
*/
function workflowdetail(processInstID,activityInstID,workItemID,actionUrl,activityDefID,activityDefName,applyNo){

	//设置模态窗口的大小
	var iWidth = window.screen.width * (3/4);   //弹出窗口的宽度;
    var iHeight = window.screen.height * (3/4); //弹出窗口的高度;
    
    //弹出模态窗口
    showModalCenter("com.yd.soa.bpsclient.comm.queryworkflowinfo.flow?processInstID="+processInstID+"&activityInstID="+activityInstID+"&workItemID="+workItemID+"&actionUrl="+actionUrl+"&activityDefID="+activityDefID+"&activityDefName="+encodeURIComponent(activityDefName)+"&applyNo="+applyNo,null,null,iWidth,iHeight,"流程信息查看页面");
}
/**
*回调函数
*/
function callBack(value){
	//alert(value)
	if(value == "submit"){
		try{
			
			if(jQuery('#_YD_WF_JUMP_IFRAME_201208221514', parent.document).length>0) {
		
				parent.backHomeList(true);
			} else {
				window.close();
				//
				window.location.href="com.yd.soa.bpsclient.comm.queryunapplyworkflow.flow";
			}
		}catch(e){
			//alert(e.message);
		}
		
	}
}

/*
 *文件下载
 雷晓华
 传入参数：fileID
 */

function downLodFile(fileID){
	var frm = $name("data_form");
	//window.location.href="com.yd.soa.bpsclient.comm.downLoadFile.flow?_eosFlowAction=downLoadFile"+"&fileID="+fileID;
	window.location.href=contextPath+"/down.servlet?fileID="+fileID;
}

function downLodFiles(fileIDs){
	var frm = $name("data_form");
	window.location.href="com.yd.soa.bpsclient.comm.downLoadFiles.flow?_eosFlowAction=downLoadFile"+"&fileIDs="+fileIDs;
}

/*
 *  实现去除左右空格
 */
function trimspace(obj){
	obj.value = trim(obj.value);
}


function fucCheckLength(objs,maxlength){   
	var strTemp =  objs.value;
	var i,sum;   
	sum=getBytesLen(objs.value);
	if(sum > maxlength){
		f_alert(objs,"输入文字过长！");
		return false;
	}else{
		return true;
	}
}

/* 
 * Stephen.dong
 * 全屏显示打开一个新窗口
 */
function openFullWindow(urlPath,winName){
		var objNewWin;				
	    var w=screen.availWidth-8;
		var h=screen.availHeight-32;
		//objNewWin = window.open(urlPath,winName,"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=" + w + ",height=" + h + ",top=0,left=0");
		objNewWin = window.open(urlPath,winName,"toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=0,width=" + w + ",height=" + h + ",top=0,left=0,scrollbars=yes");
}
/*
*
* 根据输入的汉字字符fData判断长度 中文字符所占数据库位数为zhLength
*返回总长度
*/
function YDDataLegnth(fData,zhLength){
	var intLength=0;
	if(fData==undefined || fData==null|| fData=="") return intLength;
	for(var i=0;i<fData.length;i++){
		if(fData.charCodeAt(i)<0 || fData.charCodeAt(i)>255){
			intLength +=zhLength;
		}else{
			intLength +=1
		}
	}
	return intLength;
}

/**
查看员工信息
*/
function showEmpDetailInfo(empid,operatorid) {
		var parm="iEmpid="+empid+"&lOperatorid="+operatorid;
		var sUrl="com.yd.soa.org.employee.EmpOprOrgModify.flow?"+parm;
		showModalCenter(sUrl,null,null,500,400,"查看用户信息");
	}
	
//校验是已存在
function checkIsExsitValue(obj,entity,pproperty,pvalue,property,value,msgs)
{
	if( "" == obj.value ||"" == value)
	{
		return false;
	}
	var myAjax= new Ajax('com.yd.soa.comm.utils.commUtils.checkIsExsit.biz');
	
	myAjax.addParam('entity',entity);
	
	myAjax.addParam('pproperty',pproperty);
	myAjax.addParam('pvalue',pvalue);
	
	myAjax.addParam('property',property);
	myAjax.addParam('value',value);
	
	myAjax.submit();
	//alert(msgs);
	var value= myAjax.getValue("root/data/count"); // 根据xpath获得返回后台传回的返回值
	if(0 != value){
		//f_alert(obj,msgs);
		//obj.focus();
		//obj.select();
		//obj.value = ""
		//alert();
		//存在
		return false;
	}
	else
	{
		//不存在
		return true;
	}
}

/**
查询显示 流程相关文档，常用于 申请页面，显示如协议等文档
*/
function showProcessDocList(processDefName,divid){
	var myAjax = getProcessDocList(processDefName);
	if(null!=myAjax){
		var recordid = "";
		var t = "";
		var recordids= myAjax.getValues("root/data/bpsDocs/recordid");
		var dNames= myAjax.getValues("root/data/bpsDocs/dName");
		//alert(recordids);
		//alert(dNames);
		for(var i=0;i<recordids.length;i++){
			
			var st = "<a href=javascript:docView(";
			st += recordids[i];
			st +=",'0,0',1,'');>";
			st += "<font style='color:red'>" + dNames[i] + "</font>";
			st +='</a>';
			
			t+= st+"&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		//$id(divid).innerHTML = t;
		return t;
	}
	
}
function getProcessDocList(processDefName){
	var url= "com.yd.soa.bpsclient.helptopic.ydbpshleptopicbiz.queryBpsDocs.biz";
	var myAjax= new Ajax(url);
	
	myAjax.addParam('processDefName',processDefName);
	myAjax.onFailure = function(exception){
		//return null;
	}
	myAjax.submit();
	//alert(msgs);
	//var value= myAjax.getValue("root/data/count"); // 根据xpath获得返回后台传回的返回值
	return myAjax;
}
function  docView(RecordID,EditType,ShowType,lookupdoc){
		if(lookupdoc==null || lookupdoc=="0"||lookupdoc==""){
			//不做权限判断，表示：有权限发起该流程的人员，都可以查阅和下载相关文档
			//alert("您没有此文档的查看权限！");
			//return;
		}
		var EditType="0,0";
		var ShowType="1";
	    var action = "com.yd.soa.document.viewdoc.flow";
	    var url = action+"?RecordID="+RecordID+"&EditType="+EditType+"&ShowType="+ShowType;
	    openFullWindow(url,"查看文档"+new Date().getTime());
}



function cls(){ 
	//捕获触发事件的对象，并设置为以下语句的默认对象 
	with(event.srcElement) 
	     //如果当前值为默认值，则清空 
	if(value==defaultValue) value="" 
} 
function res(){ 
	//捕获触发事件的对象，并设置为以下语句的默认对象 
	with(event.srcElement) 
	//如果当前值为空，则重置为默认值 
	if(value=="") value=defaultValue 
} 


/**
* 关闭操作
*/
function windowclose(){
	try{
		window['returnValue']="close";
		window.close();
		reloadHistoryWin();
	}catch(e){
		reloadHistoryWin();
	}
}

//转换部门路径
function replaceFullOrgName(_orgname,_fullorgname,_orytype){
		var companyfullname = _fullorgname;//部门全称
		var indexO = 0;
		if(_orytype == "1"){
			indexO = 1;
		}
		
		if(_orytype == "2"){
			indexO = 3;
		}
		
		if(_orytype == "5"){
			indexO = 3;
		}
		
		if(indexO != 0){
			var tempstr="";
			var strarray = companyfullname.split("/");
			for(var i=0;i<strarray.length;i++){
				if(i >= indexO){
					tempstr += strarray[i]+"/";
				}
			}
			
			if(strarray.length > 0){
				companyfullname = tempstr.substring(0,tempstr.length-1);
			}
		}else{
			companyfullname = companyfullname.substring(companyfullname.lastIndexOf("/")+1,companyfullname.length);
		}
		$name(_orgname).value = companyfullname;
	}

	
function changeFileSizeUnit(s,type)
{
	if(undefined == type ||null == type)
		type = "M";
	if("M" == type || "m" == type)
	{
		var s1= s*1;
		return formatNumber(eval(s1/1024/1024),"###.000000");
	}else if("K" == type || "k" == type)
	{
		var s1= s*1;
		return formatNumber(eval(s1/1024),"###.000");
	}else 
	{
		return s;
	}
}

function Map() {
 var struct = function(key, value) {
  this.key = key;
  this.value = value;
 }
 
 var put = function(key, value){
  for (var i = 0; i < this.arr.length; i++) {
   if ( this.arr[i].key === key ) {
    this.arr[i].value = value;
    return;
   }
  }
   this.arr[this.arr.length] = new struct(key, value);
 }
 
 var get = function(key) {
  for (var i = 0; i < this.arr.length; i++) {
   if ( this.arr[i].key === key ) {
     return this.arr[i].value;
   }
  }
  return null;
 }
 
 var remove = function(key) {
  var v;
  for (var i = 0; i < this.arr.length; i++) {
   v = this.arr.pop();
   if ( v.key === key ) {
    continue;
   }
   this.arr.unshift(v);
  }
 }
 
 var size = function() {
  return this.arr.length;
 }
 
 var isEmpty = function() {
  return this.arr.length <= 0;
 } 
 this.arr = new Array();
 this.get = get;
 this.put = put;
 this.remove = remove;
 this.size = size;
 this.isEmpty = isEmpty;
}
//var map = new Map();
//map.put("re","redhacker");
//alert("map的大小为：" + map.size())
//alert("key为re的map中存储的对象为：" + map.get("re"));

