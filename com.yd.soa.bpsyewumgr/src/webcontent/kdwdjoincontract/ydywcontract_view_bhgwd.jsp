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
    <%@ include file="/viewtop.jsp"%>
    <%@ include file="/comm/common/jsp/showProcessNum.jsp"%>
    <w:panel id="panel_empinfo" titleStyle="font-weight: bold;color: black;"  width="100%" title="员工基本信息">
      <table align="center" border="0"class="form_table2" width="100%">
      	<h:hidden property="activityDefID" id="activityDefID" />
      	<h:hidden property="viewobject/processinstid" id="processinstid" />
		<h:hidden property="viewobject/id" />
		<h:hidden property="viewobject/appdate" />
		<h:hidden property="type" id="type" />
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
				<td colspan="1" width="30%"><b:write property="viewobject/fzrsfzno" /></td>

				<td class="form_label">负责人身份证地址</td>
				<td colspan="1" width="40%"><b:write property="viewobject/fzrsfzaddress" /></td>
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
				<td colspan="1" width="30%"><b:write  property="viewobject/frname"  /></td>

				<td class="form_label">法人手机号</td>
				<td colspan="1" width="40%"><b:write property="viewobject/frmobile"  /></td>
			</tr>
			<tr id="frsfzno">
				<td class="form_label">法人身份证号</td>
				<td colspan="1" width="30%"><b:write property="viewobject/frsfzno" /></td>

				<td class="form_label">法人身份证地址</td>
				<td colspan="1" width="40%"><b:write property="viewobject/frsfzaddress" /></td>
			</tr>
      </table>
    </w:panel>
    
    
    <w:panel id="panel_contract_history" titleStyle="font-weight: bold;color: black;" width="100%" title="网点证照基础信息">
       <table align="center" border="0" width="100%" class="EOS_table">
       		<tr>
				<td class="form_label">营业执照/许可证注册名称</td>
				<td colspan="1" width="30%"><b:write property="viewobject/yyzzname" /></td>

				<td class="form_label">统一社会信用代码</td>
				<td colspan="1" width="40%"><b:write property="viewobject/tyshxycode" /></td>
			</tr>
			<tr>
				<td class="form_label">注册地址</td>
				<td colspan="1" width="30%"><b:write property="viewobject/zcaddress" /></td>
				<td class="form_label">营业执照有效期</td>
				<td colspan="1" width="40%">
					<b:write property="viewobject/yyzzdatefrom" formatPattern="yyyy-MM-dd"/>
					至
					<b:write property="viewobject/yyzzdateto" formatPattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr id="kdywjyxkz">
				<td class="form_label">快递业务经营许可证号</td>
				<td colspan="1" width="30%"><b:write property="viewobject/kdywjyxkz" /></td>
					
				<td class="form_label">许可证有效期</td>
				<td colspan="1" width="40%">
					<b:write property="viewobject/xkzdatefrom" formatPattern="yyyy-MM-dd"/>
					至
					<b:write property="viewobject/xkzzdateto" formatPattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<td class="form_label">网点实际经营地址</td>
				<td colspan="1" width="30%"><b:write property="viewobject/wdsjjyaddress" /></td>

				<td class="form_label">注册资金（万元）</td>
				<td colspan="1" width="40%"><b:write property="viewobject/zczj" /></td>
			</tr>
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
  
  <l:notEqual property="type" targetValue="update">
  <l:notEmpty property="viewobject/jmf">
     <w:panel id="panel52" width="100%" title="不合规网点合作协议相关基础信息补全（加盟合规组填写）">  
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
  </l:notEqual>
  
  <l:equal property="type" targetValue="update">
     <w:panel id="panel52" width="100%" title="不合规网点合作协议相关基础信息补全（加盟合规组填写）">  
		<table align="center" border="0" width="100%" class="form_table" id="form_table2">
			<tr>
				<td class="form_label">加盟费（元）</td>
				<td colspan="1" width="30%"><h:text property="viewobject/jmf"  validateAttr="allowNull=false" />
					<font style="color: red">&nbsp;*</font></td>

				<td class="form_label">保证金（元）</td>
				<td colspan="1" width="40%"><h:text property="viewobject/bzj"  validateAttr="allowNull=false" />
					<font style="color: red">&nbsp;*</font></td>
			</tr>
			<tr>
				<td class="form_label">合同有效期限</td>
				<td colspan="1" width="40%">
					<w:date id="yxdatefrom1" property="viewobject/yxdatefrom" value="2022-06-01" />
					<font style="color: red">&nbsp;*</font>至
					<w:date id="yxzzdateto1" property="viewobject/yxzzdateto" value="2025-05-31" />
				</td>
				<td class="form_label">流程签订日期</td>
				<td colspan="1" width="40%">
					<w:date id="lcqddate" property="viewobject/lcqddate" value="2022-06-01" />
				</td>
			</tr>
			
			<tr>
				<td class="form_label">备注</td>
				<td colspan="3" width="100%"><h:text property="viewobject/remark" style="width:500px"/>
					<font style="color: red">&nbsp;*</font></td>
			</tr>
			<tr >
				<td class="form_label">网点所属省市区</td>
				<td colspan="3" >
				<r:comboSelect id="cntryid3" nullText="<%=selectNullLable %>" 
		            property="viewobject/guo" name="viewobject/guo" 
				    queryAction = "com.yd.soa.comm.org.OpOrgMgr.queryAllCountries.biz"
				    textField="areaName"
				    valueField="areaName"
				    value="中国"
				    xpath="countrys"
				    width="100"
				    validateAttr="allowNull=false"
				    submitXpath="parentArea"
				/>
				<r:comboSelect id="countriesid3" nullText="<%=selectNullLable %>"  linkId="cntryid3"
	            property="viewobject/sheng" name="viewobject/sheng" 
			    queryAction = "com.yd.soa.comm.org.OpOrgMgr.queryAreasByParentArea.biz"
			    textField="areaName"
			    valueField="areaName"
			    xpath="baseAreas"
			    width="100"
			    validateAttr="allowNull=false"
			    submitXpath="parentArea" />
				<r:comboSelect id="provincesid3" linkId="countriesid3" nullText="<%=selectNullLable %>"
           		property="viewobject/shi" name="viewobject/shi"
		   		queryAction="com.yd.soa.comm.org.OpOrgMgr.queryAreasByParentArea.biz"   
				textField="areaName" 
				valueField="areaName"
				width="100"
				submitXpath="parentArea"
			    xpath="baseAreas" validateAttr="allowNull=false" />
			    <r:comboSelect id="county3" linkId="provincesid3" nullText="<%=selectNullLable %>"
           		property="viewobject/qu" name="viewobject/qu"
		   		queryAction="com.yd.soa.comm.org.OpOrgMgr.queryAreasByParentArea.biz"   
				textField="areaName" 
				valueField="areaName"
				width="100"
				submitXpath="county"
			    xpath="baseAreas" validateAttr="allowNull=false" />
			    </td>
			</tr>
			 <tr class="form_bottom">
				<td colspan="4">
					<input type="button" id="submit_id" value="保存" onclick="Save()" class="button">
					<input type="reset" id="goback_id" value="修改" onclick="chongzhi()" class="button">
				</td>
			</tr>  
		</table>
	</w:panel>
  </l:equal>

    <%@ include file="/comm/common/jsp/commFileList.jsp"%>
    <%@ include file="/comm/common/jsp/wdjoinhtFileList.jsp"%>
	<script>
		var tijiaoBtn;
		try{
			tijiaoBtn = parent.parent.window.$id("tijiao");
			tijiaoBtn.disabled = true;
		}catch(e){
		
		}
		
		function chongzhi(){
			tijiaoBtn.disabled = true;
			submit_id.disabled = false;
		}
	
		 function Save(){
		 	var jmf = $name("viewobject/jmf").value;
		 	if(jmf == ""){
		 		 alert("请输入加盟费");
				 return false;
		 	} 
		 	var bzj = $name("viewobject/bzj").value; 
		 	if(bzj == ""){
		 		 alert("请输入保证金");
				 return false;
		 	}
		 	var yxdatefrom = $name("viewobject/yxdatefrom").value; 
		 	if(yxdatefrom == ""){
		 		 alert("请输入合同有效期限开始时间");
				 return false;
		 	}
		 	var yxzzdateto = $name("viewobject/yxzzdateto").value; 
		 	if(yxzzdateto == ""){
		 		 alert("请输入合同有效期限结束时间");
				 return false;
		 	}
		 	var remark = $name("viewobject/remark").value; 
		 	<%--if(remark == ""){
		 		 alert("请输入备注");
				 return false;
		 	}--%>
		 	var guo = $name("viewobject/guo").value; 
		 	var sheng = $name("viewobject/sheng").value; 
		 	var shi = $name("viewobject/shi").value;
		 	var qu = $name("viewobject/qu").value; 
		 	<%--if(guo == null || sheng == null || shi == null || qu == null){
		 		 alert("请输入网点所属省市区");
				 return false;
		 	}
		 	if(guo == "" || sheng == "" || shi == "" || qu == ""){
		 		 alert("请输入网点所属省市区");
				 return false;
		 	}
		 	if(guo == "-请选择-" || sheng == "-请选择-" || shi == "-请选择-" || qu == "-请选择-"){
		 		 alert("请输入网点所属省市区");
				 return false;
		 	}--%>
		 	
		 	if(guo == "-请选择-" || guo == "" || guo == null){
		 		 guo = "-";
		 	}
		 	if(sheng == "-请选择-" || sheng == "" || sheng == null){
		 		 sheng = "-";
		 	}
		 	if(shi == "-请选择-" || shi == "" || shi == null){
		 		 shi = "-";
		 	}
		 	if(qu == "-请选择-" || qu == "" || qu == null){
		 		 qu = "-";
		 	}
		 	
		 	var lcqddate = $name("viewobject/lcqddate").value;
		 	var processinstid = "<b:write property='viewobject/processinstid'/>"; 
		 	var guiAjax = new Ajax("com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract.SaveData.biz");
		
		    guiAjax.addParam('ydYwKdwdjoincontract/processinstid',processinstid);
			guiAjax.addParam('ydYwKdwdjoincontract/jmf',jmf);
			guiAjax.addParam('ydYwKdwdjoincontract/bzj',bzj);
			guiAjax.addParam('ydYwKdwdjoincontract/yxdatefrom',yxdatefrom);
			guiAjax.addParam('ydYwKdwdjoincontract/yxzzdateto',yxzzdateto);
			guiAjax.addParam('ydYwKdwdjoincontract/remark',remark);
			guiAjax.addParam('ydYwKdwdjoincontract/guo',guo);
			guiAjax.addParam('ydYwKdwdjoincontract/sheng',sheng);
			guiAjax.addParam('ydYwKdwdjoincontract/shi',shi);
			guiAjax.addParam('ydYwKdwdjoincontract/qu',qu);
			guiAjax.addParam('ydYwKdwdjoincontract/lcqddate',lcqddate);
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
  		 var contracttype = "<b:write property='viewobject/htlx' />";    
		 if(contracttype == "3"){
		 	$id("kdywjyxkz").style.display = "";
			$id("wendang").value="特许加盟合同签订需要提供材料：\n1.网点快递业务经营许可证红章版\n2.营业执照红章版\n3.公司章程或到当地工商局查询的公司基本信息查询单红章版\n4.网点法定代表人的身份证或户口簿和其在(门头标准场所门口的七寸彩色照片)红章版\n5.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版\n6.网点从事快递经营活动所需的电话号码清单或缴费充值凭证复印件红章版\n7.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版\n8.网点与其全部员工的劳动合同和员工身份证复印件红章版";
		 }else{
		 	$id("kdywjyxkz").style.display = "none";
		 	if(contracttype == "1"){
		 		$id("wendang").value="不合规网点合作协议签订需要提供材料：\n1.营业执照红章版\n2.网点法定代表人的身份证或户口簿红章版\n3.租房合同";
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
