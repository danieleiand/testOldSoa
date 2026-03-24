<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://eos.primeton.com/tags/html" prefix="h"%>
<%@page import="org.gocom.abframe.auth.bizlet.SkinUtil"%>
<%@page import="org.gocom.abframe.ABFConfigKey"%>
<script type="text/javascript">
	var contextPath = "<%=request.getContextPath()%>";	 // you should define the contextPath of web application
	var EOSDEBUG = false;
	var FINAL_PANEL_HEIGHT = 22;
	<%-- manager(group_manager.jsp)主页面中iframe需要减少的高度 --%>
	var IFRAME_MODIFY_HEIGHE = 35;
	<%-- tree(group_tree.jsp)页面中tree需要减少的高度 --%>
	var TREE_MODIFY_HEIGHT = 22;
</script>
<h:script src="/common/scripts/eos-web.js" />
<%@page import="com.primeton.widget.cache.CacheUtil"%>
<%
   
	String skin=null;
    skin=CacheUtil.getUserStyle(session);
 %>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>

<html>
<!-- 
  - Author(s): Administrator
  - Date: 2010-05-27 14:33:20
  - Description:
-->
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/portal/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/webui/ext/skins/<%=skin%>/css/portal.css" />

</head>
<body style="background-color:transparent;margin:0px;overflow:hidden">

<form name="msgform">
<TABLE width="100%" class="topbar" id="usermsg">
<TR height="25">
	<TD align="right" width="100%" valign="top">
	

欢迎您，${portal_user.userName}！ &nbsp;&nbsp;&nbsp
<a  href="https://yunda.yuque.com/books/share/994841be-452d-4d2c-806d-2785c330a8c2/oqazi7" target="view_window"><span style="background-repeat:no-repeat;padding-left:20px;" class="widget-weixin">更多帮助</span></a>&nbsp;&nbsp;&nbsp
<a  href="#" onclick="showOrgInfos()"><span style="background-repeat:no-repeat;padding-left:20px;" class="widget-layout">组织机构</span></a>

<%--<a  href="#" onclick="showTongxunlu()"><span style="background-repeat:no-repeat;padding-left:20px;" class="widget-rtxlogo">RTX通讯</span></a>--%>
<a  href="#" onclick="showTongxunlu()"><span style="background-repeat:no-repeat;padding-left:20px;" class="widget-rtxlogo">通讯录</span></a>
<a  href="#" onclick="soaMobile()" ><span style="background-repeat:no-repeat;padding-left:20px"class="widget-mobilesoft">个人信息</span></a>
<!--<a  href="#"onclick="doSetLayOut()"><span style="background-repeat:no-repeat;padding-left:20px;" class="widget-layout">设置布局</span></a>

<a  href="#" onclick="doAddWidget()" ><span style="background-repeat:no-repeat;padding-left:20px"class="widget-config">新增组件</span></a>

<a  href="#" onclick="doAddTheme()" ><span style="background-repeat:no-repeat;padding-left:20px"class="widget-theme">新增主题</span></a>-->
<!-- <a  href="#" onclick="doChangeSkin()" ><span style="background-repeat:no-repeat;padding-left:20px"class="widget-skin">更换皮肤</span></a> -->
<!--<a  href="#" onclick="doReset()" ><span style="background-repeat:no-repeat;padding-left:20px"class="widget-skin">重置主页</span></a>-->

<a  href="http://isupport.yundasys.com:30888/soaPass" target="view_window"><span style="background-repeat:no-repeat;padding-left:20px"class="widget-password">密码修改</span></a>
<a  href="#" onclick="doLogOut()" ><span style="background-repeat:no-repeat;padding-left:20px"class="widget-exit">系统退出</span></a>

<!-- 
<select onchange=doSetSkin(this)>
<option value="defautl">default</option>
<option value="skin1">skin1</option>
</select>
 -->

</TD>
</TR>

</TABLE>
</form>
<script>
var rolePatten = "${portal_user.rolePatten}";

function soaMobile(){

//var url = "http://soa.yundasys.com:20088/ydsoa/mb.html";
var url = "<%=request.getContextPath()%>/com.yd.soa.comm.myinfo.ShowMyInfo.flow";
window.top.portalUtil.showWindowOnSameTab(url,"个人信息",'soaMobile');

}

function changePassword(){
	var url = "org.gocom.abframe.auth.PasswordChange.flow?_eosFlowAction=begin";
window.top.portalUtil.showWindowOnSameTab(url,"密码修改",'changePassword');
}

