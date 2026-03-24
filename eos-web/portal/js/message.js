function  showUserUnWorkItem(){
  var url = "com.yd.soa.bpsclient.comm.queryUserUnWorkItem.flow";
   window.top.portalUtil.showWindowOnSameTab(url,"待办事宜",'showUserUnWork');
}

function  showMyDocument(){
   var url = "com.yd.soa.mydocument.sendDocmentFrame.flow?flag=1&isread=0";
   window.top.portalUtil.showWindowOnSameTab(url,"我接收的公文",'showMyDocument');
}

function  showMyVote(){
   var url = "com.yd.soa.vote.receivevote.flow?votestatus=1&canxuanStatus=0";
   window.top.portalUtil.showWindowOnSameTab(url,"待参与的投票评选活动",'showMyVote');
}

function  showMyWenjuan(){
   var url = "com.yd.soa.wenjuan.queryWenjuaned.flow";
   window.top.portalUtil.showWindowOnSameTab(url,"待参与的问卷调查",'showMyWenjuan');
}

function  showMylcgt(){
   var url = "com.yd.soa.bpsclient.comm.queryunapplyworkflow.flow?CONDITION=7";
   window.top.portalUtil.showWindowOnSameTab(url,"待办流程沟通",'showMylcgt');
}

function  showMyyblcgt(){
   var url = "com.yd.soa.bpsclient.comm.queryapplyworkflow.flow?CONDITION=7";
   window.top.portalUtil.showWindowOnSameTab(url,"已办流程沟通",'showMylcgt');
}

function  showMylcgz(){
   var url = "com.yd.soa.bpsclient.newGaozhiFenlei.queryUserUnWorkItem.flow?ISYD=0";
   window.top.portalUtil.showWindowOnSameTab(url,"告知我的流程",'showMylcgz');
}

function  showMyWorkflow(){
   var url = "com.yd.soa.bpsclient.comm.draftWorkflow.flow?CONDITION=4&source=top_count";
   window.top.portalUtil.showWindowOnSameTab(url,"我发起的流程",'showMyWorkflow');
}


function setPortalTipCountData(type,value,op){
	try{
		var tv = document.getElementById(type).innerHTML;
		if(0 > op )
			document.getElementById(type).innerHTML = eval(tv + op);
		else if(0 < op)
			document.getElementById(type).innerHTML = eval(tv + op);
		else
			document.getElementById(type).innerHTML = value;
			
	}catch(ex){
	}
		
}

var isWDUser = rolePatten.indexOf(",YD_WD_USER,");

