package com.yd.soa.bpsyewumgr.contractsealGYL;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.httpclient.methods.PostMethod;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.PropertiesCacheUtil;
import com.yd.soa.comm.http.HttpClientExt;
import com.yd.soa.comm.log.LogUtil;
import com.yd.soa.comm.utils.Tools;
import commonj.sdo.DataObject;

@Bizlet("合同相关系统接口")
public class CtmsIntf {
	public static final String CTMS_IP =  PropertiesCacheUtil.getKey("intf.ctms.mgr") ;
	
	@Bizlet("推送数据至合同管理系统")
	public static String pushData2ctms(String postValue,String intfType){
		// 根据接口类型，获取不同的地址 JY:合同借阅流程  GZ:合同盖章审批流程  
		String results = "-1" ;
		String postUrl = CTMS_IP ;
		JSONObject retData = new JSONObject();
		Date begintime = new Date();
		Date endtime = null ;
		try {
			if ("JY".equalsIgnoreCase(intfType)) {
				postUrl += "/ctms/ct/addBorrowData.do" ;
			} else if("GZ".equalsIgnoreCase(intfType)){
				postUrl += "/ctms/ct/addMainInfoData.do" ;
			}
			String retStr = HttpClientExt.callHttpWithPost2(postUrl,PostMethod.FORM_URL_ENCODED_CONTENT_TYPE, postValue) ;
			if(retStr != null && !retStr.isEmpty())
				results = JSONObject.parseObject(retStr).getString("errorCode");
			
			endtime = new Date();
			insertLogData(begintime, endtime, results) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		LogUtil.logInfo("YD_INTF", "[pushData2ctms]推送数据至合同管理系统：系统类型：{0} ; 参数：{1} ; 返回值：{2}", null,intfType, postValue, retData);
		return results;
	}
	
	// 组装 合同盖章审批流程数据
	@Bizlet("组装合同盖章审批流程数据")
	public static String prepareGZData(DataObject jsondata){
		JSONObject returnJO = new JSONObject() ;
		returnJO.put("ct_codestr", "YDHT-" + jsondata.get("barCode")) ;
		returnJO.put("ct_title", jsondata.get("contractTitle")) ;
		returnJO.put("own_name", jsondata.get("ownName")) ;
		returnJO.put("coop_name", jsondata.get("copName")) ;
		returnJO.put("amt", jsondata.get("conAmt"));
		returnJO.put("amt_ch", jsondata.get("conAmtCh"));
		returnJO.put("handler_name", jsondata.get("handlername")) ;
		returnJO.put("handler_dep_id", jsondata.get("applyoid")) ;
		returnJO.put("handler_dep_name", jsondata.get("applyoname")) ;
		returnJO.put("biz_type", jsondata.get("bizType")) ;
		returnJO.put("ct_desc", jsondata.get("summary")) ;
		returnJO.put("save_path", jsondata.get("filePath"));
		returnJO.put("start_datestr", jsondata.get("startDate")) ;
		returnJO.put("app_date", substringStr(jsondata.get("appdate").toString())) ;
		returnJO.put("end_datestr",substringStr(jsondata.get("endDate").toString())) ;
		returnJO.put("agree_date", substringStr(jsondata.get("appdate").toString())) ;
		returnJO.put("operator", jsondata.get("handlerid")) ;
		returnJO.put("oper_name", jsondata.get("handlername")) ;
		return returnJO.toJSONString() ;
	}
	
	// 合同借阅流程
	@Bizlet("组装合同借阅数据")
	public static String prepareJYData(DataObject borrow, DataObject[] items, String processInstID){
		if (items.length == 0 || items == null) {
			return "-1" ;
		}
		JSONArray array = new JSONArray() ;
		for (int i = 0; i < items.length; i++) {
			JSONObject itemJO = new JSONObject() ;
			itemJO.put("serial_num", new StringBuffer().append("SOA_").append(processInstID).toString()) ;
			itemJO.put("ct_codestr", items[i].get("contractNum")) ;
			itemJO.put("ct_title", items[i].get("contractName")) ;
			itemJO.put("borrow_type", items[i].get("borrowType")) ;
			itemJO.put("borrow_count", items[i].get("borrowCount")) ;
			itemJO.put("borrow_remark", items[i].get("borrowRemark")) ;
			itemJO.put("back_date", items[i].get("backDate")) ;
			
			itemJO.put("borrow_status", borrow.get("condition")) ;
			itemJO.put("app_id", borrow.get("applyuserid")) ;
			itemJO.put("app_name", borrow.get("applyusername")) ;
			itemJO.put("app_dep_id", borrow.get("applypid")) ;
			itemJO.put("app_dep_name", borrow.get("applypname")) ;
			itemJO.put("operator", borrow.get("handlerid")) ;
			itemJO.put("oper_name", borrow.get("handlername"));
			itemJO.put("create_time", new SimpleDateFormat("yyyy-mm-dd HH:mm:ss").format(new Date()));
			array.add(itemJO) ;
		}
		System.out.println("输出参数：========" + array.toJSONString());
		return array.toJSONString() ;
	}
	
	@Bizlet("修改合同借阅状态")
	public static void updateBorrowType(String codeStrs, String processInstID){
		String url = new StringBuffer().append(CTMS_IP).append("/ctms/ct/updateBorrowStatus.do").toString() ;
		JSONObject jo = new JSONObject() ;
		jo.put("codeStrs", codeStrs) ;
		jo.put("condition", "4") ;
		String retData = null ;
		try {
			retData = HttpClientExt.callHttpWithPost2(url,PostMethod.FORM_URL_ENCODED_CONTENT_TYPE, jo.toJSONString()) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		LogUtil.logInfo("YD_INTF", "[updateBorrowType]合同借阅流程至合同管理系统：流程实例：{0} ;合同编码: {1}; 返回值：{2}", null, processInstID, codeStrs, retData);
	}
	
	// 将数据插入日志表，便于查询
	public static void insertLogData(Date begin, Date end, String status){
		DataObject commIntfObj = DataObjectUtil.createDataObject("com.yd.soa.intf.log.intflog.YdIntfLoginfo");
		commIntfObj.set("ldid", Tools.getUUID());									//主键
		commIntfObj.set("ldtype", "1");												//接口类型
		commIntfObj.set("ywtype", "oa-to-ctms");									//业务类型
		commIntfObj.set("inftype", "http");											//接口方式
		commIntfObj.set("btime", begin);											//接口开始推送时间
		commIntfObj.set("etime", end);												//接口结束推送时间
		commIntfObj.set("dresult", status);											//处理结果
		commIntfObj.set("ddec", "SOA推送合同盖章审批流程数据到合同管理系统");			//描述
	}
	
	// 对 date 进行截取
	public static String substringStr(String str){
		return str==null?str:str.substring(0,str.length()-2) ;
	}
	
	// 组装需要修改的合同条码
	@Bizlet("组装需要修改的合同条码")
	public static String appendContractCodes(DataObject[] datas){
		StringBuffer codeStrs = new StringBuffer() ;
		for (DataObject item : datas) {
			codeStrs.append(item.get("contractNum")).append(",") ;
		}
		return codeStrs.toString().substring(0, codeStrs.toString().length()-1) ;
	}
	
	public static void main(String[] args) {
		JSONObject jo = new JSONObject() ;
		String codeStrs = "YDHT-CGGC-JSGCSG-20160930-1223,63b91d05bcc2422eb500b36466ee5a9c" ;
		jo.put("codeStrs", codeStrs) ;
		jo.put("condition", "4") ;
		System.out.println(jo.toJSONString());
		
	}
}