function showOrgInfos()
{	
	var url = "com.yd.soa.comm.org.view.ViewOrgPage.flow?listUrl=com.yd.soa.comm.org.view.ViewUserList.flow&viewTypeName=员工&viewType=user";
	window.top.portalUtil.showWindowOnSameTab(url,"组织机构",'showOrg');
}

function showTongxunlu()
{
	//showWindowOnSameTab
	var url = "com.yd.soa.org.organization.OrgManager.flow";
	//alert(menuaction);
	var title = "通讯录";
	
	var l = title.length;
	if(l > 5)
	{
		title = title.substring(0,5);//考虑到主题字数可能很多，tab标题太长显得不是很美观，所以暂限定为5个字，超过的取前五个
		title += "...";
	}
	
	try{
		window.top.portalUtil.showWindowOnSameTab(url,title,'addressBook');
	}catch(e)
	{
		//window.open(url);
	}
}

function doLogOut()
{
 	top.portalUtil.logout();
 	/*
	if(confirm("确定退出吗？")){
	parent.window.opener = null;
	parent.window.close();
	}
	*/
}

function doAddWidget()
{
   top.showDialog('addWidget.ui',null,null,top,null,null);
}


function doAddTheme()
{
  top.showDialog('addTheme.ui',null,null,top,null,null);
}


function doSetLayOut()
{
top.showDialog('layout.ui',null,null,top,null,null);
}

function doChangeSkin()
{
  top.showDialog('selectSkin.ui',null,null,top,null,null);
}

function doSetSkin(o)
{
var url = "<%=request.getContextPath()%>/portal/action/saveSkin.jsp?skin=" + o.value;
top.ajaxCall(url, {}, function() {
				top.location.reload();
				//top.location = top.location;
			}, function() {
				alert("Failed to change skin!");
			});
}

function doReset()
{
	top.portalUtil.resetPortalInfo()
}

window.onload =function()
{
	//window.parent.document.title="普元Portal系统";
	window.parent.document.title="韵达SOA统一平台 - "+"${portal_user.userName}";
	
	
	
}


var voteAjax = new Ajax("com.yd.soa.vote.vote.countVoteingAjax.biz");
	voteAjax.addParam("_random",Math.random());
	voteAjax.submit();
	var myVoteCount = voteAjax.getValue("root/data/countVoteing");
	myVoteCount == null? 0 : myVoteCount;

	 if(myVoteCount > 0 ){
	 
	 		//获取是否登陆提醒
			var isRemind = voteAjax.getValue("root/data/voteMain/istxallowed");
			
			// 获取是否需要强制投票
			var isEnforced = voteAjax.getValue("root/data/voteMain/isqzallowed");
			
			// 获得到提醒日期
			var remindTime = voteAjax.getValue("root/data/voteMain/remindtime");
			// alert(remindTime);
			// 获取结束时间
			var endTime= voteAjax.getValue("root/data/voteMain/enddate");
				endTime=endTime.substring(0,19);
				// alert(endTime);
			// 获取当前时间  如果day <= remindTime ，那么就提醒 
			var currentTime = new Date() ;
				
			var end = new Date(endTime.replace(/-/g, "/"));
			var day = end.getTime() - currentTime.getTime();
				day = parseInt(day / (1000 * 60 * 60 * 24));
	 
	 	if(1==isRemind){
	 		if(1==isEnforced)
			{	
				window.top.showModalCenter("com.yd.soa.vote.voting.flow",null,null,1100,600,"您有未完成的投票活动");
			}
			else if ((remindTime>=day&&day>=0)||""==remindTime)
			{	
				window.top.showModalCenter("com.yd.soa.vote.voting.flow",null,null,1100,600,"您有未完成的投票活动");
			}
		}	
	 }
	




/** 待参与的投票与问卷
var voteAjax = new Ajax("com.yd.soa.vote.vote.checkVoteWenjuan.biz");
	voteAjax.addParam("_random",Math.random());
	voteAjax.submit();	
	var flag = voteAjax.getValue("root/data/flag");
	
	if(flag=="1")
	{
		window.top.showModalCenter("com.yd.soa.vote.waitVoteAndWenjuan.flow",null,null,800,600,"待参与的投票(问卷)");
	}
	**/
	
	
</script>
<script src="<%=request.getContextPath()%>/portal/js/message.js"/>
</body>
</html>


<%

String openTabCount = BusinessDictUtil.getDictName("YD_CONFIG","openTabCount");

%>

<script type="text/javascript">
	window.parent.openTabCount = "<%= openTabCount %>";
</script>
