<h:script src="/ydsoacomm/jquery/jquery-1.7.1.min.js"/>
<h:script src="/bpsyewu/contractseal/ydywcontractseal_edit.js" /><!-- 合同盖章引用js -->
<script>

jQuery.noConflict();

/**
*审批意见设置
*/
function changer(obj){
		if(obj.value == "1"){
			$name("isagree").value="1";
		}else{
			$name("isagree").value="0";
		}
	}
/**
*关闭父窗口
*/
function closewindow(){
	window['returnValue']="close";
	window.close();
}

/**
* 暂存处理
*/
function sub(){
	var frm = $name("data_form");
	if(checkForm(frm)){
		var question = confirm("是否确认提交！");
		if(question){
			var flag = "1";
			var APPROVER = $name("oaapprovalinfo/APPROVER");
			if(!fucCheckLength(APPROVER,32)){
		    	flag="0";
		    }
			var APPROVEVER = $name("oaapprovalinfo/APPROVEVER");
			if(!fucCheckLength(APPROVEVER,512)){
		    	flag="0";
		    }
		    if(flag=="1"){
		    	$id("tijiao").disabled=true;
		    	
		    	//合同盖章解锁操作，总部法务部初审、财务部门：
                <l:in property="activityDefID" targetValue="YD_ZB_CW,YD_ZB_FWB_CS">
                	if(unlockCurrentActivity("<b:write property='processInstID'/>","<b:write property='activityDefID'/>","<b:write property='userObject/userId' scope='session'/>","<b:write property='userObject/userName' scope='session' />")){
					}else{
			      		$id("tijiao").disabled=false;
			      		return;
			      	} 
                </l:in>
		    	
		    	frm.submit();
		    	window['returnValue']="sub";
				//window.close();
		    }
			
		}
	}
}

/**
* 暂存处理
*/
function save(){
	var approveno = $name("oaapprovalinfo/APPROVENO").value;
	var applyno = $name("oaapprovalinfo/APPLYNO").value;
	var approver = $name("oaapprovalinfo/APPROVER").value;
	var approvedate = $name("oaapprovalinfo/APPROVEDATE").value;
	var approvever = $name("oaapprovalinfo/APPROVEVER").value;
	var isagree = $name("isagree").value;
	var activitydefid = $name("oaapprovalinfo/ACTIVITYDEFID").value;
	var processinstid = $name("oaapprovalinfo/PROCESSINSTID").value;
	var activitydefname = $name("oaapprovalinfo/ACTIVITYDEFNAME").value;
	var myAjax= new Ajax('com.yd.soa.bpspersonel.apply.ajaxSaveZcInfo.bizx');
	myAjax.addParam('approveno',approveno);
	myAjax.addParam('applyno',applyno);
	myAjax.addParam('approver',approver);
	myAjax.addParam('approvedate',approvedate);
	myAjax.addParam('approvever',approvever);
	myAjax.addParam('isagree',isagree);
	myAjax.addParam('activitydefid',activitydefid);
	myAjax.addParam('processinstid',processinstid);
	myAjax.addParam('activitydefname',activitydefname);
	myAjax.submit ();
	var value= myAjax.getValue("root/data/success");
	if(value == "true"){
		alert("暂存成功！");
	}else{
		alert("暂存失败！");
	}
    
}





function init(){
	/*
	var saveflg = $name("saveflg").value;
	if(saveflg == "7"){
		alert("保存员工信息到EHR失败！");
	}else if(saveflg == "8"){
		window.close();
	}*/
}


