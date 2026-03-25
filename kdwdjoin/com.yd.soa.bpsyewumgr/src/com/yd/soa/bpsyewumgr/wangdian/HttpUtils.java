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
 * Created on 2024-11-5
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.wangdian;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.params.HttpMethodParams;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.PropertiesCacheUtil;
import com.yd.soa.comm.log.LogUtil;

/**
 * TODO fill class info here
 *
 * @author shaw
 * @date 2024-11-05 13:31:16
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class HttpUtils {
	
	@Bizlet("基础数据接口")
	public static String postWithHeaderApp(String url,String json,String app) {
		LogUtil.logInfo("YD_INTF", "网点对接基础数据接口push_basicInfo入参_{0}:【{1}】",null,url,json);
		HttpClient client = new HttpClient();
		client.getHttpConnectionManager().getParams().setConnectionTimeout(Integer.parseInt(PropertiesCacheUtil.getKey("com.yd.soa.HTTPCONNECTIONTIMEOUT","10000")));  
		client.getHttpConnectionManager().getParams().setSoTimeout(Integer.parseInt(PropertiesCacheUtil.getKey("com.yd.soa.HTTPSOTIMEOUT","10000")));
		client.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
		PostMethod post = new PostMethod(url);
		post.setRequestHeader("Content-type", "application/json;charset=utf-8");
		post.setRequestHeader("app", app);
		int status = -1 ;
		String responseStr = "";
		try {
			post.setRequestBody(json);
			status = client.executeMethod(post);
			responseStr = post.getResponseBodyAsString();
            LogUtil.logInfo("YD_INTF", "网点对接基础数据接口push_basicInfo返回参数_{0}:【{1}】",null,url,responseStr);
		} catch (Exception e) {
			LogUtil.logError("YD_INTF", "网点对接基础数据接口push_basicInfo返回异常参数_{0}:【{1}】",null,url,e.getMessage());
		}finally{
			post.releaseConnection();
		}
        return responseStr;
	}
	
	@Bizlet("基础数据接口get")
	public static String callHttpWithGetApp(String url,String app) throws Exception{
		LogUtil.logInfo("YD_INTF", "网点对接基础数据接口push_basicInfo入参_{0}",null,url);
		HttpClient client = new HttpClient();
		client.getHttpConnectionManager().getParams().setConnectionTimeout(Integer.parseInt(PropertiesCacheUtil.getKey("com.yd.soa.HTTPCONNECTIONTIMEOUT","10000")));  
		client.getHttpConnectionManager().getParams().setSoTimeout(Integer.parseInt(PropertiesCacheUtil.getKey("com.yd.soa.HTTPSOTIMEOUT","10000")));
		client.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");  
		HttpMethod get = new GetMethod(url);
		get.setRequestHeader("app",app);
		int status = -1 ;
		String responseStr = "";
		try {
			status = client.executeMethod(get);
			responseStr = get.getResponseBodyAsString();
		} catch (Exception e) {
			LogUtil.logError("YD_INTF","[HTTP]连接不上server:"+url, e, new Object[0]);
		}finally{
			get.releaseConnection();
		}
		
		LogUtil.logInfo("YD_INTF","[HTTP]response code:"+status+",response string:" + responseStr, null,new Object[0] );
		
		return responseStr;
	}

}
