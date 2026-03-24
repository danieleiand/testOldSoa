package com.yd.soa.bpsyewumgr.yufukuankaitong;


import com.alibaba.fastjson.JSONObject;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

@Bizlet("")
public class ParseJson2DataObject {
	
	@Bizlet("json数据转为dataobject")
	public static DataObject parseJson2DataObject(String postValue){
		JSONObject jo = JSONObject.parseObject(postValue) ;
		DataObject data = DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.yufukuankaitong.yufukuankaitong.YdYwWdlinshiktfj") ;
		data.set("wdcode", jo.getString("wcode")) ;							// 网点编码
		data.set("applyuserid", jo.getString("applyuserid")) ;					// 申请人用户编码
		data.set("handlerid", jo.getString("handlerid")) ;						// 经办人用户编码
		data.set("handlerphone", jo.getString("handlerphone")) ;				// 经办人手机
//		data.set("yfkbalance", jo.getString("yfkbalance")) ;					// 预付款余额
//		data.set("tishiedu", jo.getString("remindAmt")) ;						// 提示额度
//		data.set("xiandifajianedu", jo.getString("limitAmt")) ;					// 限定发件额度
		data.set("remark", jo.getString("remark")) ;							// 网点开通快件理由
		return data;
	}
}
