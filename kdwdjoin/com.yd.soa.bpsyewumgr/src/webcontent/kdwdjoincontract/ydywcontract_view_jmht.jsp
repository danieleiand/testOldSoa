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
				<td colspan="1" width="30%"><h:text property="viewobject/fzrsfzno" validateAttr="allowNull=false"/></td>

				<td class="form_label">负责人身份证地址</td>
				<td colspan="1" width="40%"><h:text property="viewobject/fzrsfzaddress" validateAttr="allowNull=false"/></td>
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
				<td colspan="1" width="50%"><h:text property="viewobject/yyzzname" style="width:300px" validateAttr="allowNull=false"/></td>

				<td class="form_label">统一社会信用代码</td>
				<td colspan="1" width="40%"><h:text property="viewobject/tyshxycode" validateAttr="allowNull=false"/></td>
			</tr>
			<tr>
				<td class="form_label">注册地址</td>
				<td colspan="1" width="50%"><h:text property="viewobject/zcaddress" style="width:300px" validateAttr="allowNull=false"/></td>
				<td class="form_label">营业执照有效期</td>
				<td colspan="1" width="40%">
					<w:date property="viewobject/yyzzdatefrom" />
					至
					<w:date property="viewobject/yyzzdateto" />
				</td>
			</tr>
			<tr id="kdywjyxkz">
				<td class="form_label">快递业务经营许可证号</td>
				<td colspan="1" width="30%"><h:text property="viewobject/kdywjyxkz" style="width:300px" validateAttr="allowNull=false"/></td>
					
				<td class="form_label">许可证有效期</td>
				<td colspan="1" width="40%">
					<w:date property="viewobject/xkzdatefrom" />
					至
					<w:date property="viewobject/xkzzdateto" />
				</td>
			</tr>
			<tr>
				<td class="form_label">网点实际经营地址</td>
				<td colspan="1" width="30%"><h:text property="viewobject/wdsjjyaddress" style="width:300px" validateAttr="allowNull=false"/></td>

				<td class="form_label">注册资金（万元）</td>
				<td colspan="1" width="40%"><h:text property="viewobject/zczj" validateAttr="allowNull=false"/></td>
			</tr>
       </table>
      </w:panel>
      
      <w:panel id="list_panel" width="100%" title="网点股权信息">
	    <table align="center" border="0" width="100%" class="form_table" id="form_label13">
			<r:datacell entityType="com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract.YdYwKdwdjoincontractWdgqxx"
				id="wdgqxx" isCount="true" xpath="viewobject/ydYwKdwdjoincontractWdgqxxs" submitXpath="viewobject/ydYwKdwdjoincontractWdgqxxs" width="100%" height="150">
				<r:toolbar location="bottom" tools="edit:add del" />
				<r:field allowModify="false" allowResize="false" fieldName="id" label="id" width="0">
					<h:text />
				</r:field>
				<r:field align="left" width="200%" fieldName="xuhao" label="序号" sortAt="client">
					<b:write />
				</r:field>
				<r:field width="200%" fieldName="name" label="股东名称">
					<h:text validateAttr="allowNull=false" />
				</r:field>
				<r:field width="200%" fieldName="sfzno" label="身份证号码">
					<h:text validateAttr="allowNull=false" />
				</r:field>
				<r:field width="200%" fieldName="gfbl" label="股份比例（%）">
					<h:text validateAttr="allowNull=false;" />
				</r:field>
			</r:datacell>
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
					<b:write property="viewobject/xian" />
				    </td>
				</tr>
			</table>
		</w:panel>
		</l:notEmpty>
	  </l:notEqual>
	
	<l:equal property="type" targetValue="update">
     <w:panel id="panel51" width="100%" title="特许加盟合同相关基础信息补全（加盟合规组填写）">  
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
					<w:date id="yxdatefrom" property="viewobject/yxdatefrom"  value="2026-03-01"/>
					<font style="color: red">&nbsp;*</font>至
					<w:date id="yxzzdateto" property="viewobject/yxzzdateto" value="2029-02-28" />
				</td>
				<td class="form_label">商标许可使用期限</td>
				<td colspan="1" width="40%">
					<w:date id="sydatefrom" property="viewobject/sydatefrom" value="2026-03-01" />
					<font style="color: red">&nbsp;*</font>至
					<w:date id="syzzdateto" property="viewobject/syzzdateto" value="2029-02-28" />
				</td>
			</tr>
			
			<tr>
				<td class="form_label">其他补充约定</td>
				<td colspan="1" width="40%"><h:text property="viewobject/remark" value="本协议经双方盖章后生效，本协议生效后，此前双方签订的特许加盟合同或网点合作协议立即终止" style="width:500px" />
					<font style="color: red">&nbsp;*</font></td>
				<td class="form_label">流程签订日期</td>
				<td colspan="1" width="40%">
					<w:date id="lcqddate" property="viewobject/lcqddate" value="2026-03-01"/>
				</td>
			</tr>
			<tr >
				<td class="form_label">网点所属省市区</td>
				<td colspan="3" >
				<r:comboSelect id="cntryid2" nullText="<%=selectNullLable %>" 
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
				<r:comboSelect id="countriesid2" nullText="<%=selectNullLable %>"  linkId="cntryid2"
	            property="viewobject/sheng" name="viewobject/sheng" 
			    queryAction = "com.yd.soa.comm.org.OpOrgMgr.queryAreasByParentArea.biz"
			    textField="areaName"
			    valueField="areaName"
			    xpath="baseAreas"
			    width="100"
			    validateAttr="allowNull=false"
			    submitXpath="parentArea" />
				<r:comboSelect id="provincesid2" linkId="countriesid2" nullText="<%=selectNullLable %>"
           		property="viewobject/shi" name="viewobject/shi"
		   		queryAction="com.yd.soa.comm.org.OpOrgMgr.queryAreasByParentArea.biz"   
				textField="areaName" 
				valueField="areaName"
				width="100"
				submitXpath="parentArea"
			    xpath="baseAreas" validateAttr="allowNull=false" />
			    <r:comboSelect id="county2" linkId="provincesid2" nullText="<%=selectNullLable %>"
           		property="viewobject/qu" name="viewobject/qu"
		   		queryAction="com.yd.soa.comm.org.OpOrgMgr.queryAreasByParentArea.biz"   
				textField="areaName" 
				valueField="areaName"
				width="100"
				submitXpath="county"
			    xpath="baseAreas" validateAttr="allowNull=false" />
			    <h:text
					property="viewobject/xian"
					id="xian"
					style="width: 100px;"
					readonly="true" />
			    </td>
			</tr>
			 <tr class="form_bottom">
				<td colspan="4">
					<input type="button" id="submit_id" value="保存" onclick="Save()" class="button">
					<input type="button" id="goback_id" value="修改" onclick="chongzhi()" class="button">
				</td>
			</tr>  
		</table>
	</w:panel>
	</l:equal>
  
    <%@ include file="/comm/common/jsp/commFileList.jsp"%>
    <%@ include file="/comm/common/jsp/wdjoinhtFileList.jsp"%>
