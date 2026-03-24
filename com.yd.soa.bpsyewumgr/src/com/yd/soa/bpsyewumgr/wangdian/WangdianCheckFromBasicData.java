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
 * Created on 2021-5-18
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.wangdian;


import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.log.LogUtil;

/**
 * TODO fill class info here
 *
 * @author shaw
 * @date 2021-05-18 09:20:46
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class WangdianCheckFromBasicData {

	@Bizlet("校验业务省")
	public static String checkYwProvince(String countyID,String belongCode,String url,String app){
		JSONObject json = null;
		String data = null;
		try{
			//封装推送报文	 		
			String Json = "{\n" +
	        "    \"countyID\":"+ countyID + ",\n" +
	        "    \"zzz\":"+ belongCode +"\n" +
	        " }\n";
			String result = getWangdianBasicData(url,Json,app);
			if(!result.isEmpty()){
				json = JSONObject.parseObject(result);
				data = json.getString("data");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	@Bizlet("获取地区城市")
	public static String[] getAreaCity(String cityID,String countyID,String belongCode,String url,String app){
		JSONObject json = null;
		JSONObject dataObj = null;
		String data[] = new String[2];
		try{
			//封装推送报文	 		
			String Json = "{\n" +
	        "    \"cityID\":"+ cityID + ",\n" +
	        "    \"countyID\":"+ countyID +",\n" +
	        "    \"zzz\":"+ belongCode +"\n" +
	        " }\n";
			String result = getWangdianBasicData(url,Json,app);
			if(!result.isEmpty()){
				json = JSONObject.parseObject(result);
				if(!json.isEmpty()){
					dataObj = json.getJSONObject("data");
					if(!dataObj.isEmpty() && dataObj != null){
						data[0] = dataObj.getString("regionName");
						data[1] = dataObj.getString("regionCode");						
					}				
				}								
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	
	public static String getWangdianBasicData(String url,String json,String app) {
		HttpPost httpPost = null;
        String result = null;
        System.out.println(url+"<><>"+json);
		//LogUtil.logInfo("YD_INTF", "推送考勤补签数据到韵达钉钉考勤系统push_postKaoQinToYdkqr入参_{0}:【{1}】",null,YdkqUrl,json);
        try {
            HttpClient client = new DefaultHttpClient();
            httpPost = new HttpPost(url);
            if (json != null) {
                StringEntity se = new StringEntity(json.toString(), "utf-8");
                httpPost.setEntity(se); // post方法中，加入json数据
                httpPost.setHeader("Content-Type", "application/json");
                httpPost.setHeader("app", app);
            }
            HttpResponse response = client.execute(httpPost);
            if (response != null) {
                HttpEntity resEntity = response.getEntity();
                if (resEntity != null) {
                    result = EntityUtils.toString(resEntity, "utf-8");
                    System.out.println(result);
                    //LogUtil.logInfo("YD_INTF", "推送考勤补签数据到韵达钉钉考勤系统push_postKaoQinToYdkqr返回参数_{0}:【{1}】",null,YdkqUrl,response);
                }
            }
        } catch (Exception ex) {
        	ex.printStackTrace();
        }
        return result;
	}
}
