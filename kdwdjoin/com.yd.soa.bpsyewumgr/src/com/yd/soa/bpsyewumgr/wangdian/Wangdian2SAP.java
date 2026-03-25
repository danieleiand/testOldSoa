/*******************************************************************************
 * $Header$
 * $Revision$
 * $Date$
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2013-3-19
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.wangdian;


import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.sap.conn.jco.AbapException;
import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoException;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoStructure;
import com.yd.soa.comm.log.LogUtil;

import commonj.sdo.DataObject;

/**
 * TODO fill class info here
 *
 * @author lixiuquan
 * @date 2013-03-19 14:37:29
 */
/*
 * Modify history
 * $Log$ 
 * 2013-03-19
 */
@Bizlet("")
public class Wangdian2SAP {
	@Bizlet("给SAP推送网点数据信息")
	public static DataObject saveData2Sap(DataObject paramData) throws JCoException {
		LogUtil.logInfo("YD_INTF","给SAP推送网点数据信息：{0}", null, "start");
		String funcName = "ZSD_RFC_FM01";//通过SOA系统审批通过的新增、修改、删除供应商主数据，自动传到SAP系统做对应的处理
		
		String flag = "temp";
		String flagid = "wangdian_intf_flag";
		flag = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("YD_CONFIG", flagid);
		
		com.yd.soa.intf.sap.CustomDestinationDataProvider myProvider = com.yd.soa.intf.sap.CustomDestinationDataProvider.getInstance();
//		函数
		JCoFunction function = null;
		JCoDestination destination = null;
		if("wangdian_intf_flag".equals(flag)){
			LogUtil.logInfo("YD_INTF","给SAP推送网点数据信息：{0}", null, flag);
			destination = myProvider.getJCoDestination2();
			function = destination.getRepository().getFunction(funcName);
			
			
		}else if("800".equals(flag)){
			LogUtil.logInfo("YD_INTF","给SAP推送网点数据信息：{0}", null, flag);
			
			destination = myProvider.getJCoDestination();
			function = destination.getRepository().getFunction(funcName);
		}else if("200".equals(flag)){
			LogUtil.logInfo("YD_INTF","给SAP推送网点数据信息：{0}", null, flag);
			destination = myProvider.getJCoDestination2();
			function = destination.getRepository().getFunction(funcName);
		}else{
			destination = myProvider.getJCoDestination();
			function = destination.getRepository().getFunction(funcName);
		}
		
		
		
		if (function == null){
			LogUtil.logInfo("YD_INTF","给SAP推送网点信息：{0} not found in SAP.", null, funcName);
			throw new RuntimeException(funcName + "not found in SAP.");
		}

        //输入参数
		LogUtil.logInfo("YD_INTF","给SAP推送网点数据信息input param：{0}", null, paramData);
		//JCoParameterList input = function.getTableParameterList();
		
		JCoParameterList input = function.getImportParameterList();
		JCoStructure input_tb = input.getStructure("LS_IN");
		try{
			
			input_tb.setValue("ZTYPE",paramData.getString("chuangkouweihu"));//YES,维护类型（新增，修改，删除）1.2.3.改为C,M,D
			input_tb.setValue("KUNNR",paramData.getString("bianma"));//YES,客户编号  公司代码
			input_tb.setValue("KTOKD",paramData.getString("kehuleixing"));//,YSE,帐户组 网点：Z001
			input_tb.setValue("ANRED",paramData.getString("khmc"));//,YES，客户标题
			input_tb.setValue("NAME1",paramData.getString("gsname"));//YES,客户描述1 公司名称
			//默认002？
			input_tb.setValue("SORTL",paramData.getString("zuawa"));//YES,排序字段
			input_tb.setValue("STRAS",paramData.getString("gszcaddr"));//YES,地址  注册执照地址
			//表单无
			input_tb.setValue("LAND1",paramData.getString("country"));//YES,国家
			//表单无
			input_tb.setValue("ORT01",paramData.getString("city"));//YES,城市
			//表单无
			input_tb.setValue("REGIO",paramData.getString("shengfeng"));//YES,地区
			input_tb.setValue("TELF1",paramData.getString("gsphone"));//,电话 手机号码
			//无，非必填？
			input_tb.setValue("TELFX",paramData.getString("chuanzhen"));//,传真
			//无，非必填？
			input_tb.setValue("VBUND",paramData.getString("huoban"));//,YES贸易伙伴
			input_tb.setValue("STCEG",paramData.getString("gsswh"));//,增值税登记号  税务登记号
			input_tb.setValue("NAME2",paramData.getString("gsfzr"));//YES,联系人 公司负责人
			input_tb.setValue("TELF2",paramData.getString("gstell"));//YES,电话 公司电话
			input_tb.setValue("BUKRS",paramData.getString("gongsidaima"));//YES,公司代码
			//统驭科目 无
			input_tb.setValue("AKONT",paramData.getString("tongyukemu"));//YES,统驭科目
			//无，非必填 ？
			input_tb.setValue("BZIRK",paramData.getString("sail"));//YES,销售地区
			input_tb.setValue("LCNUM",paramData.getString("processinstid"));//YES,流程号
			//2013-03-18 新增字段	
			input_tb.setValue("NAME3",paramData.getString("gszzname"));//YES,客户名称	NO.21
			LogUtil.logInfo("YD_INTF","saveData2Sap,ZSD_RFC_FM01:{0}", null, input_tb.toXML());
		}catch(Exception e){
			
			LogUtil.logError("YD_INTF","给SAP推送网点数据信息func_inputparam：{0}", e.getCause(), e.getMessage());
		}
		
		//函数执行
		try {
			function.execute(destination);
		} catch (AbapException e) {
			e.printStackTrace();
			LogUtil.logInfo("YD_INTF","给SAP推送网点数据信息error_func：{0}", null, "函数执行异常!");
		}
		
		//输出参数
		JCoParameterList plist = function.getExportParameterList();
		DataObject retObject = DataObjectUtil.createDataObject("com.yd.soa.intf.out.intfcomm.Inparam");
		retObject.set("KUNNR", plist.getString("KUNNR"));//客户编号
		retObject.set("ERROR", plist.getString("ERROR"));
		retObject.set("MSAGE", plist.getString("MSAGE"));
		
		LogUtil.logInfo("YD_INTF","给SAP推送网点数据信息end：{0}", null, retObject);
		return retObject;
	}
}