</h:form>
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
		 	
		 	var sydatefrom = $name("viewobject/sydatefrom").value; 
		 	if(sydatefrom == ""){
		 		 alert("请输入商标许可使用期限开始时间");
				 return false;
		 	}
		 	var syzzdateto = $name("viewobject/syzzdateto").value; 
		 	if(syzzdateto == ""){
		 		 alert("请输入商标许可使用期限结束时间");
				 return false;
		 	}
		 	
		 	var remark = $name("viewobject/remark").value; 
		 	<%--if(remark == ""){
		 		 alert("请输入其他补充约定");
				 return false;
		 	}--%>
		 	var guo = $name("viewobject/guo").value; 
		 	var sheng = $name("viewobject/sheng").value; 
		 	var shi = $name("viewobject/shi").value;
		 	var qu = $name("viewobject/qu").value; 
		 	var xian = $name("viewobject/xian").value; 
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
			guiAjax.addParam('ydYwKdwdjoincontract/sydatefrom',sydatefrom);
			guiAjax.addParam('ydYwKdwdjoincontract/syzzdateto',syzzdateto);
			guiAjax.addParam('ydYwKdwdjoincontract/remark',remark);
			guiAjax.addParam('ydYwKdwdjoincontract/guo',guo);
			guiAjax.addParam('ydYwKdwdjoincontract/sheng',sheng);
			guiAjax.addParam('ydYwKdwdjoincontract/shi',shi);
			guiAjax.addParam('ydYwKdwdjoincontract/qu',qu);
			guiAjax.addParam('ydYwKdwdjoincontract/xian',xian);
			guiAjax.addParam('ydYwKdwdjoincontract/lcqddate',lcqddate);

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


			var frm = $name("query_form");
			var save = new Ajax("com.yd.soa.bpsyewumgr.kdwdjoincontract.kdwdjoincontract.saveWddetail.biz");
			save.addParam('ydywid',$name("viewobject/id").value);
			$id("wdgqxx").submitModifyByHidden();	
			save.submitForm(frm);
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

		 var datacellcarcell = $id("wdgqxx");       
 		 initDatacellAfterSubmit(datacellcarcell);
		 var activityDefID = "<b:write property='activityDefID' />";    
      <%--alert(activityDefID);--%>
  		 var contracttype = "<b:write property='viewobject/htlx' />";    
		 if(contracttype == "3"){
		 	$id("kdywjyxkz").style.display = "";
			$id("wendang").value="特许加盟合同签订需要提供材料：\n1.网点快递业务经营许可证红章版\n2.营业执照红章版\n3.公司章程或到当地工商局查询的公司基本信息查询单红章版\n4.网点法定代表人的身份证或户口簿和其在(门头标准场所门口的七寸彩色照片)红章版\n5.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版\n6.网点从事快递经营活动所需的电话号码清单或缴费充值凭证复印件红章版\n7.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版\n8.网点与其全部员工的劳动合同和员工身份证复印件红章版\n9.网点加盟确认书\n10.担保确认书（针对分公司签合同提供）\n11.网点标准化带水印场地门头照片";
		 }else{
		 	$id("kdywjyxkz").style.display = "none";
		 	if(contracttype == "1"){
		 		$id("wendang").value="网点合作协议签订需要提供材料：\n1.网点快递业务经营许可证红章版\n2.营业执照红章版\n3.公司章程或到当地工商局查询的公司基本信息查询单红章版\n4.网点法定代表人的身份证或户口簿和其在(门头标准场所门口的七寸彩色照片)红章版\n5.网点经营场所如系自有的则提供房屋所有权证，如租赁他人的则提供房屋租赁合同复印件红章版\n6.网点从事快递经营活动所需的电话号码清单或缴费充值凭证复印件红章版\n7.网点从事快递经营活动的车辆行驶证或其他登记证书复印件红章版\n8.网点与其全部员工的劳动合同和员工身份证复印件红章版\n9.网点加盟确认书\n10.担保确认书（针对分公司签合同提供）\n11.网点标准化带水印场地门头照片";
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
      

	   function initDatacellAfterSubmit(datacell) {
			//自动生成序号
			datacell.afterAdd = function(){
				var row = datacell.getActiveRow();
				var rowno = datacell.getAllRows().length;
				var entity = datacell.getEntity(row);
				entity.setProperty("xuhao",rowno);
			};
	}
      /**
      *利用eos的初始化触发 避免空间加载先后问题
      */
      eventManager.add(window,"load",initInputPage);
	</script>
  </body>
</html>
