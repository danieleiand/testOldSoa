package com.yd.soa.bpsyewumgr.wangdianmgr;


import com.alibaba.fastjson.JSONObject;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.PropertiesCacheUtil;
import com.yd.soa.comm.http.HttpClientExt;
import com.yd.soa.comm.log.LogUtil;
import commonj.sdo.DataObject;

@Bizlet("预付款相关接口")
public class YufukuanUtils {
	
	
	/**
	 * 
	 * @param wintype     窗口维护类型 1：更换名称，2：更换性质，3：更换上级，4：暂停，5：重新开通，6：新增，7：更换所属
	 * @param wxingzhi	  网点性质     1: 分部，2：服务部，3：网点
	 * @param wcode		  机构编码
	 */
	@Bizlet("推送数据至预付款")
	public static String pushData2xy(DataObject data){
		LogUtil.logInfo("YD_INTF", "[简化功能对接预付款系统] 推送数据至预付款 开始 ！", null,  "");
		String wintype = data.getString("chuangkouweihu") ;                // 窗口维护类型
		String wxingzhi = data.getString("chuangkoutype") ;				   // 窗口性质
		String preXingzhi = data.getString("prexingzhi");				   // 更换前窗口性质	
		String wcode = data.getString("bianma") ;						   // 网点编码
		String handlerid = data.getString("applyuserid") ;				   // 操作人员ID
		String sjwd = data.getString("upbianma") ;						   // 上级网点编码
		
		// 预付款接口类型
		String type = null ;  
		String url = PropertiesCacheUtil.getKey("intf.cmp.getchangestatus") ;
		
		// 新增
		if("6".equals(wintype)){
			if("1".equals(wxingzhi) || "2".equals(wxingzhi) || "3".equals(wxingzhi))
				type = wxingzhi ;
			if ("3".equals(type)) {
				sjwd = wcode ;
			}
		}
		
		// 变更性质 
		if("2".equals(wintype)){
			// 服务部变网点
			if("2".equals(preXingzhi)){
				if("3".equals(wxingzhi))
					type = "5" ;
				if("1".equals(wxingzhi))
					type = "9" ;
			}
			// 网点变服务部 或者 分部
			if("3".equals(preXingzhi) ){
				if("2".equals(wxingzhi)){
					type = "6" ;
				}
				if("1".equals(wxingzhi))
					type = "7" ;
			}
			// 分部变服务部 网点 8 10
			if("1".equals(preXingzhi)){
				if("2".equals(wxingzhi))
					type = "8" ;
				
				if("3".equals(wxingzhi))
					type = "10" ;
			}
		}
		
		// 变更上级
		if("3".equals(wintype)){
			if ("2".equals(wxingzhi)) 
				type = "4" ;
			
			if("1".equals(wxingzhi))
				type = "11" ;
		}
		
		if (type!= null && sjwd == null) {
			throw new RuntimeException("检测到上级编码为空，请维护后再进行推送");
		}
		
		url = new StringBuffer(url).append("?com_code=" + wcode).append("&type=" + type).append("&sjwd=" + sjwd).append("&create_user=" + handlerid)
			.append("&pro_num=").toString() ;
		String retdata = null ;
		String retCode = "0" ;
		
		try {
			if( type!= null){
				retdata = HttpClientExt.callHttpWithGet(url);
				JSONObject objects = JSONObject.parseObject(retdata);
				String successstatus = objects.getString("xSuccess");
				String returMsg = objects.getString("xMessage");
				LogUtil.logInfo("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, url , "retdata:"+retdata+"分解参数值为:"+successstatus+returMsg);
				
				if("OK".equals(returMsg)){
					retCode = "1" ;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return retCode ;
	}
	
	

	/**
	 * 
	 * @param wintype     窗口维护类型 1：更换名称，2：更换性质，3：更换上级，4：暂停，5：重新开通，6：新增，7：更换所属
	 * @param wxingzhi	  网点性质     1: 分部，2：服务部，3：网点
	 * @param wcode		  机构编码
	 */
	@Bizlet("手动推送数据至预付款")
	public static String manualPushData2xy(DataObject data){
		LogUtil.logInfo("YD_INTF", "[简化功能对接预付款系统] 推送数据至预付款 开始 ！", null,  "");
		String wcode = data.getString("bianma") ;						   // 网点编码
		String handlerid = data.getString("applyuserid") ;				   // 操作人员ID
		String sjwd = data.getString("upbianma") ;						   // 上级网点编码
		String type = data.getString("changeType");						   //变更类型
		String processinstid = data.getString("processinstid");				   //流程实例号
		
		// 预付款接口类型
		String url = PropertiesCacheUtil.getKey("intf.cmp.getchangestatus") ;
		
		url = new StringBuffer(url).append("?com_code=" + wcode).append("&type=" + type).append("&sjwd=" + sjwd).append("&create_user=" + handlerid)
			.append("&pro_num=").append(processinstid).toString() ;
		String retdata = null ;
		String retCode = "0" ;
		
		try {
			if( type!= null){
				retdata = HttpClientExt.callHttpWithGet(url);
//				JSONObject objects = JSONObject.parseObject(retdata);
//				String successstatus = objects.getString("xSuccess");
//				String returMsg = objects.getString("xMessage");
//				LogUtil.logInfo("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, url , "retdata:"+retdata+"分解参数值为:"+successstatus+returMsg);
				
				LogUtil.logInfo("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, url , "retdata:"+retdata);
				if(retdata.indexOf("OK")!=-1){
					retCode = "1" ;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return retCode ;
	}
	
	
	
	@Bizlet("网点新增及修改流程自动推送数据至预付款")
	public static String wangdianreliacePush(DataObject data){
		LogUtil.logInfo("YD_INTF", "[网点新增及修改流程对接预付款系统] 开始 ！", null,  "");
		String wintype = data.getString("chuangkouweihu") ;                // 窗口维护类型(新增、修改) （业务字典：YD_YW_CHUANGKOUWH）
		String wxingzhi = data.getString("chuangkoutype") ;				   // 窗口性质（网点、分部、服务部） （业务字典：YD_INTF_WD_WXINGZHI）
		String genghuantype=data.getString("genghuantype");                // 更换类型（业务字典: YD_YW_GENGHUAN）3.更换窗口性质  4.更换上级公司
		String wxingzhiOld=data.getString("wxingzhiOld");                  // 更换前窗口性质
		String wcode = data.getString("bianma") ;						   // 网点编码
		String handlerid = data.getString("applyuserid") ;				   // 申请人人员ID
		String sjwd = data.getString("upbianma") ;						   // 公司编码
		String processinstid = data.getString("processinstid");			   //流程实例号
		String type = null;                                                //预付款变更类型
		String retdata = null ;
		String retCode = "0" ;
		// 预付款接口类型
		String url = PropertiesCacheUtil.getKey("intf.cmp.getchangestatus") ;
		
		//新增 
		if(wintype.equals("C")){ //新增网点
			if(wxingzhi.equals("3")){
				wcode=sjwd;
				type="3";
			}
			if(wxingzhi.equals("2")){ // 新增服务部
				type="2";
			}
		}
		// 修改	
		if(wintype.equals("M")){
			
			 if(wxingzhi.equals("3")){  //变网点
					if(genghuantype.equals("3")){   //更换窗口性质
						if(wxingzhiOld.equals("2")){ //服务部变网点
							type="5";
							wcode=sjwd;
						}
						if(wxingzhiOld.equals("1")){ //分部变网点
							type="10";
							wcode=sjwd;
						}
					}
				}
			
			if(wxingzhi.equals("2")){  //变服务部
				if(genghuantype.equals("3")){   //更换窗口性质
					if(wxingzhiOld.equals("3")){ // 网点变服务部
						type="6";
					}
					if(wxingzhiOld.equals("1")){ // 分部变服务部
						type="8";
					}
				}
				if(genghuantype.equals("4")){ // 服务部更换上级公司
					type="4";
				}
			}
			
		}
		
		
		
		url = new StringBuffer(url).append("?com_code=" + wcode).append("&type=" + type).append("&sjwd=" + sjwd).append("&create_user=" + handlerid)
			.append("&pro_num=").append(processinstid).toString() ;
	
		
		try {
			if( type!= null){   
				retdata = HttpClientExt.callHttpWithGet(url);
//				JSONObject objects = JSONObject.parseObject(retdata);
//				String successstatus = objects.getString("xSuccess");
//				String returMsg = objects.getString("xMessage");
//				LogUtil.logInfo("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, url , "retdata:"+retdata+"分解参数值为:"+successstatus+returMsg);
				
				LogUtil.logInfo("YD_INTF", "新增时打印传递的参数:{0},返回信息状态：{1}", null, url , "retdata:"+retdata);
				if(retdata.indexOf("OK")!=-1){
					retCode = "1" ;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return retCode ;
	}
	
	
	
	
	
	
	

}
