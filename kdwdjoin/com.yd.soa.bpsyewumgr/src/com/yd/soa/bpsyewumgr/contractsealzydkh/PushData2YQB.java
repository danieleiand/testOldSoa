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
 * Created on 2020-8-11
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.contractsealzydkh;


import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.http.HttpClientExt;
import com.yd.soa.comm.log.LogUtil;
import commonj.sdo.DataObject;

/**
 * TODO fill class info here
 *
 * @author shaw
 * @date 2020-08-11 20:10:32
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class PushData2YQB {
	
	
	/**
	 * 合同推送
	 * @param appId   管理员配置的appId
     * @param useridList   接收消息用户列表
     * @param msgType   消息类型
     * @param content   消息内容
     * @return ResponseMsg    返回结果
	 */
	  @Bizlet("数据推送")
	  public static String[] pushData2YQB(DataObject processData,DataObject[] processDetailData,DataObject[] hetongData)
	  {  
	    String postUrl = null;
	    String[] retData = new String[2];
	    System.out.println("推送韵签宝开始--------------begin ");
	    
	    Object itemName = processDetailData[0].get("itemName");
	    
	    System.out.println("itemName：" + itemName);
	    
	    LogUtil.logInfo("YD_INTF", "推送韵签宝开始--------------begin ", null);
	    JSONObject postData = new JSONObject();
	    try
	    {
	      postData.put("processData", processData);
	      postData.put("processDetailData", processDetailData);
	      postData.put("hetongData", hetongData);
	      
	      postUrl = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("PUSHDATATOYQB", "url");
	      System.out.println(postUrl);
//	      postUrl = "http://10.19.160.151:3333/yqb2soa/commplete";
          
	      LogUtil.logInfo("YD_INTF", "推送韵签宝{0}:{1}", null, processData,hetongData);
	      String oData = HttpClientExt.callHttpWithPost2(postUrl, "POST", postData.toJSONString());
	      JSONObject jo = JSONObject.parseObject(oData);
	      retData[0] = jo.getString("code");
	      retData[1] = jo.getString("message");
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    System.out.println("推送韵签宝结束--------------end ");
	    System.out.println(retData);
	    LogUtil.logInfo("YD_INTF", "推送韵签宝结束--------------end ", null);
	    return retData;
	  }
	

	/**
	 * @param args
	 * @author shaw
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
