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
 * Created on 2014-6-17
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.yufukuankaitong;



import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.PropertiesCacheUtil;
import com.yd.soa.comm.http.HttpClientExt;
import com.yd.soa.comm.utils.Tools;
import com.yd.soa.intf.cmp.CmpIntf;
import com.yd.soa.intf.dyn.DynIntf;

import commonj.sdo.DataObject;

@Bizlet("")
public class Wdlinshikaitong {

	
	public static String md5(String input) {// 加密并转换成16进制字符串
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };
		byte[] buf = input.getBytes();
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md5.update(buf);
		byte[] md = md5.digest();
		int length = md.length;
		char str[] = new char[length * 2];
		int k = 0;
		for (int i = 0; i < length; i++) {
			byte byte0 = md[i];
			str[k++] = hexDigits[byte0 >>> 4 & 0xf];
			str[k++] = hexDigits[byte0 & 0xf];
		}
		return new String(str);
	}
	
	@Bizlet("")
	public static String queryWdInfoZong(String wdcode,String bizyType){
		Map<String,String> paramMap = new HashMap<String, String>(2);
		paramMap.put("com_code", wdcode);		//公司编码
		paramMap.put("bizy_type", bizyType);		
		JSONObject retJson = null;
		String cmpurl = null;
		String xSuccess = null;
		String result = "0";
		//String switchFlag = PropertiesCacheUtil.getKey("intf.dyn.switch","false");//是否通过天网
		
		//UAT测试不经过天网
		String switchFlag = "false";//是否通过天网
		try {
			if ("true".equals(switchFlag)) {
				String retStr = DynIntf.exchangeDataViaDyn(PropertiesCacheUtil.getKey("intf.dyn.cmp.querywdinfozong"), paramMap);
				retJson = JSONObject.parseObject(retStr);
			}else {
				cmpurl =PropertiesCacheUtil.getKey("intf.cmp.querywdinfo.shouxianzong")+"?com_code="+wdcode+"&bizy_type="+bizyType;	//直连新预付款URL
				retJson = JSONObject.parseObject(HttpClientExt.callHttpWithGet(cmpurl));
				xSuccess=retJson.getString("xSuccess");
				if(xSuccess=="true"){
					
					result=retJson.getJSONObject("accountInfo").getString("sumamount");
					
				}
			}
		} catch (Exception e) {
			retJson = new JSONObject();
			retJson.put("xSuccess", "false");
			retJson.put("xMessage", "调用预付款系统异常！请联系体系管理组");
			retJson.put("com_code", wdcode);
			retJson.put("bizy_type", bizyType);
		}
		return result;
	}
	/**
	 * z最新获取网点发件状态
	 * @param wdcode
	 * @param bizyType
	 * @return
	 */
	@Bizlet("")
	public static String queryWdfjstatus(String wdcode,String bizyType){
		Map<String,String> paramMap = new HashMap<String, String>(2);
		paramMap.put("com_code", wdcode);		//公司编码
		paramMap.put("bizy_type", bizyType);		
		JSONObject retJson = null;
		String cmpurl = null;
		String xSuccess = null;
		String result = "0";
		//String switchFlag = PropertiesCacheUtil.getKey("intf.dyn.switch","false");//是否通过天网
		
		//UAT测试不经过天网
		String switchFlag = "false";//是否通过天网
		try {
			if ("true".equals(switchFlag)) {
				String retStr = DynIntf.exchangeDataViaDyn(PropertiesCacheUtil.getKey("intf.dyn.cmp.querywdinfozong"), paramMap);
				retJson = JSONObject.parseObject(retStr);
			}else {
				cmpurl =PropertiesCacheUtil.getKey("intf.cmp.querywdinfo.shouxianzong")+"?com_code="+wdcode+"&bizy_type="+bizyType;	//直连新预付款URL
				retJson = JSONObject.parseObject(HttpClientExt.callHttpWithGet(cmpurl));
				xSuccess=retJson.getString("xSuccess");
				if(xSuccess=="true"){
					
					result=retJson.getJSONObject("accountInfo").getString("sjgs");
					
				}
			}
		} catch (Exception e) {
			retJson = new JSONObject();
			retJson.put("xSuccess", "false");
			retJson.put("xMessage", "调用预付款系统异常！请联系体系管理组");
			retJson.put("com_code", wdcode);
			retJson.put("bizy_type", bizyType);
		}
		return result;
	}
	
	/**
	 * 预付款系统余额，警戒额接口
	 * @param wdcode 网点代码
	 * @return
	 */
	@Bizlet("获取预付款网点信息")
	public static String[] getYukukuanyue(String wdcode)
	{
		
		String[] result=new String[7];
		
		//接口返回的JSON串 [{"orgid":200002,"return_no":"1000","balance":"-19637.26","point_fee":"11738","limit_fee":"0","send_no":"1","last_update":"2014-05-27 10:39:28"}]
		String retdata = "";
		
		String return_no="";
		
		StringBuffer postData=new StringBuffer();
		
		
		if(!"".equals(wdcode)&&wdcode!=null)
		{
			
			//加密字符串
			String Encrypted_values = md5(wdcode + "YundaSoa");
			String jsondata ="[{\"orgid\":"+wdcode+",\"encrypted_values\":\""+Encrypted_values+"\"}]";
			
			try {
				if ("true".equals(PropertiesCacheUtil.getKey("intf.cmp.flag.switch","true"))) {//是否切换新预付款
					JSONObject retJson = CmpIntf.queryWdInfoComm(wdcode);
					String xSuccess = retJson.getString("xSuccess");
					if ("true".equals(xSuccess)) {
						JSONObject accountInfo = retJson.getJSONObject("accountInfo");
						result[0] = accountInfo.getString("com_code"); //网点代码
						result[1] = accountInfo.getString("curr_amount"); //账户余额
						result[2] = accountInfo.getString("warn_amount"); //警戒金额
						result[3] = accountInfo.getString("close_amount"); //限定发件额度
						result[4] = accountInfo.getString("sjgs"); //发件状态编码  ( 1:正常  3:欠费关闭)
						result[5] = accountInfo.getString("update_time"); //最后状态修改时间（发件状态）
						result[6] = retJson.getString("xMessage");
					}else {
						result[0] = wdcode; //网点代码
						result[6] = retJson.getString("xMessage");
					}
				}else {
					jsondata = URLEncoder.encode(jsondata, "UTF-8");
					postData.append("post_value="+jsondata);
					
					retdata =com.yd.soa.pw.intf.HttpClient.call(PropertiesCacheUtil.getKey("yd.wdlskt.get.yfkxt.url"), postData.toString(), "POST", com.yd.soa.pw.intf.HttpClient.CONTENT_TYPE_FORM);
					
					//返回的JSON字符串
					JSONArray array = JSONArray.parseArray(retdata);
					JSONObject object = array.getJSONObject(0);
					
					result[0] = object.getString("orgid"); //网点代码
					result[1] = object.getString("balance"); //预付款余额
					result[2] = object.getString("point_fee"); //提示额度
					
					result[3] = object.getString("limit_fee"); //限定发件额度
					result[4] = object.getString("send_no"); //发件状态编码  ( 正常使用: 1，预备关闭：2	，欠费关闭 3，暂停  0)
					result[5] = object.getString("last_update"); //最后状态修改时间（发件状态）
					
					//返回的各种状态 （1000 正常，1001加密错误，1002 公司不存在，1003 预付款账户不存在或者已经关闭，1004接受到的参数不符合规则）
					return_no= object.getString("return_no");
					
					result[6] = return_no;
					
					//LogUtil.logInfo("YD_INTF", "获取网点的预付款余额，警戒额等的返回的各种状态:{0},网点编码：{1}", null, return_no , wdcode);
					
				}
				
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		
		return result;
		
	}

	
	/**
	 * 开通欠费关闭的网点发件状态
	 * @param wdcode
	 * @param wdname
	 * @param processinstid
	 * @return
	 */
	@Bizlet("开通欠费关闭的网点发件状态")
	public static String kaitongFajianstatus(DataObject ydywwdlsktfj)
	{
		
		String wdcode=ydywwdlsktfj.getString("wdcode");
		String processinstid=ydywwdlsktfj.getString("processinstid");
		
		String result="false";
		
		String process_no="soa"+processinstid;
		
		
		//返回的各种状态 （1000 正常，1001加密错误，1002 公司不存在，1003 公司状态已经是打开的了不需要重复打开，
		//1004 公司已作废，1005 公司为预开通状态，1006接受到的参数不符合规则,1007修改公司表状态时出错，1008发送扣款的时候失败）
		
		if(!"".equals(wdcode)&&wdcode!=null)
		{
			
			//加密字符串
			
			List<NameValuePair> list = new ArrayList<NameValuePair>();
	        list.add(new BasicNameValuePair("process_no",process_no));//公司编码
	        list.add(new BasicNameValuePair("wdcode", wdcode));//申请额度
	     
			
			try {
				CloseableHttpClient client = HttpClients.createDefault();
				HttpPost httpPost = new HttpPost(PropertiesCacheUtil.getKey("yd.wdlskt.send.yfkxt.url"));
		        httpPost.setHeader("Content-type", "application/x-www-form-urlencoded");//必须使用application/x-www-form-urlencoded
				//retdata=com.yd.soa.pw.intf.HttpClient.call(PropertiesCacheUtil.getKey("yd.wdlskt.send.yfkxt.url"), postData.toString(), "POST", "application/x-www-form-urlencoded");
			
		        UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(list,"utf-8");
	            httpPost.setEntity(formEntity);
	            CloseableHttpResponse response = client.execute(httpPost);
	            HttpEntity entity = response.getEntity();
	            String json = EntityUtils.toString(entity, "UTF-8");
	            System.out.println(json);
	            JSONObject object = JSONObject.parseObject(json);
	            String return_no =  object.getString("xMessage");
		        
				
				

				
				
				DataObject ydywwdlinshiktfjtsrz=DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.yufukuankaitong.yufukuankaitong.YdYwWdlinshiktfjTsrz");
				
				DataObject ydywwdlinshiktfj=DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.yufukuankaitong.yufukuankaitong.YdYwWdlinshiktfj");
				
					String uuid=Tools.getUUID();
					ydywwdlinshiktfjtsrz.set("id", uuid);
					ydywwdlinshiktfjtsrz.set("processinstid", processinstid);
					ydywwdlinshiktfjtsrz.set("wdname", ydywwdlsktfj.getString("wdname"));
					ydywwdlinshiktfjtsrz.set("wdcode", wdcode);
					ydywwdlinshiktfjtsrz.set("yfkbalance", ydywwdlsktfj.getString("yfkbalance"));
					ydywwdlinshiktfjtsrz.set("xiandingnumber", ydywwdlsktfj.getString("xiandifajianedu"));
					ydywwdlinshiktfjtsrz.set("startdate", ydywwdlsktfj.getDate("appdate"));
					
					
					if(return_no.equals("Y"))
					{
						//开通成功
						result="true";
						ydywwdlinshiktfjtsrz.set("sendstats", "1");
					}else{
						ydywwdlinshiktfjtsrz.set("koukuancode", object.getString("xMessage"));
						ydywwdlinshiktfjtsrz.set("sendstats", "2");
						
						ydywwdlinshiktfj.set("id", ydywwdlsktfj.getString("id"));
						ydywwdlinshiktfj.set("fjktstats", return_no);
						
						
						DatabaseUtil.updateEntity("default", ydywwdlinshiktfj);
						
						}
					
					
					ydywwdlinshiktfjtsrz.set("remark", return_no);
					
					
					DatabaseUtil.insertEntity("default", ydywwdlinshiktfjtsrz);
					
				
			} catch (Exception e) {
				// TODO: handle exception
				
				e.printStackTrace();
			}
			
			
		}
		
		
		
		return result;
		
	}
	
	
	/**
	 * 
	 * @param wdcode
	 * @param processinstid
	 * @return
	 */
	public static String kaitongStatus(String wdcode,String processinstid)
	{
		
	    String result="false";
		
		String process_no="soa"+processinstid;
		
		//{"process_no":"soa20140611001","orgid":200002,"return_no":"1000"}
		String retdata = "";
		
		StringBuffer postData=new StringBuffer();
		
		
		//返回的各种状态 （1000 正常，1001加密错误，1002 公司不存在，1003 公司状态已经是打开的了不需要重复打开，
		//1004 公司已作废，1005 公司为预开通状态，1006接受到的参数不符合规则,1007修改公司表状态时出错，1008发送扣款的时候失败）
		String return_no="";
		
		if(!"".equals(wdcode)&&wdcode!=null)
		{
			
			//加密字符串
			String Encrypted_values = md5(wdcode + "YundaSoaOpen");
			String jsondata ="{\"process_no\":\""+process_no+"\",\"orgid\":"+wdcode+",\"encrypted_values\":\""+Encrypted_values+"\"}";
			
			System.out.println("jsondata:"+jsondata);
			
			postData.append("post_value="+jsondata);
			
			
			try {
				
				retdata=com.yd.soa.pw.intf.HttpClient.call(PropertiesCacheUtil.getKey("yd.wdlskt.send.yfkxt.url"), postData.toString(), "POST", com.yd.soa.pw.intf.HttpClient.CONTENT_TYPE_FORM);
			
				
				JSONObject object = JSONObject.parseObject(retdata);
				
				return_no=object.getString("return_no");

				
				System.out.println("return_no:"+return_no);
					
				
			} catch (Exception e) {
				// TODO: handle exception
				
				e.printStackTrace();
			}
			
			
		}
		
		
		
		return result;
		
	}
	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//kaitongStatus("201543", "41636");
		//String[] aaa=getYukukuanyue("100026");
		//System.out.println(aaa[1]);
		
		
		String  sss="1003";
		if(sss.equals("1000"))
		{
			
			System.out.println("111111111111");
		}
		if(sss.equals("1008"))
		{
			
			System.out.println("222222222");
		}
		if(!sss.equals("1000")&&!sss.equals("1008"))
		{
			System.out.println("333333333");
			
		}
	
		
	}

}
