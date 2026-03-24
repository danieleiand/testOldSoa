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
 * Created on 2020-9-8
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.contractseal;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.python.modules.re;


import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import com.sap.conn.jco.AbapException;
import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoException;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.thoughtworks.xstream.mapper.ArrayMapper;

import commonj.sdo.DataObject;

@Bizlet("")
public class GetSapMessage {
	@Bizlet("全量同步SAP公司代码")
	public static void hetgzGetSapGsdm() throws JCoException {
		String type = "ZFI_SOA_BUKRS";
		String x = "";
		String seq="";
		// sapResultField(type,x);
		JCoTable tb = getSap(type, "FLAG", x, "ET_OUTPUT", seq);//获取SAP公司数据
		int count = tb.getNumRows();
		DataObject dataObject[]=null;
		List<DataObject> dataObjectList=new ArrayList<DataObject>();
		for (int i = 0; i <count; i++) {
			tb.setRow(i);
			DataObject ot=DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.contractseal.getSapGsDm.YdSapSoaGs");
			ot.set("companycode",  tb.getString("BUKRS"));
			ot.set("companyname",  tb.getString("BUTXT"));
			dataObjectList.add(ot);
		}
		dataObject= (DataObject[])dataObjectList.toArray(new DataObject[dataObjectList.size()]);
		DatabaseUtil.saveEntities("default", dataObject);//入库
	}
	
	
	public static JCoTable getSap(String funcName, String flagName, String flagValue,
			String resultName, String seq) throws JCoException {
		com.yd.soa.intf.sap.CustomDestinationDataProvider myProvider = com.yd.soa.intf.sap.CustomDestinationDataProvider
				.getInstance();

		JCoDestination destination = myProvider.getJCoDestination();

		// 函数
		JCoFunction function = destination.getRepository().getFunction(funcName);// 函数名
		if (function == null)
			throw new RuntimeException(funcName + "not found in SAP.");

		// 函数参数 入参
		//JCoParameterList input = function.getImportParameterList();// 获取输入参数列表
		//input.setValue(flagName, flagValue); // 设置输入参数值 [参数名 ，参数值] P_FAG 为X
		// 表示全量 为空表示增量抽取 "P_FAG" "FLAG"

		// 函数执行
		try {
			function.execute(destination);
		} catch (AbapException e) {
			e.printStackTrace();
		}
		// 函数调用后的返回值
		JCoParameterList plist = function.getTableParameterList();
		JCoTable tb = plist.getTable(resultName); // 获取结果table "ZHR_DATA"
		// "T_RESULT"
		int count = tb.getNumRows();
		System.out.println("同步" + funcName + ":" + seq + " 数据:" + count + "条");
		return tb;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		try {
			//GetSapMessage.hetgzGetSapGsdm();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
