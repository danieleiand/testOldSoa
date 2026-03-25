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
 * Created on 2015-12-22
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.wangdianreplace;


import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.httpclient.methods.PostMethod;

import com.alibaba.fastjson.JSONObject;
import com.eos.engine.component.ILogicComponent;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;
import com.primeton.ext.engine.component.LogicComponentFactory;
import com.yd.soa.comm.PropertiesCacheUtil;
import com.yd.soa.comm.http.HttpClientExt;
import com.yd.soa.comm.log.LogUtil;
import com.yd.soa.intf.cmp.CmpIntf;
import com.yd.soa.intf.wechat.WechatIntf;
import com.yd.soa.rtx.client.RTXUtils;
import commonj.sdo.DataObject;

/**
 * TODO fill class info here
 *
 * @author 宋杰
 * @date 2015-12-22 09:42:01
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class WangdiangreplaceUtil {

	private static String query_wait_approve_process ="com.yd.soa.bpsyewumgr.wangdianreplace.wangdianreplace.query_wait_approve_process";
	private static String query_wdmessage_process ="com.yd.soa.bpsyewumgr.wangdianreplace.wangdianreplace.query_wdmessage_process";
	private static String updateWangdianYvFuKuan ="com.yd.soa.bpsyewumgr.wangdianreplace.wangdianreplace.updateWangdianYvFuKuan";
	private static String componentName = "com.yd.soa.bpsyewumgr.wangdianreplace.wangdianreplace";// 逻辑构件名称
	private static String operationName = "saveWangdianreplaceapprovalinfo";// 逻辑流名称
	String type = null;//接口传递时的新增及变更类型  1.新开分部  2.新开网点 3.新开服务部 4.服务部变更上级网点 5.服务部转为网点 6.网点转为服务部 7.网点转为分部  8.分部变服务部 9.服务部变更为分部 10.分部变更为网点 11.分部变更上级网点
	String retdata = "";//得到接口返回的结果
	String com_code = null;//接口传递参数下级机构
	String sjwd = null;//接口传递参数上级机构
	String create_user = null;//接口传递参数创建人
	String successstatus = null;//接口返回状态(成功)
	String failurestatus = null;//接口返回时的错误信息
	String tuisongtype = null;//SOA数据推送状态
	String shujulaiyuan = null;// 数据来源
	
	
	String xkscktype = null;//申请时的窗口性质
	JSONObject objects = new JSONObject();
	StringBuffer message = null;
	String wdcode = null;
	String retkey = PropertiesCacheUtil.getKey("intf.cmp.getchangestatus");
	String chuangkouweihu = null;//窗口维护类型
	String wcode = null;//临时存储网点编码
	String fcode = null;////临时存储网点编码
	long processinstid =0;
	String wxingzhi = null;
	/**
	 * 定时审批 网点新增及修改流程的 信息中心权限管理员 节点
	 * 条件：
	 * 1. 只拦截更换窗口性质、更换上级公司 其它情况直接审批通过
	 * 2. 14:30-15:00之间
	 * 3. 预付款余额小于0 普通预付款余额、实业预付款余额
	 */
	@Bizlet
	public void approveTiming(){
		LogUtil.logInfo("YD_COMM", "[定时审批] 开始 定时获取 网点新增及修改流程 待审批流程！", null,  "");
		Object[] result = DatabaseExt.queryByNamedSql("default", query_wait_approve_process, null);
		LogUtil.logInfo("YD_INTF", "新增时打印传递的参数长度:{0},返回信息状态：{1}", null, result.length);
		if (result!=null && result.length>0) {
			for (Object object : result) {
				DataObject wangdianreplace = (DataObject) object;
				processinstid = wangdianreplace.getLong("processinstid");
				chuangkouweihu = wangdianreplace.getString("chuangkouweihu");//窗口维护类型
				String genghuantype = wangdianreplace.getString("genghuantype");	//更换窗口名称或资料
				xkscktype = wangdianreplace.getString("xkscktype");//申请时的窗口性质  1:分部 2:服务部 3:网点
				wcode = wangdianreplace.getString("bianma");//网点编码
				fcode = wangdianreplace.getString("aaaa");//网点编码
				create_user = wangdianreplace.getString("handlerid");//创建人--经办人id
				String useid = wangdianreplace.getString("applyuserid");////申请人--申请人id
				wxingzhi = wangdianreplace.getString("wxingzhi");////网点性质
				
				
				//System.out.println("窗口维护类型》》》》》"+chuangkouweihu);
				//System.out.println("更换窗口名称或资料genghuantype》》》》》"+genghuantype);
				//System.out.println("窗口性质类型xkscktype》》》》》"+xkscktype);
				//System.out.println("网点编码》》》》》"+wcode);
				//System.out.println("网点编码》》》》》"+fcode);
				//System.out.println("创建人》》》》》"+create_user);
				
				if ("M".equals(chuangkouweihu) && ("3".equals(genghuantype) || "4".equals(genghuantype))) {
					if ("3".equals(genghuantype)) {//更换窗口性质
					wdcode = wcode;
				}if(("3".equals(genghuantype)&&"2".equals(xkscktype))){
					wdcode = fcode;//特殊情况的处理
				}
				if(("3".equals(genghuantype)&&"1".equals(xkscktype))){
					wdcode = fcode;
				}
				else if ( "4".equals(genghuantype)) {//更换上级公司
					wdcode = fcode;
				} 
					
					LogUtil.logInfo("YD_INTF", "新增时打印传递的参数(传递的网点代码):{0},返回信息状态：{1}", null,wdcode);
//					Object[] objwds = DatabaseExt.queryByNamedSql("default", query_wdmessage_process, wdcode);
//					if(null!=objwds&&objwds.length>0){
//						DataObject objwd = (DataObject)objwds[0];
//						wxingzhi =  objwd.getString("wxingzhi");
//					}
					LogUtil.logInfo("YD_INTF", "新增时打印传递的参数(获取原网点代码):{0},返回信息状态：{1}", null, wxingzhi);
					
					//System.out.println("》》》》》》》》》》》》》》》》》》");
					
					//wxingzhi中1代表分部  2代表服务部  3代表网点   //xkscktype 申请时的窗口性质  1:分部 2:服务部 3:网点
					if("3".equals(wxingzhi)&&"3".equals(genghuantype)&&"2".equals(xkscktype)){
						type = "6";//网点转化为服务部
					}
					else if("2".equals(wxingzhi)&&"4".equals(genghuantype)&&"2".equals(xkscktype)){
						type = "4";//服务部变更上级网点
					}
					else if("2".equals(wxingzhi)&&"3".equals(genghuantype)&&"3".equals(xkscktype)){
						type = "5";//服务部转为网点
					}
					else if("3".equals(wxingzhi)&&"3".equals(genghuantype)&&"1".equals(xkscktype)){
						type = "7";//网点转化为分部
					}
					else if("1".equals(wxingzhi)&&"3".equals(genghuantype)&&"2".equals(xkscktype)){
						type = "8";//分部变服务部
					}
					else if("2".equals(wxingzhi)&&"3".equals(genghuantype)&&"1".equals(xkscktype)){
						type = "9";//服务部变更为分部
					}

					else if("1".equals(wxingzhi)&&"3".equals(genghuantype)&&"3".equals(xkscktype)){
						type = "10";//分部变更为网点										
					}
					
					else if("1".equals(wxingzhi)&&"4".equals(genghuantype)&&"1".equals(xkscktype)){
						type = "11";//分部变更上级网点
					}
					System.out.println("窗口性质wxingzhi》》》》》"+wxingzhi);
					if("4".equals(type)||"5".equals(type)||"6".equals(type)||"7".equals(type)||"8".equals(type)||"9".equals(type)||"10".equals(type)||"11".equals(type)){
						if("10".equals(type)|| "5".equals(type)){
							sjwd = wcode;
							com_code = wcode;
						}
						else{
							sjwd = wcode;
							com_code = fcode;
						}
						try{
							message = new StringBuffer();
							message.append(retkey);
							message.append("?com_code="+com_code);
							message.append("&sjwd="+sjwd);
							message.append("&create_user="+create_user);
							message.append("&type="+type);
							message.append("&pro_num="+processinstid);
							
							//System.out.println("retkey》》》》》"+retkey);
							//System.out.println("com_code》》》》》"+com_code);
//							System.out.println("sjwd》》》》》"+sjwd);
//							System.out.println("create_user》》》》》"+create_user);
//							System.out.println("type》》》》》"+type);
//							System.out.println("pro_num》》》》》"+processinstid);
//							System.out.println("message》》》》》"+message.toString());
							
							retdata = HttpClientExt.callHttpWithPost(message.toString(),PostMethod.FORM_URL_ENCODED_CONTENT_TYPE,null);
//							System.out.println("返回信息retdata》》》》》"+retdata);
							if(retdata == null){
								tuisongtype="0";
							}else{
								tuisongtype="1";
							}
//							retdata=retdata.replaceAll("=", ":");
//							System.out.println("返回信息后：retdata》》》》》"+retdata);
//							objects =  JSONObject.parseObject(retdata);
//							System.out.println("返回信息objects》》》》》"+objects);
//							
//							successstatus = objects.getString("xSuccess");
//							failurestatus = objects.getString("xMessage");
							
							successstatus = retdata.substring(retdata.indexOf("=")+1,retdata.indexOf(","));
							failurestatus = retdata.substring(retdata.lastIndexOf("=")+1,retdata.length()-1);
							
							shujulaiyuan="0";
							Map<String,String> paramMap = new HashMap<String, String>(5);
							paramMap.put("successstatus", successstatus);		//公司编码
							paramMap.put("failurestatus", failurestatus);	
							paramMap.put("tuisongtype", tuisongtype);
							paramMap.put("shujulaiyuan", shujulaiyuan);
							paramMap.put("processinstid",processinstid+"");	
							
//							System.out.println("返回信息状态successstatus》》》》》"+successstatus);
//							System.out.println("返回信息状态failurestatus》》》》》"+failurestatus);
							
							
							
							DatabaseExt.executeNamedSql("default",updateWangdianYvFuKuan,paramMap);
							
							LogUtil.logInfo("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, message , "retdata:"+retdata+"分解参数值为:"+successstatus+failurestatus);
						}catch(Exception e){
							LogUtil.logError("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, message , "retdata1:"+retdata+"分解参数值为:"+successstatus+failurestatus);
							e.printStackTrace();
						}
					}
					else{
						if("4".equals(type)|| "6".equals(type)){
							sjwd = wcode;
							com_code = fcode;
						}
						else{
							sjwd = wcode;
							com_code = wcode;
						}
					if (isCorrectTime()) {
						JSONObject wdInfoComm =  CmpIntf.queryWdInfoComm(wdcode);//普通预付款
						JSONObject accountInfo = wdInfoComm.getJSONObject("accountInfo");
						String curr_amount = accountInfo.getString("curr_amount"); //预付款余额
						Double  commcurr_amount =(double)Math.round(Double.parseDouble(curr_amount)*100)/100;
						
						JSONObject wdInfoIndustry = CmpIntf.queryWdInfoIndustry(wdcode);//实业付付款
						JSONObject s_accountInfo = wdInfoIndustry.getJSONObject("accountInfo");
						String s_curr_amount = s_accountInfo.getString("curr_amount"); //实业付付款
						Double  industrycurr_amount = (double)Math.round(Double.parseDouble(s_curr_amount)*100)/100;
						
						JSONObject wdInfoCod = CmpIntf.queryWdInfoCod(wdcode);//代收货款 COD
						JSONObject c_accountInfo = wdInfoCod.getJSONObject("accountInfo");
						String c_curr_amount = c_accountInfo.getString("curr_amount"); //COD付付款
						Double  codcurr_amount = (double)Math.round(Double.parseDouble(c_curr_amount)*100)/100;
						StringBuffer msg = new StringBuffer("网点新增及修改流程:");
						msg.append(processinstid);
						msg.append("，网点编码：");
						msg.append(wdcode);
						msg.append(BusinessDictUtil.getDictName("YD_YW_GENGHUAN", genghuantype));
						LogUtil.logInfo("YD_COMM", "[定时审批]流程：{0}，网点：{1}，普通预付款余额：[{2}],实业预付款余额:[{3}],COD预付款余额:[{4}],余额不足，不审批；", null, 
								processinstid,wdcode,commcurr_amount,industrycurr_amount,codcurr_amount);
						
//						System.out.println("普通预付款余额》》》》》"+commcurr_amount);
//						System.out.println("实业预付款余额》》》》》"+industrycurr_amount);
//						System.out.println("COD预付款余额》》》》》"+codcurr_amount);
						
						if (commcurr_amount < 0 || industrycurr_amount < 0 || codcurr_amount < 0) {
							msg.append("，由于金额不足失败！");
							try {
								RTXUtils.sendNotiy(BusinessDictUtil.getDictName("YD_YW_WDTONGZHI", "cz_bqq"), msg.toString(), "网点新增及修改流程提醒", 0);
							} catch (Exception e) {
								e.printStackTrace();
							}
							WechatIntf.sendQYWechatMSG(BusinessDictUtil.getDictName("YD_YW_WDTONGZHI", "cz_empid")+"|"+useid, "", "@all", msg.toString());
							continue;//不审批
						}else{
							message = new StringBuffer();
							message.append(retkey);
							message.append("?com_code="+com_code);
							message.append("&sjwd="+sjwd);
							message.append("&create_user="+create_user);
							message.append("&type="+type);
							message.append("&pro_num="+processinstid);
							if (commcurr_amount > 0 || industrycurr_amount > 0 || codcurr_amount > 0) {
								// BQQ及微信告
								try {
									retdata = HttpClientExt.callHttpWithGet(message.toString());
									objects =  JSONObject.parseObject(retdata);
									successstatus = objects.getString("xSuccess");
									failurestatus = objects.getString("xMessage");
									LogUtil.logInfo("YD_INTF", "新增时打印传递的参数----:{0},返回信息状态：{1}", null, message , successstatus+failurestatus);
									if("true".equals(successstatus)){
										
									}
									else{
										msg.append("，"+failurestatus);
										RTXUtils.sendNotiy(BusinessDictUtil.getDictName("YD_YW_WDTONGZHI", "tx_bqq"), msg.toString(), "网点新增及修改流程提醒", 0);
										WechatIntf.sendQYWechatMSG(BusinessDictUtil.getDictName("YD_YW_WDTONGZHI", "tx_empid"), "", "@all", msg.toString());
										continue;//不审批
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
							else if(commcurr_amount == 0 && industrycurr_amount == 0 && codcurr_amount == 0){
								try{
									retdata = HttpClientExt.callHttpWithGet(message.toString());
									objects =  JSONObject.parseObject(retdata);
									successstatus = objects.getString("xSuccess");
									failurestatus = objects.getString("xMessage");
									LogUtil.logInfo("YD_INTF", "三种情况余额为0的情况----:{0},返回信息状态：{1}", null, message , successstatus+failurestatus);
								}
								catch(Exception e){
									e.printStackTrace();
								}
							}
							
						}
						
					}else {
						continue;//不审批
					  }
					}
				}
				// 审批
				approvalProcess(processinstid);

			}
		}
		
	}
	
	@Bizlet
	public void flgCreateWDCondition(long processinstid,String chuangkouweihu,String xkscktype,String bianma,String aaaa,String applicationer){
		try{
			if("C".equals(chuangkouweihu)){
				//当窗口类型为新增的时候，调用接口但不做任何操作
				if("1".equals(xkscktype)){//新开分部
					type = "1";
					com_code = aaaa;//网点的编码保存在aaaa字段中
					sjwd = bianma;
				}
				else if("2".equals(xkscktype)){//新开服务部
					type = "3";
					com_code = aaaa;//网点的编码保存在aaaa字段中
					sjwd = bianma;
				}
				else{//新开网点
					type = "2";
					com_code = bianma;//网点的编码保存在bianma字段中
					sjwd = bianma;
					 
				}
			}
			message = new StringBuffer();
			message.append(retkey);
			message.append("?com_code="+com_code);
			message.append("&sjwd="+sjwd);
			message.append("&create_user="+applicationer);
			message.append("&type="+type);
			message.append("&pro_num="+processinstid);
			retdata = HttpClientExt.callHttpWithGet(message.toString());
			objects =  JSONObject.parseObject(retdata);
			successstatus = objects.getString("xSuccess");
			failurestatus = objects.getString("xMessage");
			LogUtil.logInfo("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, message , "retdata:"+retdata+"分解参数值为:"+successstatus+failurestatus);
			}
			catch(Exception e){
				LogUtil.logError("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, message , "retdata1:"+retdata+"分解参数值为:"+successstatus+failurestatus);
				e.printStackTrace();
			}		
	}
	private static boolean isCorrectTime(){
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int min =  c.get(Calendar.MINUTE);
		int begin_hour = Integer.valueOf(BusinessDictUtil.getDictName("YD_YW_WDTONGZHI", "begin_hour"));
		int begin_min =  Integer.valueOf(BusinessDictUtil.getDictName("YD_YW_WDTONGZHI", "begin_min"));
		int end_hour = Integer.valueOf(BusinessDictUtil.getDictName("YD_YW_WDTONGZHI", "end_hour"));
		if ((hour >= begin_hour && min>=begin_min) && hour<=end_hour  ) {
			return true;
		}
		return false;
	}
	
	/**
	 * 审批流程
	 * @param processInstID
	 * @return
	 */
	public static boolean approvalProcess(long processInstID){
		Object[] result = null;
		try {
			ILogicComponent logicComponent = LogicComponentFactory.create(componentName);
			// 逻辑流的输入参数
			Object[] params = new Object[3];
			DataObject approver = DataObjectUtil.createDataObject("com.eos.workflow.data.WFParticipant");
			approver.setString("id", "sysadmin");
			approver.setString("name", "管理员");
			params[0] = approver;
			params[1] = processInstID;
			params[2] = "满足条件，自动审批通过！";
			result = logicComponent.invoke(operationName, params);
			if (null != result && result.length>0) {
				String retCode = (String) result[0];
				if ("1".equals(retCode)) {
					return true;
				}
			} 
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return false;
	}
	
	 
	public static void main(String[] args){
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int min =  c.get(Calendar.MINUTE);
		System.out.println(isCorrectTime());
		
		approvalProcess(60518);
	}
	
}
