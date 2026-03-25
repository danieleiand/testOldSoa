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
 * Created on 2022-9-9
 *******************************************************************************/

package com.yd.soa.bpsyewumgr.wangdianreplace;

import org.apache.commons.httpclient.HttpStatus;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import com.alibaba.fastjson.JSONObject;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.log.LogUtil;

/**
 * TODO fill class info here
 *
 * @author shaw
 * @date 2022-09-14 16:45:11
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class WangdianReplacePush {
	
	
	@Bizlet("")
	public String pushZp(String wcode,String type,String status,String url){
		String json = "{\n" +
        "    \"branchCode\":\""+ wcode + "\",\n" +
        "    \"businessProp\": \""+ type +"\",\n" +
        "    \"status\": \""+ status +"\"\n" +
        "}";
		HttpPost httpPost = new HttpPost(url);
        String result = null;//接口返回
        JSONObject jsonrs = null;//
        String errorCode = null;
		LogUtil.logInfo("YD_INTF", "开始推送智跑通知接口______接口地址:{0},请求参数JSON:{1}",null,url,json);
        try {
            httpPost.addHeader("Content-Type", "application/json");
            StringEntity se = new StringEntity(json, "utf-8");
            httpPost.setEntity(se);
            HttpResponse response = HttpClients.createDefault().execute(httpPost);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
            	result = EntityUtils.toString(response.getEntity(), "utf-8");                                    
            }
            if(!result.isEmpty()){
				jsonrs = JSONObject.parseObject(result);
				errorCode = jsonrs.getString("success");
			}
            LogUtil.logInfo("YD_INTF", "推送智跑通知接口结束______接口地址:{0},返回报文：{1}",null,url,jsonrs);
        } catch (Exception ex) {
        	ex.printStackTrace();
        	LogUtil.logError("YD_INTF", "推送智跑通知接口异常______接口地址:{0},请求参数JSON:{1},返回报文{2}", ex, url,json,jsonrs);
        }
        return errorCode;
	}

}
