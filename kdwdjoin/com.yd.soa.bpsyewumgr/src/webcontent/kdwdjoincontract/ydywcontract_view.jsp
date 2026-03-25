<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>网点加盟合同签批申请流程</title>
<h:css href="/common/comm_style.css"/>

</head>
  <body>
    <e:datasource name="viewobject" type="entity" path="com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract.YdYwKdwdjoincontract" />
	<h:form name="query_form" enctype="multipart/form-data"
	action="com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract_approve.flow"
	method="post" onsubmit="return checkForm(this);">
    <%@ include file="/viewtop.jsp"%>
    <%@ include file="/comm/common/jsp/showProcessNum.jsp"%>
    <w:panel id="panel_empinfo" titleStyle="font-weight: bold;color: black;"  width="100%" title="员工基本信息">
      <table align="center" border="0"class="form_table2" width="100%">
      	<h:hidden property="activityDefID" id="activityDefID" />
      	<h:hidden property="viewobject/processinstid" id="processinstid" />
		<h:hidden property="viewobject/id" />
		<h:hidden property="viewobject/appdate" />
		<h:hidden property="type" id="type" />

		<h:hidden property="viewobject/jmf"/>
		<h:hidden property="viewobject/bzj"/>
		<h:hidden property="viewobject/yxdatefrom"/>
		<h:hidden property="viewobject/yxzzdateto"/>
		<h:hidden property="viewobject/sydatefrom"/>
		<h:hidden property="viewobject/syzzdateto"/>
		<h:hidden property="viewobject/remark"/>
		<h:hidden property="viewobject/guo"/>
		<h:hidden property="viewobject/sheng"/>
		<h:hidden property="viewobject/shi"/>
		<h:hidden property="viewobject/qu"/>
		<h:hidden property="viewobject/xian"/>

		<tr>
          <td class="form_label22">
            经办人(填表人)
          </td>
          <td colspan="1" class="w150">
            <b:write property="viewobject/handlername"/>
          </td>
          <td class="form_label22">
            申请人
          </td>
          <td colspan="1" class="w150">
            <b:write property="viewobject/applyusername"/>
          </td>
          <td class="form_label22">
            员工编号
          </td>
          <td colspan="1" class="w150">
            <b:write property="viewobject/applyuserid"/>
          </td>
          <td class="form_label22">
            职位(行政级别)
          </td>
          <td colspan="1" class="w150">
            <d:write dictTypeId="ABF_SECURITYLEVEL" property="viewobject/applypost" />
          </td>
        </tr>
        <tr>
          <td class="form_label22">
            申请时间
          </td>
          <td colspan="1" class="w150">
            <b:write  property="viewobject/appdate"/>
          </td>
          <td class="form_label22">
            成本中心代码
          </td>
          <td colspan="1" class="w150"  >
            <b:write  property="viewobject/kostlcode"/>
          </td>
          <td class="form_label22">
            所属一级部门
          </td>
          <td colspan="1" class="w150">
            <b:write property="viewobject/applydegree1"/>
          </td>
          <td class="form_label22">
            一级部门负责人
          </td>
          <td colspan="1" class="w150">
            <b:write property="viewobject/applydegree1fzr"/>
          </td>
        </tr>
        <tr>
          <td class="form_label22">
            邮政编码
          </td>
          <td colspan="1" class="w150" >
            <b:write property="viewobject/yzbm"/>
          </td>
          <td class="form_label22">
            费用所属成本中心
          </td>
          <td colspan="1" class="longTexTd" title="<b:write property="viewobject/kostlName"/> ">
            <span style="width:150px;overflow: hidden;">
              <b:write property="viewobject/kostlName"  />
            </span>
          </td>
          <td class="form_label22">
            所属二级部门
          </td>
          <td colspan="1" class="w150" >
            <b:write property="viewobject/applydegree2"/>
          </td>
          <td class="form_label22">
            二级部门负责人
          </td>
          <td colspan="1" class="w150" >
            <b:write property="viewobject/applydegree2fzr"/>
          </td>
        </tr>
        <tr>
          <td class="form_label22">
           合同类型
          </td>
          <td colspan="1" class="w150" >
            <d:select style="width:150px" dictTypeId="YD_YW_HTLX" disabled="true" property="viewobject/htlx"/>
          </td>
          <td class="form_label22" >
            申请人所属单位
          </td>
          <td colspan="1" class="w150">
            <b:write property="viewobject/applyunit"/>
          </td>
          <td class="form_label22">
            所属三级部门
          </td>
          <td colspan="1" class="w150" >
            <b:write property="viewobject/applydegree3"/>
          </td>
          <td class="form_label22">
            三级部门负责人
          </td>
          <td colspan="1" class="w150">
            <b:write property="viewobject/applydegree3fzr"/>
          </td>
        </tr>
        <tr>
          <td class="form_label22">
          </td>
          <td colspan="1" class="w150">
          </td>
          <td class="form_label22" >
            申请人所属岗位
          </td>
          <td colspan="1" class="w150" >
            <h:hidden property="viewobject/applypid" />
            <b:write property="viewobject/applypname"/>
          </td>
          <td class="form_label22">
          </td>
          <td colspan="1" class="w150">
          </td>
          <td class="form_label22">
          </td>
          <td colspan="1" class="w150">
          </td>
        </tr>
      </table>
    </w:panel>
    
    <w:panel id="panel_bizinfo" titleStyle="font-weight: bold;color: black;" width="100%" title="网点负责人/法人基础信息">
      <table align="center" border="0" width="100%" class="form_table2">
	        <tr>
				<td class="form_label" width="15%">网点代码</td>
				<td colspan="1" width="25%"><b:write property="viewobject/wdcode" /></td>
				<td class="form_label" width="15%">网点名称</td>
				<td colspan="1" width="45%"><b:write property="viewobject/wdname" /></td>
			</tr>
			<tr>
				<td class="form_label">负责人姓名</td>
				<td colspan="1" width="30%"><b:write property="viewobject/fzrname"/></td>

				<td class="form_label">负责人手机号</td>
				<td colspan="1" width="40%"><b:write property="viewobject/fzrmobile" /></td>
			</tr>
			<tr>
				<td class="form_label">负责人身份证号</td>
				<td colspan="1" width="30%"><h:text property="viewobject/fzrsfzno" /></td>

				<td class="form_label">负责人身份证地址</td>
				<td colspan="1" width="40%"><h:text property="viewobject/fzrsfzaddress" /></td>
			</tr>
			<tr>
				<td class="form_label">负责人与法人是否一致</td>
				<td colspan="1" width="30%">
					<d:select dictTypeId="ISFZRSAMETOFR" disabled="true" property="viewobject/isfzrsametofr"/>
				</td>

				<td id="fzrfrgx" class="form_label">法人和负责人关系</td>
				<td id="fzrfrgx1" colspan="1" width="40%">
					<d:select dictTypeId="FZRFRGX" disabled="true" property="viewobject/fzrfrgx"/>
					<b:write  property="viewobject/fzrfrgxdetail" />
				</td>
			</tr>
			<tr id="frname">
				<td class="form_label">法人姓名</td>
				<td colspan="1" width="30%"><h:text  property="viewobject/frname"  /></td>

				<td class="form_label">法人手机号</td>
				<td colspan="1" width="40%"><h:text property="viewobject/frmobile"  /></td>
			</tr>
			<tr id="frsfzno">
				<td class="form_label">法人身份证号</td>
				<td colspan="1" width="30%"><h:text property="viewobject/frsfzno" /></td>

				<td class="form_label">法人身份证地址</td>
				<td colspan="1" width="40%"><h:text property="viewobject/frsfzaddress" /></td>
			</tr>
      </table>
    </w:panel>
    
    
    <w:panel id="panel_contract_history" titleStyle="font-weight: bold;color: black;" width="100%" title="网点证照基础信息">
       <table align="center" border="0" width="100%" class="EOS_table">
       		<tr>
				<td class="form_label">营业执照/许可证注册名称</td>
				<td colspan="1" width="30%"><h:text style="width:300px" property="viewobject/yyzzname" /></td>

				<td class="form_label">统一社会信用代码</td>
				<td colspan="1" width="40%"><h:text property="viewobject/tyshxycode" /></td>
			</tr>
			<tr>
				<td class="form_label">注册地址</td>
				<td colspan="1" width="30%"><h:text style="width:300px" property="viewobject/zcaddress" /></td>
				<td class="form_label">营业执照有效期</td>
				<td colspan="1" width="40%">
					<w:date property="viewobject/yyzzdatefrom" />
					至
					<w:date property="viewobject/yyzzdateto" />
				</td>
			</tr>
			<tr id="kdywjyxkz">
				<td class="form_label">快递业务经营许可证号</td>
				<td colspan="1" width="30%"><h:text style="width:300px" property="viewobject/kdywjyxkz" /></td>
					
				<td class="form_label">许可证有效期</td>
				<td colspan="1" width="40%">
					<w:date property="viewobject/xkzdatefrom" />
					至
					<w:date property="viewobject/xkzzdateto" />
				</td>
			</tr>
			<tr>
				<td class="form_label">网点实际经营地址</td>
				<td colspan="1" width="30%"><h:text style="width:300px" property="viewobject/wdsjjyaddress" /></td>

				<td class="form_label">注册资金（万元）</td>
				<td colspan="1" width="40%"><h:text property="viewobject/zczj" /></td>
			</tr>
			<l:equal property="viewobject/htlx" targetValue="1">
				<tr >
					<td class="form_label">是否有合规证件</td>
					<td colspan="1" width="30%"><d:select style="width:150px" dictTypeId="ISFZRSAMETOFR" property="viewobject/ifxkzj"/></td>
					<td class="form_label">合规证件编号</td>
					<td colspan="1" width="40%"><<h:text property="viewobject/xkzjmh" /></td>
				</tr>
			</l:equal>
       </table>
      </w:panel>
      
      <w:panel id="list_panel" width="100%" title="网点股权信息">
	    <table align="center" border="0" width="100%" class="EOS_table">
	      <tr>
	        <th>
	                 序号
	        </th>
	        <th>
	                 股东名称
	        </th>
	        <th>
	          身份证号码
	        </th>
	        <th>
	          股份比例（%）
	        </th>
	      </tr> 
           <l:iterate property="viewobject/ydYwKdwdjoincontractWdgqxxs" id="id1">
	        <tr class="<l:output evenOutput='EOS_table_row' />">
	          <td align="center">
	            <b:write iterateId="id1" property="xuhao"/>
	          </td>
	          <td align="center">
	            <b:write iterateId="id1" property="name"/>
	          </td>
	          <td align="center">
	            <b:write iterateId="id1" property="sfzno"/>
	          </td>
	          <td align="center">
	            <b:write iterateId="id1" property="gfbl"/>
	          </td>             
	        </tr>
	      </l:iterate>
	    </table>	    
	  </w:panel>
	  
	  <w:panel id="panel5" width="100%" title="网点硬件配置情况">
		<table align="center" border="0" width="100%" class="form_table" >
			<tr>
				<td class="form_label">营业面积</td>
				<td colspan="1" width="30%"><b:write property="viewobject/yymj" /></td>

				<td class="form_label">操作面积</td>
				<td colspan="1" width="40%"><b:write property="viewobject/czmj" /></td>
			</tr>
			<tr>
				<td class="form_label">机动车（台）</td>
				<td colspan="1" width="30%"><b:write property="viewobject/jdc" /></td>

				<td class="form_label">非机动车（台）</td>
				<td colspan="1" width="40%"><b:write property="viewobject/fjdc" /></td>
			</tr>
			<tr>
				<td class="form_label">场地是否安装监控设备</td>
				<td colspan="1" width="30%"><d:select disabled="true" style="width:150px" dictTypeId="ISJK" property="viewobject/isjk"/></td>

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
	
	<l:equal property="viewobject/htlx" targetValue="3">
	<l:notEmpty property="viewobject/jmf">
     <w:panel id="panel51" width="100%" title="特许加盟合同相关基础信息补全（加盟合规组填写）">  
		<table align="center" border="0" width="100%" class="form_table" id="form_table2">
			<tr>
				<td class="form_label">加盟费（元）</td>
				<td colspan="1" width="30%"><b:write property="viewobject/jmf" /></td>

				<td class="form_label">保证金（元）</td>
				<td colspan="1" width="40%"><b:write property="viewobject/bzj" /></td>
			</tr>
			<tr>
				<td class="form_label">合同有效期限</td>
				<td colspan="1" width="40%">
					<b:write  property="viewobject/yxdatefrom" formatPattern="yyyy-MM-dd"/>至
					<b:write property="viewobject/yxzzdateto" formatPattern="yyyy-MM-dd"/>
				</td>
				<td class="form_label">商标许可使用期限</td>
				<td colspan="1" width="40%">
					<b:write  property="viewobject/sydatefrom" formatPattern="yyyy-MM-dd"/>至
					<b:write  property="viewobject/syzzdateto" formatPattern="yyyy-MM-dd"/>
				</td>
			</tr>
			
			<tr>
				<td class="form_label">其他补充约定</td>
				<td colspan="3" width="60%"><b:write property="viewobject/remark" /></td>
			</tr>
			<tr >
				<td class="form_label">网点所属省市区</td>
				<td colspan="3" >
				<b:write property="viewobject/guo" />
				<b:write property="viewobject/sheng" />
				<b:write property="viewobject/shi" />
				<b:write property="viewobject/qu" />
			    </td>
			</tr>
		</table>
	</w:panel>
	</l:notEmpty>
  </l:equal>
  
  <l:equal property="viewobject/htlx" targetValue="1">
  <l:notEmpty property="viewobject/jmf">
     <w:panel id="panel52" width="100%" title="网点合作协议相关基础信息补全（加盟合规组填写）">  
		<table align="center" border="0" width="100%" class="form_table" id="form_table2">
			<tr>
				<td class="form_label">加盟费（元）</td>
				<td colspan="1" width="30%"><b:write property="viewobject/jmf" /></td>

				<td class="form_label">保证金（元）</td>
				<td colspan="1" width="40%"><b:write property="viewobject/bzj" /></td>
			</tr>
			<tr>
				<td class="form_label">合同有效期限</td>
				<td colspan="1" width="40%">
					<b:write  property="viewobject/yxdatefrom" formatPattern="yyyy-MM-dd"/>至
					<b:write property="viewobject/yxzzdateto" formatPattern="yyyy-MM-dd"/>
				</td>
				<td class="form_label"></td>
				<td colspan="1" width="40%"></td>
			</tr>
			
			<tr>
				<td class="form_label">其他补充约定</td>
				<td colspan="3" width="60%"><b:write property="viewobject/remark" /></td>
			</tr>
			<tr >
				<td class="form_label">网点所属省市区</td>
				<td colspan="3" >
				<b:write property="viewobject/guo" />
				<b:write property="viewobject/sheng" />
				<b:write property="viewobject/shi" />
				<b:write property="viewobject/qu" />
			    </td>
			</tr>
		</table>
	</w:panel>
	</l:notEmpty>
  </l:equal>

	<l:equal property="viewobject/htlx" targetValue="2">
	<l:notEmpty property="viewobject/yxdatefrom">
     <w:panel id="panel53" width="100%" title="加盟意向书相关基础信息补全（加盟合规组填写）">  
		<table align="center" border="0" width="100%" class="form_table" id="form_table2">
			<tr>
				<td class="form_label">加盟意向书有效期限</td>
				<td colspan="1" width="40%">
					<b:write  property="viewobject/yxdatefrom" formatPattern="yyyy-MM-dd"/>至
					<b:write property="viewobject/yxzzdateto" formatPattern="yyyy-MM-dd"/>
				</td>
				<td class="form_label"></td>
				<td colspan="1" width="40%"></td>
			</tr>
		</table>
	</w:panel>
	</l:notEmpty>
  </l:equal>
  <l:equal property="activityDefID" targetValue="YD_SGSWDGLBFZR">
	  <l:equal property="type" targetValue="update">
			<table align="center" border="0" width="100%" class="form_table" id="form_table3">
					 <tr class="form_bottom">
					<td colspan="4">
						<input type="button" id="submit_id" value="保存" onclick="Save()" class="button">
						<input type="button" id="goback_id" value="修改" onclick="chongzhi()" class="button">
					</td>
				</tr>  
			</table>
	  </l:equal>
  </l:equal>
    <%@ include file="/comm/common/jsp/commFileList.jsp"%>
    <%@ include file="/comm/common/jsp/wdjoinhtFileList.jsp"%>
