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
 * Created on 2015-1-23
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.remindayin;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.yd.soa.comm.log.LogUtil;
import com.yd.soa.comm.utils.Tools;
import com.yd.soa.intf.message.Base64Ext;
import com.yd.soa.intf.message.MD5Ext;
import commonj.sdo.DataObject;

/**
 * TODO fill class info here
 *
 * @author wulei
 * @date 2015-01-23 13:35:01
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class ThermalPrinter {
	
	@Bizlet("组装remindayinDetail数据")
	public static DataObject[] getRemindayinDetail(DataObject remindayinList){
		List<DataObject> lists = new ArrayList<DataObject>();
		
		int goumainum = Integer.parseInt(remindayinList.get("goumainum").toString());
		
		for(int i = 0; i < goumainum; i++){
			DataObject dataObj  = DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.remindayin.remindayindataset.YdYwRemindayinDetail");
			dataObj.set("id", Tools.getUUID());
			dataObj.set("bid", remindayinList.get("bid"));
			dataObj.set("xinghao", remindayinList.get("xinghao"));
			dataObj.set("price", remindayinList.get("price"));
			dataObj.set("danwei", remindayinList.get("danwei"));
			dataObj.set("goumainum", 1L);
			
			lists.add(dataObj);
		}
		
		return lists.toArray(new DataObject[]{});
	}
	@Deprecated
	@Bizlet("组装xml数据")
	public static String generateXml(DataObject remindayin,DataObject remindayinDetail){
		StringBuffer sb = new StringBuffer();
		sb.append("<orders><order>");
		
		//订单唯一序列号
		sb.append("<order_serial_no>" + remindayinDetail.getString("equipNo") + "</order_serial_no>");
		//大客户系统订单的订单号
		sb.append("<khddh>" + remindayinDetail.getString("equipNo") + "</khddh>"); 
		//发件人
		sb.append("<sender><name>" + remindayin.getString("sendName") + "</name><company>" +
				"韵达总部" + "</company><address>"+
				remindayin.getString("sendDetailAddress") + "</address><mobile>" + 
				remindayin.getString("sendPhone") + "</mobile></sender>");
		//收件人
		sb.append("<receiver><name>" + remindayin.getString("shouhuoren") +  "</name><company>" +
				remindayin.getString("wdname") + "</company><address>" +
				remindayin.getString("shouhuodizhi") + "</address><mobile>" +
				remindayin.getString("shouhuorenphone") + "</mobile></receiver>");
		//商品信息
		sb.append("<items><item><name>" + remindayinDetail.getString("xinghao") +
				"</name><number>" + remindayinDetail.getString("goumainum") +
				"</number></item></items>");
		//订单类型
		sb.append("<order_type>support_value</order_type>");
		sb.append("</order></orders>");
		
		
		return sb.toString();
	}
	
	/**
	 * 创建xml形式订单数据
	 * @param remindayin
	 * @param remindayinDetails
	 * @return
	 * songjie 2016-04-19
	 * @throws Exception 
	 */
	@Bizlet("创建xml形式订单数据")
	public static String createOrderXmlString(DataObject remindayin,DataObject[] remindayinDetails) throws Exception{
		if (remindayinDetails==null || remindayinDetails.length<1) {
			throw new Exception("无具体订单信息");
		}
		Document document = DocumentHelper.createDocument();
		Element orders = document.addElement("orders");
		//orders.addComment("订单基本信息");
		for (int i=0; i<remindayinDetails.length ;i++) {
			DataObject dtl = remindayinDetails[i];
			Element order = orders.addElement("order");
			order.addElement("order_serial_no").addText(dtl.getString("equipNo"));//订单唯一序列号
			order.addElement("khddh").addText(dtl.getString("equipNo"));		  //大客户系统订单的订单号
			order.addElement("order_type").addText("support_value");
			order.addElement("wave_no").addText(""+remindayin.getString("processinstid"));  //流程号 方便以后查询
			Element senderElement = order.addElement("sender");					  //发货方信息
				senderElement.addElement("name").addText(remindayin.getString("sendName"));
				senderElement.addElement("company").addText("韵达总部");
				senderElement.addElement("address").addText(remindayin.getString("sendDetailAddress"));
				senderElement.addElement("mobile").addText(remindayin.getString("sendPhone"));
		    Element receiverElement = order.addElement("receiver");					  //收货方信息
			    receiverElement.addElement("name").addText(remindayin.getString("shouhuoren"));
			    receiverElement.addElement("company").addText(remindayin.getString("wdname"));
			    receiverElement.addElement("address").addText(remindayin.getString("shouhuodizhi"));
			    receiverElement.addElement("mobile").addText(remindayin.getString("shouhuorenphone"));
			Element items = order.addElement("items");
			Element item = items.addElement("item");
				item.addElement("name").addText(dtl.getString("xinghao"));
				item.addElement("number").addText(dtl.getString("goumainum"));
		}
		return formatXML(document,"UTF-8");
	}
	
	/** 
     * 格式化XML文档 
     * 
     * @param document xml文档 
     * @param charset    字符串的编码 
     * @return 格式化后XML字符串 
     */ 
    public static String formatXML(Document document, String charset) { 
            OutputFormat format = OutputFormat.createPrettyPrint(); 
            format.setEncoding(charset); 
            StringWriter sw = new StringWriter(); 
            XMLWriter xw = new XMLWriter(sw, format); 
            try { 
                    xw.write(document); 
                    xw.flush(); 
                    xw.close(); 
            } catch (IOException e) { 
            	LogUtil.logInfo("YD_INTF", "格式化XML文档发生异常，请检查！", e);
            } 
            return sw.toString(); 
    }
	public static void main(String[] args) {
		String xmldata = "<orders><order><order_serial_no>123</order_serial_no><khddh>123</khddh>" +
				"<sender><name>王小虎</name><address>江苏省徐州市新沂市湖东路999号</address><mobile>13761960078</mobile></sender>" +
				"<receiver><name>陆大有</name><address>上海市青浦区盈港东路6655号</address><mobile>13761960075</mobile>" +
				"</receiver>+<order_type>support_value</order_type>+</order></orders>";
		String request = "data";
		String partnerid = "9991682001";
		String passwd = "PM5hdN2etzrsbCGcxwUE79iYuWkTjm";
		String version = "1.0";
		String address = "http://10.19.105.140:10110/cus_order/order_interface/interface_receive_order__mailno.php";
		String verify = "";
		StringBuffer sb = new StringBuffer();
		
		try {
			//1、xmdata进行BASE64编码
			xmldata = Base64Ext.encode(xmldata.getBytes("UTF-8"));
			
			//2、获取验证数据
			verify = MD5Ext.getMD5Str(xmldata+partnerid+passwd);
			
			//3、进行URL编码
			request = URLEncoder.encode(request, "UTF-8");
			partnerid = URLEncoder.encode(partnerid, "UTF-8");
			version = URLEncoder.encode(version, "UTF-8");
			xmldata = URLEncoder.encode(xmldata, "UTF-8");
			verify = URLEncoder.encode(verify, "UTF-8");
			
			sb.append("partnerid=").append(partnerid).append("&version=")
			.append(version).append("&request=").append(request)
			.append("&xmldata=").append(xmldata).append("&validation=")
			.append(verify);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		URL url;
		try {
			url = new URL(address);
			
			URLConnection connection = url.openConnection();
			connection.setDoOutput(true);
			
			OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(),"UTF-8");
			out.write(sb.toString());
			out.flush();
			out.close();
			
			InputStream in = connection.getInputStream();
			
			int count = 0, cl = 0;
			while (count == 0 && cl < 20) {
				count = in.available();
				cl++;
			}
			byte[] b = new byte[count];
			in.read(b);
			String input = new String(b, "UTF-8");
			
			System.out.println(input);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
