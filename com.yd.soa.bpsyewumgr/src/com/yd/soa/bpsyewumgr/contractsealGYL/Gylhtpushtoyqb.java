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
 * Created on 2019-12-31
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.contractsealGYL;

import com.alibaba.fastjson.JSONObject;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.http.HttpClientExt;
import com.yd.soa.comm.log.LogUtil;
import commonj.sdo.DataObject;

/**
 * TODO fill class info here
 *
 * @author shaw
 * @date 2019-12-31 10:13:34
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("推送韵签宝接口")
public class Gylhtpushtoyqb {
	
	/**
	 * 调用韵签宝签字盖章
	 * @param processInfo   流程信息
     * @param activityInstID   activityInstID
     * @param activityDefID   当前活动节点ID
     * @param content   消息内容
     * @return ResponseMsg    返回结果
	 */
	  @Bizlet("数据推送")
	  public static String[] pushdatatoyqb(DataObject processInfo, DataObject fileInfo,String activityInstID, String activityDefID)
	  {  
		  JSONObject processData = new JSONObject();
			//流程信息
			String processinstid = processInfo.get("processinstid").toString();
			String handlerid = processInfo.get("handlerid").toString();
			String handlername = processInfo.get("handlername").toString();
			String applyuserid = processInfo.get("applyuserid").toString();
			String applyusername = processInfo.get("applyusername").toString();
			String ownName = processInfo.get("ownName").toString();
			String copName = processInfo.get("copName").toString();
		
			processData.put("contractName", processInfo.get("contractTitle").toString());
			processData.put("processinstid", processinstid);
			processData.put("handlerid", handlerid);
			processData.put("handlername", handlername);
			processData.put("applyuserid", applyuserid);
			processData.put("applyusername", applyusername);
			processData.put("ownName", ownName);
			processData.put("copName", copName);
			
			//活动定义id
			processData.put("activityDefID", activityDefID);
			
			//附件信息
			JSONObject fileData = new JSONObject();
			String fileid = fileInfo.get("FILE_ID").toString();
			String filename = fileInfo.get("FILE_NAME").toString();
			String filepath = fileInfo.get("FILE_PATH").toString();
			fileData.put("fileid", fileid);
			fileData.put("filename", filename);
			fileData.put("filepath", filepath);
			
		    //秘书处节点信息
		    JSONObject mscData = new JSONObject();
		    String userid = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("kdmsc", "userid");
		    mscData.put("mscuserid", userid);
		    String username = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("kdmsc", "username");
		    mscData.put("mscusername", username);
		    String mobile = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("kdmsc", "mobile");
		    mscData.put("mscmobile", mobile);

			
		    String postUrl = null;
		    String[] retData = new String[2];
		    System.out.println("供应链合同流程调用韵签宝签字盖章--------------begin ");
		    LogUtil.logInfo("YD_INTF", "供应链合同流程调用韵签宝签字盖章--------------begin ", null);
		    JSONObject postData = new JSONObject();
		    try
		    {
		      postData.put("processInfo", processData);
		      postData.put("fileInfo", fileData);
		      postData.put("mscNodeInfo", mscData);
		      System.out.println("postData---"+postData.toJSONString());
		      postUrl = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("gylhtcallyqb", "url");
//		      postUrl = "http://10.19.160.151:3333/yqb2soa/commplete";
		      System.out.println(postUrl);
	        
		      LogUtil.logInfo("YD_INTF", "供应链合同流程调用韵签宝签字盖章{0}:返回消息{1}:【{2}】", null, processinstid,retData,postData.toJSONString());
		      String oData = HttpClientExt.callHttpWithPost2(postUrl, "POST", postData.toJSONString());
		      JSONObject jo = JSONObject.parseObject(oData);
		      System.out.println("供应链合同流程调韵签宝返回信息====="+jo.toJSONString());
		      retData[0] = jo.getString("code");
		      retData[1] = jo.getString("message");
		    }
		    catch (Exception e)
		    {
		      e.printStackTrace();
		    }
		    System.out.println("供应链合同流程调用韵签宝签字盖章结束--------------end ");
		    System.out.println(retData);
		    LogUtil.logInfo("YD_INTF", "供应链合同流程调用韵签宝签字盖章结束--------------end ", null);
		    return retData;
		  }
	  

	/**
	 * @param args
	 * @author shaw
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub  2020-12-18 16:46:48.0
//		pushdatatoyqb("123456", "2", "测试");
//		Date currentTime = new Date();
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
//		String dateString = formatter.format(currentTime);
////		Date aa = dateChange("2020-01-03");
//		System.out.println(dateString);
	}
}
