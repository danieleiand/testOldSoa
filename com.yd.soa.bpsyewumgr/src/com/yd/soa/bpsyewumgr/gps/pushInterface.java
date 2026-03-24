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
 * Created on 2020-1-8
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.gps;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.eos.system.annotation.Bizlet;


import net.sf.json.JSONObject;

@Bizlet("推送接口")
public class pushInterface {
@Bizlet("application/json")
	public static  JSONObject pushJsonPost(String url,String jsons){
		 JSONObject jsonObject=null;
		 HttpClient client=null;
		 String res="";
		 try {
		 client=new DefaultHttpClient();
		 HttpPost post=new HttpPost(url);
		 StringEntity entity=new StringEntity(jsons,"utf-8");
		 entity.setContentEncoding("utf-8");
		 entity.setContentType("application/json");
		 post.setEntity(entity);
		 HttpResponse result=client.execute(post);
		/* if(result.getStatusLine().getStatusCode()==200){
			 res=EntityUtils.toString(result.getEntity());
		 }*/
		 res=EntityUtils.toString(result.getEntity());
		 jsonObject=JSONObject.fromObject(res);
	
		} catch (Exception e) {
			// TODO: handle exception
		}
		return jsonObject;
	}

	
}
