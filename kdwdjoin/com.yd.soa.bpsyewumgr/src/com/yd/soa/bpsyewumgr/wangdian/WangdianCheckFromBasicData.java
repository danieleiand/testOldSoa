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


import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONArray;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.log.LogUtil;
import commonj.sdo.DataObject;

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

	@Bizlet("查询业务省")
	public static DataObject[] queryYwProvince(String pageNo,String pageSize,String provinceID,String provinceIDB,String provinceNameB,String url,String app){

		List<DataObject> list = new ArrayList<DataObject>();
		try{
			//封装推送报文	 		
			String Json = "{\n" +
	        "    \"pageNo\":"+ pageNo + ",\n" +
	        "    \"pageSize\":"+ pageSize + ",\n" +
	        "    \"provinceID\":"+ provinceID + ",\n" +
	        "    \"provinceIDB\":"+ provinceIDB + ",\n" +
	        "    \"provinceNameB\":"+ provinceNameB +"\n" +
	        " }\n";
			String result = getWangdianBasicData(url,Json,app);
			if(!result.isEmpty() && "200".equals(JSONObject.parseObject(result).getString("code"))){
				JSONObject json = JSONObject.parseObject(result);
				JSONArray array = JSONArray.parseArray(json.getString("data"));
				for(Object obj : array){
					com.alibaba.fastjson.JSONObject temp = (com.alibaba.fastjson.JSONObject) obj;
					DataObject ywsDataobj  = DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.wangdian.wangdianbasicdata.ProvinceBusiness"); 
					ywsDataobj.set("provinceIDB",temp.getString("provinceIDB"));
					ywsDataobj.set("provinceNameB",temp.getString("provinceNameB"));
					ywsDataobj.set("provinceID",temp.getString("provinceID"));
					ywsDataobj.set("provinceName",temp.getString("provinceName"));
					ywsDataobj.set("shortName",temp.getString("shortName"));
					ywsDataobj.set("rgId",temp.getString("rgId"));
					ywsDataobj.set("rgName",temp.getString("rgName"));
					ywsDataobj.set("rgShortName",temp.getString("rgShortName"));
					ywsDataobj.set("provinceRankB",temp.getString("provinceRankB"));
					list.add(ywsDataobj);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list.toArray(new DataObject[] {});
	}
	
	@Bizlet("查询网格片区")
	public static DataObject[] queryWgpq(String pageNo,String pageSize,String provinceIdB,String url,String app){
		List<DataObject> list = new ArrayList<DataObject>();
		try{
			//封装推送报文	 		
			String Json = "{\n" +
	        "    \"pageNo\":"+ pageNo + ",\n" +
	        "    \"pageSize\":"+ pageSize + ",\n" +
	        "    \"provinceIdB\":"+ provinceIdB +"\n" +
	        " }\n";
			String result = getWangdianBasicData(url,Json,app);
			if(!result.isEmpty() && "200".equals(JSONObject.parseObject(result).getString("code"))){
				JSONObject json = JSONObject.parseObject(result);
				JSONArray array = JSONArray.parseArray(JSONObject.parseObject(json.getString("data")).getString("dataList"));
				for(Object obj : array){
					com.alibaba.fastjson.JSONObject temp = (com.alibaba.fastjson.JSONObject) obj;
					DataObject wgpqDataobj  = DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.wangdian.wangdianbasicdata.WbstDimension"); 
					wgpqDataobj.set("gridCode",temp.getString("gridCode"));
					wgpqDataobj.set("gridName",temp.getString("gridName"));
					wgpqDataobj.set("provinceIdB",temp.getString("provinceIdB"));
					list.add(wgpqDataobj);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list.toArray(new DataObject[] {});
	}
	
	@Bizlet("保存网格片区")
	public static String singleSaveWbstCp(DataObject wgpq,String url,String app){
		JSONObject json = null;
		String data = null;
		try{
			//封装推送报文	 		
			String Json = "{\n" +
	        "    \"cpCode\":\""+ wgpq.getString("cpCode") +"\",\n" +
	        "    \"cpName\":\""+ wgpq.getString("cpName") +"\",\n" +
	        "    \"cpWbstType\":\""+ wgpq.getInt("cpWbstType") +"\",\n" +
	        "    \"createTime\":\""+ wgpq.getString("createTime") +"\",\n" +
	        "    \"createUser\":\""+ wgpq.getString("createUser") +"\",\n" +
	        "    \"createUserName\":\""+ wgpq.getString("createUserName") +"\",\n" +
	        "    \"gridCode\":\""+ wgpq.getString("gridCode") +"\",\n" +
	        "    \"updateTime\":\""+ wgpq.getString("updateTime") +"\",\n" +
	        "    \"updateUser\":\""+ wgpq.getString("updateUser") +"\",\n" +
	        "    \"updateUserName\":\""+ wgpq.getString("updateUserName") +"\"\n" +
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
		LogUtil.logInfo("YD_INTF", "网点对接基础数据接口push_basicInfo入参_{0}:【{1}】",null,url,json);
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
                    LogUtil.logInfo("YD_INTF", "网点对接基础数据接口push_basicInfo返回参数_{0}:【{1}】",null,url,response);
                }
            }
        } catch (Exception ex) {
        	ex.printStackTrace();
        	LogUtil.logError("YD_INTF", "网点对接基础数据接口push_basicInfo返回异常参数_{0}:【{1}】",null,url,ex.getMessage());
        }
        return result;
	}
}
