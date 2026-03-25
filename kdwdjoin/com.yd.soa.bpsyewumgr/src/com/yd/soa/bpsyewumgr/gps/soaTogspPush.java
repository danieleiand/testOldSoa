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
 * Created on 2020-1-9
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.gps;

import java.text.SimpleDateFormat;

import com.alibaba.fastjson.JSONObject;
import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;


@Bizlet("SOA推送数据至GPS")
public class soaTogspPush {
@Bizlet("组装推送数据")

	public static  String dataAssembly (DataObject dataTemp){
		JSONObject jsonParam =new JSONObject();
		jsonParam.put("equip_id",dataTemp.getString("equipId"));
	
		jsonParam.put("status",dataTemp.getString("status"));
		jsonParam.put("type",dataTemp.getString("type"));
		jsonParam.put("time",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dataTemp.getDate("time")));
		jsonParam.put("process_num",dataTemp.getString("processNum"));
		jsonParam.put("reason",dataTemp.getString("reason"));
		jsonParam.put("operate_by",dataTemp.getString("operateBy"));
		if(dataTemp.getString("type").equals("1")){
		jsonParam.put("vehicle_num", dataTemp.getString("yijiVehicleNum"));
		jsonParam.put("branch_code",dataTemp.getString("yijiBranchCode"));
		}
		if(dataTemp.getString("type").equals("2")){
		jsonParam.put("vehicle_num", dataTemp.getString("vehicleNum"));
		jsonParam.put("branch_code",dataTemp.getString("branchCode"));
		}
		return jsonParam.toJSONString();
	}
	

}