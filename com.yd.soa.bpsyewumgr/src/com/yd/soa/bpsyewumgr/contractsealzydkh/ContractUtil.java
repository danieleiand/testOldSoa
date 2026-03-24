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
 * Created on 2016-7-8
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.contractsealzydkh;


import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.alibaba.fastjson.JSONObject;
import com.eos.foundation.common.utils.DateUtil;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.system.exception.EOSException;
import com.yd.soa.comm.PropertiesCacheUtil;
import com.yd.soa.comm.log.LogUtil;
import commonj.sdo.DataObject;

/**
 * TODO fill class info here
 *
 * @author 宋杰
 * @date 2016-07-08 14:05:24
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class ContractUtil {
	private static final String sufix = "000";

@Bizlet
public synchronized static String getContractSerialNoDsk(String bizTypeCode,String cTempCode) throws EOSException {
	DataObject csealconf = DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.contractseal.ydywcontractseal.YdYwCsealConf");
	csealconf.set("bizTypeCode", bizTypeCode);
	csealconf.set("cTempCode", cTempCode);
	Long serialNum = 0l;
	String serialDate = "";
	int count1 = DatabaseUtil.expandEntityByTemplate("default", csealconf, csealconf);
	if (count1 !=1 ) {
		throw new EOSException("[Contract]未找到对应的合同类型bizTypeCode:"+bizTypeCode+"，cTempCode:"+cTempCode);
	}else{
		serialDate = csealconf.getString("serialDate");
		String currentDate = DateUtil.format(DateUtil.getJVMDate(), "yyyyMMdd");
		serialNum = csealconf.getLong("serialNum");
		if (currentDate.equals(serialDate)) {
			serialNum= serialNum+1;
			csealconf.setLong("serialNum", serialNum);
		}else{
			serialDate = currentDate;
			serialNum = 1l;
			csealconf.setString("serialDate", currentDate);
			csealconf.setLong("serialNum",serialNum);
		}
		DatabaseUtil.saveEntity("default", csealconf);
	}
	String sn = String.valueOf(serialNum);
	String ret = "YDHT-"+bizTypeCode+"-" + cTempCode +"-" +serialDate+"-" +sufix.substring(sn.length())+serialNum;
	return ret;
}


	@Bizlet
	public synchronized static String getContractSerialNo(String bizTypeCode,String cTempCode) throws EOSException {
		Long serialNum = 0l;
		String serialDate = "";
		String currentDate = DateUtil.format(DateUtil.getJVMDate(), "yyyyMMdd");
		serialDate = currentDate;
		serialNum = 1l;
		String sn = String.valueOf(serialNum);
		String ret = "YDHT-"+bizTypeCode+"-" + cTempCode +"-" +serialDate+"-" +sufix.substring(sn.length())+serialNum;
		return ret;
	}
	
	/**
	 * 参考接口HttpClient
	 * 参考说明文档http://10.19.106.82:7001/wxs/ui/help/msg/.sendMsg.md.html
	 * @param empid
	 * @param empname
	 * @param qiangdantime
	 * @param processinstid
	 * @return
	 */
	@Bizlet
	public static String[] sendMsg2WeChat(String empid,String empname,String handlerid,String handlername,Date qiangdantime,String processinstid,String processtitle ){
		String ret[] = new String[2];
		String errcode = "0";	//推送成功
		JSONObject retobj = new JSONObject();	//返回信息
		String retdata = "";					//返回的信息
		String logcontent = PropertiesCacheUtil.getKey("intf.esb.logcontent","false");	//是否详细记录推送日志
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=df.format(new Date());
		String qiangdantimeStr=df.format(qiangdantime);
		String msgcontent=empname+"你有一条"+processtitle+"超过24小时未做审批操作，请及时审批！\n"+currentDate+"\n【流程ID】："+processinstid+"\n【流程经办人】："+handlername+"("+handlerid+")"+"\n【抢单成功时间】："+qiangdantimeStr;
		System.out.println(msgcontent);
		JSONObject postdata =new JSONObject();
		postdata.put("msg_src", "1"); 
		postdata.put("msg_src_sys", "soa");
		postdata.put("agentid", "32"); 
		postdata.put("touser",empid);
		postdata.put("msgtype","text"); 
		postdata.put("msgcontent",msgcontent);
		postdata.put("safe","0");
		
		try{
			String data=postdata.toJSONString();
			data=URLEncoder.encode(data,"UTF-8");
			retdata =com.yd.soa.pw.intf.HttpClient.call(PropertiesCacheUtil.getKey("intf.wechat.ctms.wechat.url"),data, "POST", com.yd.soa.pw.intf.HttpClient.CONTENT_TYPE_JSON);
			retobj =  JSONObject.parseObject(retdata);
			
			System.err.println(retdata);
			System.err.println(retdata.indexOf("errorCode"));
			
			if(retdata.indexOf("errorCode")>0){//成功的操作返回
				if(retdata.indexOf("\"errorCode\":0")>0){//正常回执并成功发送消息
					errcode = "0";
				}else{//正常回执但消息发送失败
					errcode = "-1";
				}
				retdata = retobj.getString("msg");
			}else{//url配置错误或post数据不完整等其他错误，消息发送异常
				errcode = "-2";
				if(retdata.indexOf("result")>0){	
					retdata = retobj.getString("message")+retobj.getString("code");	//获取错误信息
				}else{
					retdata = "{"+retdata+"} 出错，请联系体系管理组！";
				}
			}
			
			if("true".equals(logcontent)){
				LogUtil.logInfo("YD_INTF", "send_qywechat_{0}:返回消息{1}:【{2}】", null, empid,retdata,postdata.toString());
			}else{
				LogUtil.logInfo("YD_INTF", "send_qywechat_{0}:返回消息{1}", null, empid,retdata);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ret[0] = errcode;
			ret[1] = retdata;
		}
		
		return ret;
	}
}
