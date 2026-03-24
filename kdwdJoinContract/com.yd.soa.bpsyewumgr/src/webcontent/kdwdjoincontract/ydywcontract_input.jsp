<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib uri="/WEB-INF/tlds/ydcomm.tld" prefix="yd"%>
<%@include file="/common.jsp"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      网点加盟合同签批申请流程
    </title>
    <h:script src="/ydsoacomm/jquery/jquery-1.7.2.min.js"/>
    
    <h:script src="/ydsoacomm/flashupload/flashupload.js" />
    <h:script src="/ydsoacomm/flashupload/flashupload_comm.js" />
    <h:css href="/common/comm_style.css"/>
    <script type="text/javascript">
      var $jq = jQuery.noConflict();
      var app_name_save = "<%=request.getContextPath()%>";		//项目名称获取
      var relationId = "<b:write property='relationId'/>";		//relationId
      var currentfilename = "ydywcontractseal_view.jsp"; 			//用于log4javascript
      //flash上传的，参数配置
      var path = "handler";									//附件上传的路径（手动配置）通过后台年月日此变量无效
      var filetype = "workflow";							//文件上传所属区分类型（手动配置）
      var fileAllowNull = false;							//附件是否允许为空，true:可以空；false:不可以空（手动配置）
      var btnIds = "submit_id,reset_id";					//在点击“提交”时，需要禁用的按钮ID,不包括上传表单里的“添加”、“删除”（手动配置）
     
  	  window.onload=function(){
  	  	function initDatacellAfterSubmit(datacell) {
	    //自动生成序号
	    	datacell.afterAdd = function(){
	 			var row = datacell.getActiveRow();
		        var rowno = datacell.getAllRows().length;
				var entity = datacell.getEntity(row);
				entity.setProperty("xuhao",rowno);
			 };
	    }
  	  	$id("kdywjyxkz").style.display = "none";
  	  	$id("fzrfrgx").style.display = "none";
	 	$id("fzrfrgx1").style.display = "none";
	 	$id("frname").style.display = "none";
	 	$id("frsfzno").style.display = "none";
	 	$id("fzrfrgxdetail").style.display = "none";

	 	var datacellwdgqxx = $id("wdgqxx"); 
	 	initDatacellAfterSubmit(datacellwdgqxx);
	 	
	 	var processInstId='<b:write property="processInstId" scope="session" />';
	 	if(processInstId!=""||processInstId!=null){
	 	htlxchange();
	 	}
	 	
	  }
	
		function htlxchange(){ 
			var contracttype = $name("applyObject/htlx").value;    
			 if(contracttype == "3"){
			 	$id("kdywjyxkz").style.display = "";
			 	$id("kdywjyxkz01").EOS_extendedAttribute=null;
			 	$id("kdywjyxkz01").validateAttr='allowNull=false';
				$id("wendang").value="特许加盟合同签订需要提供材料：\n1.网点快递业务经营许可证红章版\n2.营业执照红章版\n3.公司章程或到当地工商局查询的公司基本信息查询单红章版\n4.网点法定代表人的身份证或户口簿和其在(门头标准场所门口的七寸彩色照片)红章版\n5.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版\n6.网点从事快递经营活动所需的电话号码清单或缴费充值凭证复印件红章版\n7.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版\n8.网点与其全部员工的劳动合同和员工身份证复印件红章版\n9.网点加盟确认书";
			 }else{
			 	$id("kdywjyxkz").style.display = "none";
			 	$id("kdywjyxkz01").EOS_extendedAttribute=null;
			 	$id("kdywjyxkz01").validateAttr='allowNull=true';
			 	if(contracttype == "1"){
			 		$id("wendang").value="网点合作协议签订需要提供材料：\n1.营业执照红章版\n2.网点法定代表人的身份证或户口簿红章版\n3.租房合同\n4.网点加盟确认书";
			 	}else{
			 		$id("wendang").value="加盟意向书签订需要提供材料：\n1.营业执照红章版 \n2.网点法定代表人的身份证或户口簿红章版 \n3.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版 \n4.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版";
			 	}
			 	
			 }
		}
		function isfzrsametofrchange(){ 
			var isfzrsametofr = $name("applyObject/isfzrsametofr").value;    
			 if(isfzrsametofr == "2"){
			 	$id("fzrfrgx").style.display = "";
			 	$id("fzrfrgx1").style.display = "";
			 	$id("frname").style.display = "";
			 	$id("frsfzno").style.display = "";
			 	$id("frname01").EOS_extendedAttribute=null;
			 	$id("frname01").validateAttr='allowNull=false';
			 	$id("frmobile").EOS_extendedAttribute=null;
			 	$id("frmobile").validateAttr='type=naturalNumber;allowNull=false;maxLength=11';
			 	$id("frsfzno01").EOS_extendedAttribute=null;
			 	$id("frsfzno01").validateAttr='allowNull=false;maxLength=18;minLength=18';
			 	$id("frsfzaddress").EOS_extendedAttribute=null;
			 	$id("frsfzaddress").validateAttr='allowNull=false';
			 }else{
			 	$id("fzrfrgx").style.display = "none";
			 	$id("fzrfrgx1").style.display = "none";
			 	$id("frname").style.display = "none";
			 	$id("frsfzno").style.display = "none";
			 	$id("frname01").EOS_extendedAttribute=null;
			 	$id("frname01").validateAttr='allowNull=true';
			 	$id("frmobile").EOS_extendedAttribute=null;
			 	$id("frmobile").validateAttr='allowNull=true';
			 	$id("frsfzno01").EOS_extendedAttribute=null;
			 	$id("frsfzno01").validateAttr='allowNull=true';
			 	$id("frsfzaddress").EOS_extendedAttribute=null;
			 	$id("frsfzaddress").validateAttr='allowNull=true';
			 }
		}
		function fzrfrgxchange(){ 
			var fzrfrgx = $name("applyObject/fzrfrgx").value;   
			 if(fzrfrgx == "5"){
			 	$id("fzrfrgxdetail").style.display = "";
			 	$id("fzrfrgxdetail").EOS_extendedAttribute=null;
			 	$id("fzrfrgxdetail").validateAttr='allowNull=false';
			 }else{
			 	$id("fzrfrgxdetail").style.display = "none";
			 	$id("fzrfrgxdetail").EOS_extendedAttribute=null;
			 	$id("fzrfrgxdetail").validateAttr='allowNull=true';
			 }
		}
		
    </script>
    <h:css href="/ydsoacomm/scripts/OwesAutoComplete.css"/>
	<h:script src="/bpsyewu/contractseal/OwesAutoComplete.js"/>
  </head>
  <body>
    <div id="conBody" class="conBody">
      <div class="contents">
        <%@ include file="/helptopicView.jsp"%>
        <e:datasource name="applyObject" type="entity" path="com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract.YdYwKdwdjoincontract" />
        <h:form name="query_form" action="com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract_apply.flow" enctype="multipart/form-data" method="post" onsubmit="return checkForm(this);" checkType="blur">
          <h:hidden name="clock" property="version" scope="flow" />
          <h:hidden name="oaapplyinfo/APPCATE" property="helptopic/appcate" />
          <h:hidden property="applyObject/id" />
          <h:hidden property="applyObject/appno" name="applyObject/appno"/>
          <h:hidden property="emp/orgtype" name="applyObject/orgtype" id="orgtype"/>
          <h:hidden property="emp/orgcode"/>
          <h:hidden property="processInstId" />
          <h:hidden property="applyObject/processinstid" />
          <h:hidden property="workItemID" />
          <h:hidden property="relationId" name="oaapplyinfo/RELATIONID"/>
          <h:hidden property="applyObject/applyoname" name="applyObject/applyoname" />
		  <h:hidden property="userObject/attributes/orgcode" scope="session" />
		  <h:hidden property="userObject/attributes/orgtype" scope="session" />
           
          <%-- 申请人机构名称--%>
          <h:hidden property="applyObject/applyoid" name="applyObject/applyoid"/>
          <%-- 申请人机构编码--%>
          <input type="hidden" name="_eosFlowAction" value="save" />
          <w:panel id="panel_empinfo" titleStyle="font-weight: bold;color: black;" width="100%" title="员工基本信息（${orgtypeString}）">
            <table align="center" border="0"class="form_table2" width="100%" >
              <tr>
                <td class="form_label2">
                  经办人(填表人)
                </td>
                <td colspan="1" class="w150">
                  <h:hidden property="userObject/userId" name="applyObject/handlerid" scope="session" />
                  <h:text property="userObject/userName" onblur="trimspace(this);" name="applyObject/handlername" scope="session" readonly="true" onfocus="this.blur()" />
                </td>
                <td class="form_label2">
                  申请人
                </td>
                <td colspan="1" class="w150">
                  <h:text property="applyObject/applyusername"  onblur="trimspace(this);" readonly="true" onfocus="this.blur()" />
                  <w:lookup lookupUrl="com.yd.soa.comm.org.SelectEmpsExt.flow" height="470" width="450"  readOnly="true" dialogTitle="选择申请人" id="applyerDoc" onReturnFunc="selectApplyerReturnFunc" style="width: 0px">
                    <h:param name="maxLength" value="1" />
                  </w:lookup>
                  <font style="color: red">
                    &nbsp;*
                  </font>
                </td>
                <td class="form_label2">
                  员工编号
                </td>
                <td colspan="1" class="w150">
                  <h:text property="applyObject/applyuserid" readonly="true"  />
                </td>
                <td class="form_label2">
                  职位(行政级别)
                </td>
                <td colspan="1" class="w150">
                  <h:hidden property="applyObject/applypost" name="applyObject/applypost"  />
                  <d:select dictTypeId="ABF_SECURITYLEVEL" name="applyObject/applypost1" disabled="true" style="width:120px;" property="applyObject/applypost" nullLabel="<%=selectNullLable %>" onfocus="this.blur()"/>
                </td>
              </tr>
              <tr>
                <td class="form_label2">
                  申请时间
                </td>
                <td colspan="1">
                  <input type="text" readonly="readonly" name="applyObject/appdate" style="width: 100%" id="appdate" value="<b:write property="applyObject/appdate" formatPattern="yyyy-MM-dd HH:mm:ss"/>" />
                </td>
                <td class="form_label2">
                  成本中心代码
                </td>
                <td colspan="1" >
                  <h:text  property="applyObject/kostlcode" readonly="true" />
                </td>
                <td class="form_label2">
                  所属一级部门
                </td>
                <td colspan="1">
                  <h:text property="applyObject/applydegree1" readonly="true" />
                </td>
                <td class="form_label2">
                  一级部门负责人
                </td>
                <td colspan="1">
                  <h:text property="applyObject/applydegree1fzr" readonly="true" />
                </td>
              </tr>
              <tr>
                <td class="form_label2">
                  邮政编码
                </td>
                <td colspan="1">
                  <h:text property="applyObject/yzbm" validateAttr="type=number;allowNull=false;maxLength=6"/>
                </td>
                <td class="form_label2">
                  费用所属成本中心
                </td>
                <td colspan="1">
                  <h:text property="applyObject/kostlName" styleClass="inputwidth" readonly="true" />
                </td>
                <td class="form_label2">
                  所属二级部门
                </td>
                <td colspan="1" >
                  <h:text property="applyObject/applydegree2" readonly="true" />
                </td>
                <td class="form_label2">
                  二级部门负责人
                </td>
                <td colspan="1" >
                  <h:text property="applyObject/applydegree2fzr" readonly="true" />
                </td>
              </tr>
              <tr>
                <td class="form_label2">
                  合同类型
                </td>
                <td colspan="1"  >
                 <d:select style="width:150px" dictTypeId="YD_YW_HTLX" onchange="htlxchange()" property="applyObject/htlx"  nullLabel="-请选择-" />
                </td>
                <td class="form_label2">
                  申请人所属单位
                </td>
                <td colspan="1">
                  <h:text property="applyObject/applyunit" readonly="true"  />
                </td>
                <td class="form_label2">
                  所属三级部门
                </td>
                <td colspan="1" >
                  <h:text property="applyObject/applydegree3" readonly="true" />
                </td>
                <td class="form_label2">
                  三级部门负责人
                </td>
                <td colspan="1">
                  <h:text property="applyObject/applydegree3fzr" readonly="true" />
                </td>
              </tr>
              <tr>
                <td class="form_label2">
                </td>
                <td colspan="1">
                </td>
                <td class="form_label2" >
                  申请人所属岗位
                </td>
                <td colspan="1" >
                  <h:text property="applyObject/applypname"  readonly="true" />
                  <h:hidden property="applyObject/applypid"/>
                </td>
                <td class="form_label2">
                </td>
                <td colspan="1">
                </td>
                <td class="form_label2">
                </td>
                <td colspan="1">
                </td>
              </tr>
            </table>
          </w:panel>
	        <w:panel id="panel3" width="100%" title="网点负责人/法人基础信息">
				<table align="center" border="0" width="100%" class="form_table" id="form_table2">
					<tr>
						<td class="form_label" width="15%">网点代码</td>
						<td colspan="1" width="25%"><h:text
							property="applyObject/wdcode" readonly="true"
							onblur="trimspace(this);" validateAttr="allowNull=false" onfocus="this.blur()"/> <w:lookup
							name="lookupName1" id="lookupName1"
							lookupUrl="com.yd.soa.comm.org.SelectOrgsExt.flow" height="470"
							width="450" dialogTitle="选择单位" style="width: 0px"
							onReturnFunc="returnFunc5">
							<h:param name="maxLength" value="1" />
							<h:param name="selectTypes" value="4:0;4:1" />
							<h:param name="search" value="1" />
						</w:lookup> <script type="text/javascript">
						function returnFunc5(args){
							if(null != args && args.length == 2)
							{
								var org = args[1][0];
								
								var myAjax2 = new Ajax("com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract.getOrgTypeByOrgCode.biz");
								myAjax2.addParam("orgcode", org.orgcode);
								myAjax2.submit();
								orgtype = myAjax2.getValue("root/data/orgtype");
								if(orgtype!=4){
									alert("请选择网点！");
									return false;
								}
								
								$name("applyObject/wdcode").value = org.orgcode;	
								$name("applyObject/wdname").value = org.orgname;
								
								var myAjax1 = new Ajax("com.yd.soa.comm.org.empmgr.getEmpDetailByUserid.biz");
								myAjax1.addParam("userid", org.orgcode + "001");
								myAjax1.submit();
								empname = myAjax1.getValue("root/data/empDetail/empname");
								if(empname != null && empname !="" && empname != "null"){
									$name("applyObject/fzrname").value=empname;
								}else{
									$name("applyObject/fzrname").value="";
								}
							    mobileno = myAjax1.getValue("root/data/empDetail/mobileno");
							    if(mobileno != null && mobileno !="" && mobileno != "null"){
									$name("applyObject/fzrmobile").value=mobileno;
								}else{
									$name("applyObject/fzrmobile").value="";
								}		
							}
						}
						</script><font style="color: red">&nbsp;*</font></td>
						<td class="form_label" width="15%">网点名称</td>
						<td colspan="1" width="45%"><h:text
							property="applyObject/wdname" readonly="true"
							validateAttr="allowNull=false" onfocus="this.blur()" style="border:0;"/> <font
							style="color: red">&nbsp;*</font></td>
					</tr>
					<tr>
						<td class="form_label">负责人姓名</td>
						<td colspan="1" width="30%"><h:text property="applyObject/fzrname"  validateAttr="allowNull=false" onfocus="this.blur()"/>
							<font style="color: red">&nbsp;*</font></td>
		
						<td class="form_label">负责人手机号</td>
						<td colspan="1" width="40%"><h:text property="applyObject/fzrmobile"  validateAttr="allowNull=false" onfocus="this.blur()"/>
							<font style="color: red">&nbsp;*</font></td>
					</tr>
					<tr>
						<td class="form_label">负责人身份证号</td>
						<td colspan="1" width="30%"><h:text property="applyObject/fzrsfzno"  validateAttr="allowNull=false;maxLength=18;minLength=18" />
							<font style="color: red">&nbsp;*</font></td>
		
						<td class="form_label">负责人身份证地址</td>
						<td colspan="1" width="40%"><h:text property="applyObject/fzrsfzaddress"  validateAttr="allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
					</tr>
					<tr>
						<td class="form_label">负责人与法人是否一致</td>
						<td colspan="1" width="30%"><d:select style="width:150px" dictTypeId="ISFZRSAMETOFR" onchange="isfzrsametofrchange()" property="applyObject/isfzrsametofr"  nullLabel="-请选择-" /></td>
		
						<td id="fzrfrgx" class="form_label">法人和负责人关系</td>
						<td id="fzrfrgx1" colspan="1" width="40%">
							<d:select style="width:150px" dictTypeId="FZRFRGX" onchange="fzrfrgxchange()" property="applyObject/fzrfrgx"  nullLabel="-请选择-" />
							<h:text id="fzrfrgxdetail" property="applyObject/fzrfrgxdetail" />
							<font style="color: red">&nbsp;*
						</td>
					</tr>
					<tr id="frname">
						<td class="form_label">法人姓名</td>
						<td colspan="1" width="30%"><h:text id="frname01" property="applyObject/frname"  />
							<font style="color: red">&nbsp;*</font></td>
		
						<td class="form_label">法人手机号</td>
						<td colspan="1" width="40%"><h:text id="frmobile" property="applyObject/frmobile"  />
							<font style="color: red">&nbsp;*</font></td>
					</tr>
					<tr id="frsfzno">
						<td class="form_label">法人身份证号</td>
						<td colspan="1" width="30%"><h:text id="frsfzno01" property="applyObject/frsfzno" />
							<font style="color: red">&nbsp;*</font></td>
		
						<td class="form_label">法人身份证地址</td>
							<td colspan="1" width="40%"><h:text id="frsfzaddress" property="applyObject/frsfzaddress" />
								<font style="color: red">&nbsp;*</font></td>
					</tr>
				</table>
			</w:panel>
			<w:panel id="panel4" width="100%" title="网点证照基础信息">
				<table align="center" border="0" width="100%" class="form_table" id="form_table2">
					<tr>
						<td class="form_label">营业执照/许可证注册名称</td>
						<td colspan="1" width="30%"><h:text property="applyObject/yyzzname"  validateAttr="allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
		
						<td class="form_label">统一社会信用代码</td>
						<td colspan="1" width="40%"><h:text property="applyObject/tyshxycode"  validateAttr="allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
					</tr>
					<tr>
						<td class="form_label">注册地址</td>
						<td colspan="1" width="30%"><h:text property="applyObject/zcaddress"  validateAttr="allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
						<td class="form_label">营业执照有效期</td>
						<td colspan="1" width="40%">
							<w:date allowNull="false" id="yyzzdatefrom" property="applyObject/yyzzdatefrom" />
							<font style="color: red">&nbsp;*</font>至
							<w:date allowNull="false" id="yyzzdateto" property="applyObject/yyzzdateto" />
						</td>
					</tr>
					<tr id="kdywjyxkz">
						<td class="form_label">快递业务经营许可证号</td>
						<td colspan="1" width="30%"><h:text id="kdywjyxkz01" property="applyObject/kdywjyxkz"  />
							<font style="color: red">&nbsp;*</font></td>
							
						<td class="form_label">许可证有效期</td>
						<td colspan="1" width="40%">
							<w:date id="xkzdatefrom" property="applyObject/xkzdatefrom" />
							<font style="color: red">&nbsp;*</font>至
							<w:date id="xkzzdateto" property="applyObject/xkzzdateto" />
						</td>
					</tr>
					<tr>
						<td class="form_label">网点实际经营地址</td>
						<td colspan="1" width="30%"><h:text property="applyObject/wdsjjyaddress"  validateAttr="allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
		
						<td class="form_label">注册资金（万元）</td>
						<td colspan="1" width="40%"><h:text property="applyObject/zczj"  validateAttr="type=float;allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
					</tr>
				</table>
			</w:panel>
			
			<w:panel
				id="panel13"
				width="100%"
				title="网点股权信息"
				>
				<table
					align="center"
					border="0"
					width="100%"
					class="form_table"
					id="form_label13">
					<r:datacell
						entityType="com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract.YdYwKdwdjoincontractWdgqxx"
						id="wdgqxx"
						isCount="true"
						xpath="applyObject/ydYwKdwdjoincontractWdgqxxs"
						submitXpath="applyObject/ydYwKdwdjoincontractWdgqxxs"
						width="100%"
						height="150">
						<r:toolbar
							location="bottom"
							tools="edit:add del" />
						<r:field
							allowModify="false"
							allowResize="false"
							fieldName="id"
							label="id"
							width="0">
							<h:text />
						</r:field>
						<r:field
							align="left"
							width="200%"
							fieldName="xuhao"
							label="序号"
							sortAt="client">
							<b:write />
						</r:field>
						<r:field
							width="200%"
							fieldName="name"
							label="股东名称">
							<h:text validateAttr="allowNull=false" />
						</r:field>
						<r:field
							width="200%"
							fieldName="sfzno"
							label="身份证号码">
							<h:text validateAttr="allowNull=false" />
						</r:field>
						<r:field
							width="200%"
							fieldName="gfbl"
							label="股份比例（%）">
							<h:text validateAttr="allowNull=false;" />
						</r:field>
					</r:datacell>
				</table>
			</w:panel>
			
			<w:panel id="panel5" width="100%" title="网点硬件配置情况">
				<table align="center" border="0" width="100%" class="form_table" id="form_table2">
					<tr>
						<td class="form_label">营业面积</td>
						<td colspan="1" width="30%"><h:text property="applyObject/yymj"  validateAttr="allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
		
						<td class="form_label">操作面积</td>
						<td colspan="1" width="40%"><h:text property="applyObject/czmj"  validateAttr="allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
					</tr>
					<tr>
						<td class="form_label">机动车（台）</td>
						<td colspan="1" width="30%"><h:text property="applyObject/jdc"  validateAttr="type=naturalNumber;allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
		
						<td class="form_label">非机动车（台）</td>
						<td colspan="1" width="40%"><h:text property="applyObject/fjdc"  validateAttr="type=naturalNumber;allowNull=false" />
							<font style="color: red">&nbsp;*</font></td>
					</tr>
					<tr>
						<td class="form_label">场地是否安装监控设备</td>
						<td colspan="1" width="30%"><d:select style="width:150px" dictTypeId="ISJK" property="applyObject/isjk"  nullLabel="-请选择-" /></td>
		
						<td class="form_label"></td>
						<td colspan="1" width="40%"></td>
					</tr>
					
				</table>
			</w:panel>
			
			<w:panel id="panel6" width="100%" title="发起须知">
				<table align="center" border="0" width="100%" class="form_table" id="form_table2">
					<tr>
						<td
							class="form_label"
							width="15%">业务办理准备资料格式规范</td>
						<td colspan="3"><h:textarea
							id="wendang"
							readonly="true"
							style="width: 75%; height: 200"
							onfocus="this.blur()"
							value="" /></td>
					</tr>
				</table>
			</w:panel>
          
          <%--<w:panel id="panel_attach" titleStyle="font-weight: bold;color: black;" width="100%" title="附件信息">
            <input type="hidden" id="t_rownum" value="1">
            <table align="center"  border="0" width="100%" id="form_table_att">
              <tr>
                <td width="22%" class="form_label2" align="right" rowspan="2">
                  合同及相关附件
                </td>
                <td colspan="1" >
                  <font style="color: red">
                    （单个文件
                    <script type="text/javascript">
                      document.write(fileMaxSize)
                    </script>
                    M以内,总大小
                    <script type="text/javascript">
                      document.write(fileAllSize)
                    </script>
                    M以内,限doc/docx/xls/xlsx/ppt/pptx/txt/jpg/gif/png/rar/zip格式）
                  </font>
                </td>
              </tr>
              <tr>
                <td colspan="3" >
                  <div style="display: inline">
                    <div style="float: left">
                      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="550" height="20" id="flashUpload" align="middle" codebase="<%=request.getContextPath()%>/ydsoacomm/flashupload/flash_upload.cab#version=9,0,0,0" >
                        <param name="movie" value="<%=request.getContextPath()%>/ydsoacomm/flashupload/flash_upload.swf" />
                        <param name="allowScriptAccess" value="always" />
                        <param name="swLiveConnect" value="true" />
                        <param name="wmode" value="opaque" />
                        <embed src="<%=request.getContextPath()%>/ydsoacomm/flashupload/flash_upload.swf" width="550" allowScriptAccess="always" height="20" name="flashUpload" align="middle" type="application/x-shockwave-flash" pluginspage="" wmode="opaque" swLiveConnect="true" />
                      </object>
                    </div>
                     <div style="float: left">
                      <input type='button' style="height: 20px" value='增加' id="add_btn" size="20" class="button" onclick='AddFileSelectInput_flash("form_table_att","t_rownum");'>
                    </div>
                  </div>
                </td>
              </tr>
            </table>
          </w:panel>--%>
         <%-- <table align="center" border="0" width="100%">
            <tr class="form_bottom">
              <td colspan="4">
                <input type="button" id="submit_id" value="提交" onclick="subFormData()" class="button"  >
                <input type="reset" id="reset_id" value="重置" class="button">
              </td>
            </tr>
          </table>--%>
          <%@ include file="/comm/common/jsp/commFileList.jsp"%>
        </h:form>
        <%@ include file="/comm/common/jsp/commuploadFile.jsp"%>
        <script type="text/javascript">
		 /**
          *初始化填单页面
          */
          function initInputPage(){
          }
		
          /**
          *利用eos的初始化触发 避免空间加载先后问题
          */
          eventManager.add(window,"load",initInputPage);

          /*
          *  提交流程表单前的验证
          */
          function checkFormBeforeSubmit(){
          	 var htlx=$name("applyObject/htlx").value;//合同类型
			 if(htlx =="" || htlx == null || htlx.length <=0){ 
		        alert("请选择合同类型!");
				return false;
			 }
			 
			 var isfzrsametofr=$name("applyObject/isfzrsametofr").value;//负责人与法人是否一致
			 if(isfzrsametofr =="" || isfzrsametofr == null || isfzrsametofr.length <=0){ 
		        alert("请选择负责人与法人是否一致!");
		        return false;
			 }
			 
			 if(isfzrsametofr == 2){
				 var fzrfrgx=$name("applyObject/fzrfrgx").value;//法人和负责人关系
				 if(fzrfrgx =="" || fzrfrgx == null || fzrfrgx.length <=0){ 
			        alert("请选择法人和负责人关系!");
					return false;
				 }
			 }
			 
			 if(htlx == 3){
				 var xkzdatefrom=$name("applyObject/xkzdatefrom").value;//许可证有效期开始
				 if(xkzdatefrom =="" || xkzdatefrom == null || xkzdatefrom.length <=0){ 
			        alert("请选择许可证有效期!");
					return false;
				 }
				 
				 var xkzdateto=$name("applyObject/xkzzdateto").value;//许可证有效期结束
				 if(xkzdateto =="" || xkzdateto == null || xkzdateto.length <=0){ 
			        alert("请选择许可证有效期!");
					return false;
				 }
			 }
			 
			 var  datacells=$id("wdgqxx");
			 //获取详情的所有行
			 var trs = datacells.getAllRows(true);
			 if(trs.length==0){
			   alert("请添加至少添加一条网点股权信息!");
			   return false;
			 }    	  
			 
			 var isjk=$name("applyObject/isjk").value;//场地是否安装监控设备
			 if(isjk =="" || isjk == null || isjk.length <=0){ 
		        alert("请选择场地是否安装监控设备!");
				return false;
			 }
			 if(checkInfo()){
			 	datacells.submitAllByHidden();
			 }
			  
          	return checkForm($name("query_form"));
          }
          
          function toDecimal(x) {   
             var f = parseFloat(x);   
             if (isNaN(f)) {   
              return;   
             }   
             f = Math.round(x*100)/100;   
             return f;   
           }   
          
          //检查填写的信息 
		 function checkInfo(){
		    var datacells=$id("wdgqxx"); //获取datacell对象
		    var inputtrs = datacells.getAllRows(true);//所有行的对象集合  
		    var total = 0;
		    
		    for(var i=0;i<inputtrs.length;i++){
		       var entity = datacells.getEntity(inputtrs[i]); 
		     	 for(var j=i+1;j<inputtrs.length;j++){	//避免人员中断导入而产生相同的序号
		    	  var entity1 = datacells.getEntity(inputtrs[j]); 
		    	 if(entity.getProperty("xuhao")==entity1.getProperty("xuhao")){
		       		entity1.setProperty("xuhao",inputtrs.length);
		       		return false;
		       	 }
		       } 
		        // 获取所有的详情具体信息 
		       var name =entity.getProperty("name");//姓名 
			   var sfzno =entity.getProperty("sfzno");//身份证号码
			   var gfbl =entity.getProperty("gfbl").trim();//股份比例 
			   if(name =="" || name == null ){ 
		         alert("第"+(i+1)+"行,请填写股东名称!");
				 return false;
		       }
		       if(sfzno =="" || sfzno == null ){ 
		         alert("第"+(i+1)+"行,请填写身份证号码!");
				 return false;
		       }
		       if(sfzno.length != 18 ){ 
		         alert("第"+(i+1)+"行,身份证号码不是18位!");
				 return false;
		       }
		       if(gfbl =="" || gfbl == null ){ 
		         alert("第"+(i+1)+"行,请填写股份比例!");
				 return false;
		       }
		       total = total + parseFloat(gfbl);
		    }
		    if(toDecimal(total) != 100){
		    	alert("股份比例总和不为100!");
				return false;
		    }
		   	   return true;
		 }
		 
		//  由角色人员发起 
		var userID='<b:write property="userObject/userId" scope="session" />';
		var userID_new = userID.substring(userID.length-3,userID.length);
		if(userID_new == "001" && userID.length > 8){
			$id("submit_id").disabled=false;
		}else{
			var mAjax = new Ajax("com.yd.soa.bpsclient.auth.bpsAuth.isSubmitWorkflow.biz"); 
			userid = userID;
			mAjax.addParam("empcode",userID);
			mAjax.addParam("roleid","YD_FB_JMHTFQ"); 
			mAjax.submit();
			var result=mAjax.getValues("root/data/flag");
			if(result==2){
				alert("该流程您没有发起权限!");   
				$id("submit_id").disabled=true;
			}else{
				$id("submit_id").disabled=false;
			}
		}
		 
		 //初始化页面信息
		  $id("wendang").value="特许加盟合同签订需要提供材料：\n1.网点快递业务经营许可证红章版\n2.营业执照红章版\n3.公司章程或到当地工商局查询的公司基本信息查询单红章版\n4.网点法定代表人的身份证或户口簿和其在(门头标准场所门口的七寸彩色照片)红章版\n5.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版\n6.网点从事快递经营活动所需的电话号码清单或缴费充值凭证复印件红章版\n7.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版\n8.网点与其全部员工的劳动合同和员工身份证复印件红章版";
		  var orgtype = "<b:write property='userObject/attributes/orgtype' scope='session' />";
	      var orgcode = "<b:write property='emp/orgcode'/>";
	      var orgname = "<b:write property='emp/inorgname' />";
	      if(orgtype == '4'){
			$name("applyObject/wdcode").value = orgcode;	
			$name("applyObject/wdname").value = orgname;
			
			var myAjax11 = new Ajax("com.yd.soa.comm.org.empmgr.getEmpDetailByUserid.biz");
			myAjax11.addParam("userid", orgcode + "001");
			myAjax11.submit();
			empname = myAjax11.getValue("root/data/empDetail/empname");
			if(empname != null && empname !="" && empname != "null"){
				$name("applyObject/fzrname").value=empname;
			}else{
				$name("applyObject/fzrname").value="";
			}
			mobileno = myAjax11.getValue("root/data/empDetail/mobileno");
			if(mobileno != null && mobileno !="" && mobileno != "null"){
				$name("applyObject/fzrmobile").value=mobileno;
			}else{
				$name("applyObject/fzrmobile").value="";
			}		
			$id("lookupName1").readOnly = true;
	      }
          
        </script>
      </html>
				