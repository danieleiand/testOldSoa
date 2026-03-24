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

package com.yd.soa.bpsyewumgr.wangdianreplace;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONArray;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import com.alibaba.fastjson.JSONObject;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.log.LogUtil;
import commonj.sdo.DataObject;

/**
 * TODO fill class info here
 *
 * @author shaw
 * @date 2020-08-11 16:49:34
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class PostWdGeKouToYdelf {

	@Bizlet("推送网点格口号到生命周期系统")
	public static Map wdGeKouToYdelf(String Json,String psUrl,String sign){
		
		HttpPost httpPost = new HttpPost(psUrl);
        String result = null;//接口返回
        JSONObject jsonrs = null;//
        String errorCode = null;//错误代码 0无异常，正确返回数据 1参数格式异常 2签名验证失败 3接口内部异常
        String msg = null;//提示信息
        Map<String, Object> resMap = new HashMap<String, Object>();//封装返回值
        //System.out.println(Json);
		LogUtil.logInfo("YD_INTF", "开始推送网点格口号到生命周期系统______接口地址:{0},签名：{1},请求参数JSON:{2}",null,psUrl,sign,Json);
        try {
        	httpPost.addHeader("sign", sign);//设置签名
            httpPost.addHeader("Content-Type", "application/json");
            StringEntity se = new StringEntity(Json, "utf-8");
            httpPost.setEntity(se);
            HttpResponse response = HttpClients.createDefault().execute(httpPost);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
            	result = EntityUtils.toString(response.getEntity(), "utf-8");                 
                //System.out.println("返回_________________________"+result);                   
            }
            if(!result.isEmpty()){
				jsonrs = JSONObject.parseObject(result);
				errorCode = jsonrs.getString("errorCode");
				msg = jsonrs.getString("msg");
				resMap.put("msg", msg);
				resMap.put("result", jsonrs);
				resMap.put("errorCode", errorCode);
			}
            LogUtil.logInfo("YD_INTF", "推送网点格口号到生命周期系统结束______接口地址:{0},返回报文：{1}",null,psUrl,jsonrs);
        } catch (Exception ex) {
        	ex.printStackTrace();
        	LogUtil.logError("YD_INTF", "推送网点格口号到生命周期系统异常______接口地址:{0},签名：{1},请求参数JSON:{2},返回报文{3}", ex, psUrl,sign,Json,jsonrs);
        }
        return resMap;
		
	}
	
	@Bizlet("封装网点推送生命周期系统数据推送报文")
	public static String getJson(DataObject[] datas,String processinstid,String operator){
		String json = "";
		String belongCode ="";//分拨编码
		String wdcode ="";//网点编码
		String[] wdcodes =null;//网点编码s
		String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if(datas.length>0){
			for(DataObject data:datas){
				Map<String, Object> map = new HashMap<String, Object>();
				belongCode = data.getString("belongCode");
				wdcode = data.getString("wdcode");
				wdcodes = wdcode.split(",");
				map.put("dbctCd", belongCode);
				map.put("brchCd", wdcodes);				
				list.add(map);
			}
		}
		if(list.size()>0){
			 json = JSONArray.fromObject(list).toString();
			 json = "{\n" +
             "    \"dbctGroup\":"+ json + ",\n" +
             "    \"passTime\": \""+ now +"\",\n" +
             "    \"operator\": \""+operator+"\",\n" +
             "    \"processNum\": \""+ processinstid +"\"\n" +
             "}";
		}
		return json;
	}
}