function getTopUserMsg(){
    var form = $name("msgform");
    var msg = document.getElementById("usermsg"); 
    if(msg.rows.length == 2){
      msg.deleteRow(eval("unworkTr").rowIndex);
    }
    
    
    var sessionAjax = new Ajax("com.yd.soa.comm.utils.commUtils.getLoginUserSession.biz");
	sessionAjax.addParam("_random",Math.random());
	sessionAjax.submit();
	var islogin = sessionAjax.getValue("root/data/retUser/userid");
	
	//alert(islogin);
    if( "" == islogin ||  "null" == islogin ||  null == islogin ){
    	var msg_tr = msg.insertRow(-1);
        msg_tr.id="unworkTr";
        msg_tr.height="25"; 
    	var msg_td = msg_tr.insertCell(-1);
        msg_td.width="100%"; msg_td.valign="top"; msg_td.align="right"; 
        msg_td.innerHTML = "";
        msg_td.innerHTML += "您有<a href='javascript:;' onclick='showMyWorkflow()'><span id='showMyWorkflow' style='color:red; font-weight: bold;'>"+ 0 +"</span>个已同意流程</a>　|　";
        msg_td.innerHTML += "<a href='javascript:;' onclick='showUserUnWorkItem()'>待办事宜(<span id='showUserUnWorkItem' style='color:red; font-weight: bold;'>"+ 0 +"</span>)</a>　|　";
        if(isWDUser == -1){ msg_td.innerHTML += "<a href='javascript:;' onclick='showMyDocument()'>已收公文(<span id='showMyDocument' style='color:red; font-weight: bold;'>"+ 0 +"</span>)</a>　|　"; }
        msg_td.innerHTML += "<a href='javascript:;' onclick='showMyVote()'>可参与的投票(<span id='showMyVote' style='color:red; font-weight: bold;'>"+ 0 +"</span>)</a>　|　";
        msg_td.innerHTML += "<a href='javascript:;' onclick='showMyWenjuan()'>可参与的问卷(<span id='showMyWenjuan' style='color:red; font-weight: bold;'>"+ 0 +"</span>)</a>　|　";
        msg_td.innerHTML += "流程沟通[<a href='javascript:;' onclick='showMylcgt()'>待办沟通(<span id='showMylcgt' style='color:red; font-weight: bold;'>"+ 0 +"</span>)</a>　<a href='javascript:;' onclick='showMyyblcgt()'>已办沟通(<span style='color:red; font-weight: bold;'>"+ 0 +"</span>)</a>]  ";
        msg_td.innerHTML += "　|　<a href='javascript:;' onclick='showMylcgz()'>未读告知流程(<span id='showMylcgz' style='color:red; font-weight: bold;'>"+ 0 +"</span>)</a>";
        
    	return;
    }
    //待办事宜
    var mAjax = new Ajax("com.yd.soa.comm.mydocument.queryjieshoudoc.queryDaibanCountExt.biz");
	mAjax.addParam("_random",Math.random());
	mAjax.submitForm(form);
	var myUnWorkCount = mAjax.getValue("root/data/count");
	
	//已收公文
	if(isWDUser == -1){ //对网点用户不显示公文
	 var gwAjax = new Ajax("com.yd.soa.mydocument.YDSendDocument.getIsReadDocumentCount.biz");
	 gwAjax.addParam("_random",Math.random());
	 gwAjax.submitForm(form);
	 var myDocumentCount = gwAjax.getValues("root/data/documentCount");
	}
	
	//可参与的投票
	var voteAjax = new Ajax("com.yd.soa.vote.vote.countVoteingAjax.biz");
	voteAjax.addParam("_random",Math.random());
	voteAjax.submitForm(form);
	var myVoteCount = voteAjax.getValue("root/data/countVoteing");
	    myVoteCount == null? 0 : myVoteCount;
	
	//可参与的问卷 
	var wjAjax = new Ajax("com.yd.soa.wenjuan.wenjuan.getWenjuanCount.biz");
	wjAjax.addParam("_random",Math.random());
	wjAjax.submitForm(form);
	var myWenjuanCount = wjAjax.getValue("root/data/wenjuanCount");
	    myWenjuanCount == null? 0 : myWenjuanCount;
	
	
	//待办流程沟通
	var lcjAjax = new Ajax("com.yd.soa.bpsclient.comm.queryunapplyinfo.getUserUnworkItem.biz");
	lcjAjax.addParam("_random",Math.random());
	lcjAjax.submitForm(form);
	var mylcgtCount = lcjAjax.getValue("root/data/countUnworkItem");
	
	//已办流程沟通
	var ybjAjax = new Ajax("com.yd.soa.bpsclient.comm.queryunapplyinfo.getUserWorkItem.biz");
	ybjAjax.addParam("_random",Math.random());
	ybjAjax.submitForm(form);
	var mylcybgtCount = ybjAjax.getValue("root/data/countWorkItem");
	
	//告知
	var lcjAjax = new Ajax("com.yd.soa.bpsclient.comm.queryGZWorkflow.getUserGzworkItem.biz");
	lcjAjax.addParam("_random",Math.random());
	lcjAjax.addParam("ISYD","0");
	lcjAjax.submitForm(form);
	var mylcgzCount = lcjAjax.getValue("root/data/countGzWorkItem");
	
	//已同意的我发起的流程
	var myWfjAjax = new Ajax("com.yd.soa.bpsclient.comm.queryDraftInfo.countDrafInfos.biz");
	//myWfjAjax.addParam("_random",Math.random());
	//myWfjAjax.addParam("oa_applyinfo/CONDITION","4");
	myWfjAjax.submitXML("<oa_applyinfo><CONDITION>4</CONDITION></oa_applyinfo>")
	//myWfjAjax.submit();
	var myWfCount = myWfjAjax.getValue("root/data/countInfo/countWF")==""? 0 : myWfjAjax.getValue("root/data/countInfo/countWF");
	
    
    var msg_tr = msg.insertRow(-1);
        msg_tr.id="unworkTr";
        msg_tr.height="25"; 
    var msg_td = msg_tr.insertCell(-1);
        msg_td.width="100%"; msg_td.valign="top"; msg_td.align="right"; 
        msg_td.innerHTML = "";
        msg_td.innerHTML += "您有<a href='javascript:;' onclick='showMyWorkflow()'><span id='showMyWorkflow' style='color:red; font-weight: bold;'>"+ myWfCount +"</span>个已同意流程</a>　|　";
        msg_td.innerHTML += "<a href='javascript:;' onclick='showUserUnWorkItem()'>待办事宜(<span id='showUserUnWorkItem' style='color:red; font-weight: bold;'>"+ myUnWorkCount +"</span>)</a>　|　";
        if(isWDUser == -1){ msg_td.innerHTML += "<a href='javascript:;' onclick='showMyDocument()'>已收公文(<span id='showMyDocument' style='color:red; font-weight: bold;'>"+ myDocumentCount +"</span>)</a>　|　"; }
        msg_td.innerHTML += "<a href='javascript:;' onclick='showMyVote()'>可参与的投票(<span id='showMyVote' style='color:red; font-weight: bold;'>"+ myVoteCount +"</span>)</a>　|　";
        msg_td.innerHTML += "<a href='javascript:;' onclick='showMyWenjuan()'>可参与的问卷(<span id='showMyWenjuan' style='color:red; font-weight: bold;'>"+ myWenjuanCount +"</span>)</a>　|　";
        msg_td.innerHTML += "流程沟通[<a href='javascript:;' onclick='showMylcgt()'>待办沟通(<span id='showMylcgt' style='color:red; font-weight: bold;'>"+ mylcgtCount +"</span>)</a>　<a href='javascript:;' onclick='showMyyblcgt()'>已办沟通(<span style='color:red; font-weight: bold;'>"+ mylcybgtCount +"</span>)</a>]  ";
        msg_td.innerHTML += "　|　<a href='javascript:;' onclick='showMylcgz()'>未读告知流程(<span id='showMylcgz' style='color:red; font-weight: bold;'>"+ mylcgzCount +"</span>)</a>";
        
        
   		//setTimeout(getTopUserMsg,1800000); //getTopUserMsg 外边执行业务后 已经立即调用，定时刷新的此种写法也是错误的，操作办理业务越多 界面定时任务越多。影响性能,stephen.dong 2014-03-11  注释掉
   }
   
//getTopUserMsg();
window.onload = getTopUserMsg;