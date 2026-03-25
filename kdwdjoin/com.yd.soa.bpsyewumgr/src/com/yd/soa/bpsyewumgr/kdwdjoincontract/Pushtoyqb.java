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


package com.yd.soa.bpsyewumgr.kdwdjoincontract;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.alibaba.fastjson.JSONArray;
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
public class Pushtoyqb {
	
	/**
	 * 调用韵签宝签字盖章
	 * @param processInfo   流程信息
     * @param activityInstID   activityInstID
     * @param activityDefID   当前活动节点ID
     * @param content   消息内容
     * @return ResponseMsg    返回结果
	 */
	  @Bizlet("数据推送")
	  public static String[] pushdatatoyqb(DataObject processInfo, DataObject[] processDetail,String activityInstID, String activityDefID)
	  {  
	    String postUrl = null;
	    String[] retData = new String[2];
	    System.out.println("网点加盟合同推送韵签宝开始--------------begin " + processInfo.get("processinstid"));
	    LogUtil.logInfo("YD_INTF", "网点加盟合同推送韵签宝开始--------------begin ", null);
	    JSONObject postData = new JSONObject();
	    try
	    {
	      //流程信息  
	      postData.put("mscapprovedate",dateChange(processInfo.getDate("mscapprovedate")));
	      postData.put("fwbapprovedate",dateChange(processInfo.getDate("fwbapprovedate")));
	      postData.put("psfw",processInfo.get("psfw"));
	      postData.put("npsfw",processInfo.get("npsfw"));
	      postData.put("processinstid", processInfo.get("processinstid"));
	      postData.put("appdateyear", dateChange(processInfo.getDate("appdate")).substring(0,5));
	      postData.put("appdate", dateChange(processInfo.getDate("appdate")));
	      postData.put("applyuserid", processInfo.get("applyuserid"));
	      postData.put("applyusername", processInfo.get("applyusername"));
	      postData.put("yzbm", processInfo.get("yzbm"));
	      postData.put("htlx", processInfo.get("htlx"));
	      
	      postData.put("fzrsametofr", processInfo.get("isfzrsametofr"));
	      postData.put("wdcode", processInfo.get("wdcode"));
	      postData.put("wdname", processInfo.get("wdname"));
	      postData.put("fzrname", processInfo.get("fzrname"));
	      postData.put("fzrmobile", processInfo.get("fzrmobile"));
	      postData.put("fzruserid", processInfo.get("wdcode") + "001");
	      postData.put("fzrsfzno", processInfo.get("fzrsfzno"));
	      postData.put("fzrsfzaddress", processInfo.get("fzrsfzaddress"));

	      if("1".equals(processInfo.get("isfzrsametofr"))){
	    	  postData.put("frname", processInfo.get("fzrname"));
		      postData.put("frmobile", processInfo.get("fzrmobile"));
		      postData.put("frsfzno", processInfo.get("fzrsfzno"));
		      postData.put("frsfzaddress", processInfo.get("fzrsfzaddress"));
	      }else{
	    	  postData.put("frname", processInfo.get("frname"));
		      postData.put("frmobile", processInfo.get("frmobile"));
		      postData.put("frsfzno", processInfo.get("frsfzno"));
		      postData.put("frsfzaddress", processInfo.get("frsfzaddress"));
	      }
	      
	      postData.put("fzrfrgx", processInfo.get("fzrfrgx"));
	      postData.put("fzrfrgxdetail", processInfo.get("fzrfrgxdetail"));
	      
	      postData.put("yyzzname", processInfo.get("yyzzname"));
	      postData.put("tyshxycode", processInfo.get("tyshxycode"));
	      postData.put("yyzzdatefrom", dateChange(processInfo.getDate("yyzzdatefrom")));
	      postData.put("yyzzdateto", dateChange(processInfo.getDate("yyzzdateto")));
	      postData.put("kdywjyxkz", processInfo.get("kdywjyxkz"));
	      if("3".equals(processInfo.get("htlx").toString())){
	    	  postData.put("xkzdatefrom", dateChange(processInfo.getDate("xkzdatefrom")));
	    	  postData.put("xkzzdateto", dateChange(processInfo.getDate("xkzzdateto")));
	    	  postData.put("sydatefrom", dateChange(processInfo.getDate("sydatefrom")));
		      postData.put("syzzdateto", dateChange(processInfo.getDate("syzzdateto")));
	      }
	      if(!"2".equals(processInfo.get("htlx").toString())){
	    	  postData.put("signDate", dateChange(processInfo.getDate("lcqddate")));
	      }
	      postData.put("zcaddress", processInfo.get("zcaddress"));
	      postData.put("wdsjjyaddress", processInfo.get("wdsjjyaddress"));
	      postData.put("zczj", processInfo.get("zczj"));
	      postData.put("yymj", processInfo.get("yymj"));
	      postData.put("czmj", processInfo.get("czmj"));
	      postData.put("jdc", processInfo.get("jdc"));
	      postData.put("fjdc", processInfo.get("fjdc"));
	      postData.put("isjk", processInfo.get("isjk"));
	      postData.put("jmf", processInfo.get("jmf"));
	      postData.put("bzj", processInfo.get("bzj"));
	      postData.put("yxdatefrom", dateChange(processInfo.getDate("yxdatefrom")));
	      postData.put("yxzzdateto", dateChange(processInfo.getDate("yxzzdateto")));
	      postData.put("remark", processInfo.get("remark"));
	      postData.put("guo", processInfo.get("guo")=="-"?"":processInfo.get("guo"));
	      postData.put("sheng", processInfo.get("sheng")=="-"?"":processInfo.get("sheng"));
	      postData.put("shi", processInfo.get("shi")=="-"?"":processInfo.get("shi"));
	      postData.put("qu", processInfo.get("qu")=="-"?"":processInfo.get("qu"));
	      
	      //网点股权信息
	      JSONArray array = new JSONArray();
	      for(int i=0;i<processDetail.length;i++){
	    	  JSONObject postDataDetail = new JSONObject();
	    	  postDataDetail.put("name", processDetail[i].get("name").toString());
	    	  postDataDetail.put("sfzno", processDetail[i].get("sfzno").toString());
	    	  postDataDetail.put("gfbl", processDetail[i].get("gfbl").toString());
	    	  array.add(postDataDetail);
	      }
	      postData.put("wdgqxx", array);

	      //活动定义id
	      postData.put("activityDefID", activityDefID);
	      //秘书处节点信息
	      String userid = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("kdmsc", "userid");
	      postData.put("mscuserid", userid);
	      String username = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("kdmsc", "username");
	      postData.put("mscusername", username);
	      String mobile = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("kdmsc", "mobile");
	      postData.put("mscmobile", mobile);
	      
	      System.out.println("postData---"+postData.toJSONString());
          
	      LogUtil.logInfo("YD_INTF", "网点加盟合同推送韵签宝{0}:返回消息{1}:【{2}】", null, processInfo,retData,postData.toJSONString());
	      postUrl = com.eos.foundation.eoscommon.BusinessDictUtil.getDictName("PUSHWDJOINHTTOYQB", "url");
	      String oData = HttpClientExt.callHttpWithPost2(postUrl, "POST", postData.toJSONString());
	      JSONObject jo = JSONObject.parseObject(oData);
	      retData[0] = jo.getString("code");
	      System.out.println("返回信息====="+jo.toJSONString());
	      retData[1] = jo.getString("message");
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    System.out.println("网点加盟合同推送韵签宝结束--------------end ");
	    System.out.println(retData.toString());
	    LogUtil.logInfo("YD_INTF", "网点加盟合同推送韵签宝结束--------------end ", null);
	    return retData;
	  }
	  
	  public static String dateChange(Date date){
		  String dateString = "";
//		  String[] dateArr = date.split("-");
//		  String newDate = dateArr[0] + "年" + dateArr[1] + "月" + dateArr[2] + "日";
		  if(date != null){
			  SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
			  dateString = formatter.format(date);
		  }
		  return dateString;
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