jQuery(function(){
	
	init();	
	//jQuery("#oaapprovalinfo_APPROVEVER").val("aaa");
	jQuery("#oaapprovalinfo_APPROVEVER").attr("disabled",true);
	jQuery("#oaapprovalinfo_APPROVEVER").attr("title","同意");
	jQuery("#oaapprovalinfo_APPROVEVER").val(jQuery("#oaapprovalinfo_APPROVEVER").attr("title"));
	jQuery("#oaapprovalinfo_APPROVEVER").blur(
		function(){
			if(null == this.value || "" == this.value){ this.value = this.title}
		}
	);
	
	jQuery("#oaapprovalinfo_APPROVEVER").focus(
		function(){
			//alert();
			if(this.title == this.value ){ this.value = ""}
		}
	);
	
	//异步获取当前流程所有的可沟通环节，并将环节附加到环节选择区
	jQuery.ajax({
		url: "<%=request.getContextPath()%>/com.yd.soa.bpsclient.comm.CommunicateMgr.queryActivitiesByFinshed.biz.ext",
		type: "post",
		dataType: "json",
		data: {
			processinstid: <b:write property="processInstID"/>
		}
	}).success(function(data, textStatus, jqXHR){
		var checkboxstring = "";
		if(data.results) {
			jQuery.each(data.results, function(key, value){
				checkboxstring += "<input type=\"checkbox\" name=\"cate/conactivities\" value=\""+ value.ACTIVITYDEFID +"\">";
				checkboxstring += value.ACTIVITYDEFNAME + "&nbsp;&nbsp;";
				if((key+1)%3==0) { 
					checkboxstring += "<br>";
				}
			});
			jQuery("#cateactivity").append(checkboxstring);
		}
	}).error(function(jqXHR, textStatus, errorThrown){
		
		alert("获取沟通环节出错！");
	});
	
	jQuery("#catecheckbox").click(function(){
	
		if(jQuery(this).attr("checked")){
			jQuery("#catediv").css("display", "block");
			jQuery("#auditdiv").css("display", "none");
			jQuery("#catebutton").removeAttr("disabled");
			
			jQuery("#oaapprovalinfo_APPROVEVER").attr("disabled",true);
			
		} else {
			jQuery("#catediv").css("display", "none");
			jQuery("#auditdiv").css("display", "block");			
			jQuery("#catebutton").attr("disabled", "disabled");
			//jQuery("#oaapprovalinfo_APPROVEVER").val("同意");
			
			jQuery("#oaapprovalinfo_APPROVEVER").removeAttr("disabled");
		}			
	});
	
	
	jQuery("#resetcate").click(function(){
		jQuery("#catecondesc").val("");
		jQuery("#cateactivity input:checked").attr("checked",false);
	});
	
	jQuery("#catebutton").click(function(){
			
		var conactivities = {};
		
		if(jQuery("#cateactivity input:checked").length==0){
			alert("请选择沟通环节！");
			return false;
		};
		
		jQuery.each(jQuery("#cateactivity input:checked"), function(key, value) {
			
			if(jQuery(this).attr("checked")) {
				conactivities["conactivities[" + key + "]"] = jQuery(this).val();
			}
		});
						
		var condesc = jQuery("#catecondesc").val();
		
		if(jQuery.trim(condesc).length==0) {
			
			alert("沟通内容不能为空！");			
			return false;
		}
		
		if(condesc.length >=1000) {
			alert("沟通内容不能大于1000个字符！");
			return false;
		}
		
		conactivities["cate/condesc"] = condesc;		
		conactivities["cate/workitemid"] = <b:write property="workItemID"/>;
		conactivities["applyno"] = <b:write property="applyNo"/>;
		//alert(conactivities)
		jQuery.ajax({
			
			url: "com.yd.soa.bpsclient.comm.CommunicateMgr.insert.biz.ext",
			data: conactivities,
			type: "post",
			dataType: "json",
			beforeSend: function(){
				jQuery("#catebutton").attr("disabled", true);
			}
		}).success(function(data, textStatus, jqXHR){
			
			if(data.success && data.success=="0") {
				alert("沟通信息保存成功！");
				reloadHistoryWin();
			} else {
				alert("沟通信息保存失败！");
			}
			
			jQuery("#catebutton").attr("disabled", false);
			parent.parent.frames("topmsg").getTopUserMsg();
		}).error(function(jqXHR, textStatus, errorThrown){
			alert("沟通信息保存失败！");
			jQuery("#catebutton").attr("disabled", false);
		});		
	});
	
	jQuery("#catecheckbox").attr("checked", false);
	jQuery("#catecheckbox").trigger("click");
	jQuery("#catecheckbox").attr("checked", false);

});


function reloadHistoryWin(){
	//try{
	//	jQuery("#history", content.document).attr("src", jQuery("#history", content.document).attr("src"));		
	//} catch(e) {}
	
	if(jQuery('#_YD_WF_JUMP_IFRAME_201208221514', parent.document).length>0) {
		
		parent.backHomeList(false);
		return ;
	}
	
	var url = jQuery("#formaction251146").val();
	
	if(url && url.length >=5) {
	
	} else {
		url = "com.yd.soa.bpsclient.comm.queryunapplyworkflow.flow";;
	}
	//alert(url)
	window.location.href = url;
}

</script>