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
		var image=new Image(); 
		image.dynsrc=filename;
		if(image.fileSize > 1024*5000){
			alert("--上传文件大于5M-"); 
			obj.outerHTML=obj.outerHTML.replace(/(value=\").+\"/i,"$1\"");
		}
	}else{
		alert("--上传文件格式不正确--");
		obj.outerHTML=obj.outerHTML.replace(/(value=\").+\"/i,"$1\"");
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
	if(value == "submit"){
		window.close();
	}
}

/*
 *文件下载
 雷晓华
 传入参数：fileID
 */

function downLodFile(fileID){
	var frm = $name("data_form");
	window.location.href="com.yd.soa.bpsclient.comm.downLoadFile.flow?_eosFlowAction=downLoadFile"+"&fileID="+fileID;
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