</h:form>    
	<script>
		var activityDefID = "<b:write property='activityDefID' />";  
		if(activityDefID == "YD_SGSWDGLBFZR"){
			var tijiaoBtn;
			try{
				tijiaoBtn = parent.parent.window.$id("tijiao");
				tijiaoBtn.disabled = true;
			}catch(e){
			
			}
		}

		
		function chongzhi(){
			tijiaoBtn.disabled = true;
			submit_id.disabled = false;
		}
	
		 function Save(){
		 	var guiAjax = new Ajax("com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract.SaveData.biz");
		    guiAjax.addParam('ydYwKdwdjoincontract/processinstid',$name("viewobject/processinstid").value);
			guiAjax.addParam('ydYwKdwdjoincontract/jmf',$name("viewobject/jmf").value);
			guiAjax.addParam('ydYwKdwdjoincontract/bzj',$name("viewobject/bzj").value);
			guiAjax.addParam('ydYwKdwdjoincontract/yxdatefrom',$name("viewobject/yxdatefrom").value);
			guiAjax.addParam('ydYwKdwdjoincontract/yxzzdateto',$name("viewobject/yxzzdateto").value);
			guiAjax.addParam('ydYwKdwdjoincontract/sydatefrom',$name("viewobject/sydatefrom").value);
			guiAjax.addParam('ydYwKdwdjoincontract/syzzdateto',$name("viewobject/syzzdateto").value);
			guiAjax.addParam('ydYwKdwdjoincontract/remark',$name("viewobject/remark").value);
			guiAjax.addParam('ydYwKdwdjoincontract/guo',$name("viewobject/guo").value);
			guiAjax.addParam('ydYwKdwdjoincontract/sheng',$name("viewobject/sheng").value);
			guiAjax.addParam('ydYwKdwdjoincontract/shi',$name("viewobject/shi").value);
			guiAjax.addParam('ydYwKdwdjoincontract/qu',$name("viewobject/qu").value);
			guiAjax.addParam('ydYwKdwdjoincontract/xian',$name("viewobject/xian").value);

			guiAjax.addParam('ydYwKdwdjoincontract/fzrsfzno',$name("viewobject/fzrsfzno").value);
			guiAjax.addParam('ydYwKdwdjoincontract/fzrsfzaddress',$name("viewobject/fzrsfzaddress").value);
			guiAjax.addParam('ydYwKdwdjoincontract/yyzzname',$name("viewobject/yyzzname").value);
			guiAjax.addParam('ydYwKdwdjoincontract/tyshxycode',$name("viewobject/tyshxycode").value);
			guiAjax.addParam('ydYwKdwdjoincontract/zcaddress',$name("viewobject/zcaddress").value);
			guiAjax.addParam('ydYwKdwdjoincontract/yyzzdatefrom',$name("viewobject/yyzzdatefrom").value);
			guiAjax.addParam('ydYwKdwdjoincontract/yyzzdateto',$name("viewobject/yyzzdateto").value);
			guiAjax.addParam('ydYwKdwdjoincontract/kdywjyxkz',$name("viewobject/kdywjyxkz").value);
			guiAjax.addParam('ydYwKdwdjoincontract/xkzdatefrom',$name("viewobject/xkzdatefrom").value);
			guiAjax.addParam('ydYwKdwdjoincontract/xkzzdateto',$name("viewobject/xkzzdateto").value);
			guiAjax.addParam('ydYwKdwdjoincontract/wdsjjyaddress',$name("viewobject/wdsjjyaddress").value);
			guiAjax.addParam('ydYwKdwdjoincontract/zczj',$name("viewobject/zczj").value);
			guiAjax.addParam('ydYwKdwdjoincontract/frsfzno',$name("viewobject/frsfzno").value);
			guiAjax.addParam('ydYwKdwdjoincontract/frsfzaddress',$name("viewobject/frsfzaddress").value);
			guiAjax.addParam('ydYwKdwdjoincontract/frname',$name("viewobject/frname").value);
			guiAjax.addParam('ydYwKdwdjoincontract/frmobile',$name("viewobject/frmobile").value);
			if($name("viewobject/htlx").value == 1){
				guiAjax.addParam('ydYwKdwdjoincontract/ifxkzj',$name("viewobject/ifxkzj").value);
				guiAjax.addParam('ydYwKdwdjoincontract/xkzjmh',$name("viewobject/xkzjmh").value);
			}
			guiAjax.submit();
			var success = guiAjax.getValue('root/data/success');
			if(success==0){
			    alert("保存成功");
				tijiaoBtn.disabled = false;
				submit_id.disabled = true;
			}else{
				alert("保存失败");
				return false;
			}
		 	
		 }

	  /**
      *初始化填单页面
      */
      function initInputPage(){
      var activityDefID = "<b:write property='activityDefID' />";    
      <%--alert(activityDefID);--%>
  		 var contracttype = "<b:write property='viewobject/htlx' />";    
		 if(contracttype == "3"){
		 	$id("kdywjyxkz").style.display = "";
			$id("wendang").value="特许加盟合同签订需要提供材料：\n1.网点快递业务经营许可证红章版\n2.营业执照红章版\n3.公司章程或到当地工商局查询的公司基本信息查询单红章版\n4.网点法定代表人的身份证或户口簿红章版\n5.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版\n6.网点从事快递经营活动所需的电话号码清单或缴费充值凭证复印件红章版\n7.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版\n8.网点与其全部员工的劳动合同和员工身份证复印件红章版\n9.网点加盟确认书\n10.担保确认书（针对分公司签合同提供）\n11.网点标准化带水印场地门头的七寸彩色照片";
		 }else{
		 	$id("kdywjyxkz").style.display = "none";
		 	if(contracttype == "1"){
		 		$id("wendang").value="网点合作协议签订需要提供材料：\n1.网点快递业务经营许可证红章版\n2.营业执照红章版\n3.公司章程或到当地工商局查询的公司基本信息查询单红章版\n4.网点法定代表人的身份证或户口簿红章版\n5.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版\n6.网点从事快递经营活动所需的电话号码清单或缴费充值凭证复印件红章版\n7.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版\n8.网点与其全部员工的劳动合同和员工身份证复印件红章版\n9.网点加盟确认书\n10.担保确认书（针对分公司签合同提供）\n11.网点标准化带水印场地门头的七寸彩色照片";
		 	}else{
		 		$id("wendang").value="加盟意向书签订需要提供材料：\n1.营业执照红章版 \n2.网点法定代表人的身份证或户口簿红章版 \n3.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版 \n4.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版";
		 	}
		 }
		 
		 var isfzrsametofr = "<b:write property='viewobject/isfzrsametofr' />";   
		 if(isfzrsametofr == "2"){
		 	$id("fzrfrgx").style.display = "";
		 	$id("fzrfrgx1").style.display = "";
		 	$id("frname").style.display = "";
		 	$id("frsfzno").style.display = "";
		 }else{
		 	$id("fzrfrgx").style.display = "none";
		 	$id("fzrfrgx1").style.display = "none";
		 	$id("frname").style.display = "none";
		 	$id("frsfzno").style.display = "none";
		 }
	 
      }
      
      /**
      *利用eos的初始化触发 避免空间加载先后问题
      */
      eventManager.add(window,"load",initInputPage);
	</script>
  </body>
</html>
