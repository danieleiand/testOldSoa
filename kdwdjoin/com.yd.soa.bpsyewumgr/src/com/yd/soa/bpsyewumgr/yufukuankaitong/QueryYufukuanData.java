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
 * Created on 2023-5-23
 *******************************************************************************/

package com.yd.soa.bpsyewumgr.yufukuankaitong;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import commonj.sdo.DataObject;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.log.LogUtil;

/**
 * TODO fill class info here
 *
 * @author shaw
 * @date 2023-05-23 15:24:47
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class QueryYufukuanData {
	
	@Bizlet("查询预付款账单接口")
	public String queryReceivableAnalysisByWcode(String url,String wcode,String sysSource){
		String flag = "N";
        try {
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("comCode",wcode);
            map.put("sysSource",sysSource);
            String result = postSXMsg(url,JSON.toJSON(map).toString());
            result = JSONObject.parseObject(result).getString("success");
            if(result.equals("true")){
            	flag = "Y";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
	}
	
	public static String postSXMsg(String msgUrl,String json) {
		LogUtil.logInfo("YD_INTF", "查询预付款账单入参_{0}:【{1}】",null,msgUrl,json);
		URL url = null;
		HttpURLConnection conn = null;
		BufferedWriter writer = null;
		BufferedReader br = null;
		OutputStream os = null;
		StringBuffer sb = new StringBuffer();
		try {
			url = new URL(msgUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);
			os = conn.getOutputStream();
			writer = new BufferedWriter(new OutputStreamWriter(conn
					.getOutputStream(), "UTF-8"));
			writer.write(json);
			writer.flush();
			writer.close();
			br = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "UTF-8"));
			String back = null;
			sb.setLength(0);
			while ((back = br.readLine()) != null) {
				sb.append(back);
			}
            LogUtil.logInfo("YD_INTF", "推送预付款账单返回参数_{0}:【{1}】",null,msgUrl,sb);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (os != null) {
				try {
					os.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return sb.toString();
	}

}
