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
 * Created on 2013-11-12
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.fenbobangding;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;



import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

public class FlashUploadFile {

	
	
	
	@Bizlet("")
	public static List readExcelWDGLB(String fileName , String user) {
		File file = new File(fileName);
		List list = new ArrayList<String[]>();
		List falsewangdian = new ArrayList<String>();
		try {
			// 创建文件流
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			POIFSFileSystem fs = new POIFSFileSystem(bis);// poi接口file流

			// 创建工作薄对象wb
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			// 单元格对象
			HSSFCell cell = null;
			// 获取工作表中的工作表(sheet)个数
			int sheetIndex = wb.getNumberOfSheets();
			String[] values = null;

			// 遍历工作表
			for (int i = 0; i < sheetIndex; i++) {
				HSSFSheet st = wb.getSheetAt(i);// 创建工作表对象
				// 判断工作表是否还有,没有的话结束循环
				if (st == null) {
					continue;
				}
				// 获取工作表的行数
				int rowIndex = st.getLastRowNum();
				for (int j = 0; j <= rowIndex; j++) {
					HSSFRow row = st.getRow(j);
					// 判断是否是最后一行,如果是的话则结束循环
					if (row == null) {
						continue;
					}
					// 获取单元格个数
					int tempRowSize = row.getLastCellNum();
				//	System.out.println(tempRowSize);
					values = new String[tempRowSize];
					for (int k = 0; k < values.length; k++) {
						String value = "";
						cell = row.getCell(k);
						if (cell == null) {
							continue;
						}
						// 判断单元格的类型,针对不同的类型做不同的转化
						switch (cell.getCellType()) {
						case HSSFCell.CELL_TYPE_STRING:
							value = cell.getStringCellValue();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC:
							if (HSSFDateUtil.isCellDateFormatted(cell)) {
								Date date = cell.getDateCellValue();
								if (date != null) {
									value = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
											.format(date);
								} else {
									value = "";
								}
							} else {
								String temp = cell.getNumericCellValue()+"";
								 Double point = Double.valueOf(0.0D);
								String [] strs = temp.split("\\.");
								if(strs.length>1)point= Double.parseDouble(strs[1].toString());
								if((strs.length>1) && point>0){
									value = new DecimalFormat("0.00").format(cell
											.getNumericCellValue());
								}else{
									value = new DecimalFormat("0").format(cell
											.getNumericCellValue());
								}
							}
							break;
						case HSSFCell.CELL_TYPE_FORMULA:
							if (!cell.getStringCellValue().equals("")) {
								value = cell.getStringCellValue();
							} else {
								value = cell.getNumericCellValue() + "";
							}
							break;
						case HSSFCell.CELL_TYPE_BLANK:
							break;
						case HSSFCell.CELL_TYPE_ERROR:
							value = "";
							break;
						case HSSFCell.CELL_TYPE_BOOLEAN:
							value = (cell.getBooleanCellValue() == true ? "Y"
									: "N");
							break;
						default:
							value = "";
						}
						values[k] = value;// 设置单元格的内容
					//	System.out.println("字符串拼接结果。。。。。。"+values[k]);
					}
					
					
					
					list.add(values);// 将每一行单元格的内容添加到列表中
				}
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(list.size()>3000){
			falsewangdian.add("false");
			return falsewangdian;
		}
		
		
		//分拨绑定实体
		DataObject fenbobangding = DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.fenbobangding.fenbobangding.YdYwFenbobangding");
		//省份信息实体
		DataObject provinceinfofenbo = DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.fenbobangding.fenbobangding.QueryProvinceInfo");
		DataObject provinceinfobangding = DataObjectUtil.createDataObject("com.yd.soa.bpsyewumgr.fenbobangding.fenbobangding.QueryProvinceInfo");
		for (int i = 2; i < list.size(); i++) {
			String[] a = (String[])list.get(i);
			provinceinfofenbo.setString("bianma", a[0]);
			provinceinfobangding.setString("bianma", a[1]);
			DataObject[] provinceinfosfb=DatabaseUtil.queryEntitiesByTemplate("default", provinceinfofenbo);
			DataObject[] provinceinfosbd=DatabaseUtil.queryEntitiesByTemplate("default", provinceinfobangding);
			if(provinceinfosfb.length == 0){
				falsewangdian.add(a[0]);
				continue;
				
			}else{
				
				fenbobangding.setString("fenbodiancode", a[0]);//分拨点
				fenbobangding.setString("fenbodianname", provinceinfosfb[0].getString("gsname"));//分拨点名称
				fenbobangding.setString("fenbosheng", provinceinfosfb[0].getString("areaName"));//分拨所属省
				fenbobangding.setString("fenboshengcode", provinceinfosfb[0].getString("provinceid"));//分拨所属省编码
				
			}
			if(provinceinfosbd.length == 0){
				falsewangdian.add(a[1]);
				continue;
				
			}else{
				fenbobangding.set("id", com.yd.soa.comm.utils.Tools.getUUID());//主键
				fenbobangding.setString("bangdingdiancode", a[1]);//绑定点编码
				fenbobangding.setString("bangdingdianshengcode", provinceinfosfb[0].getString("provinceid"));//绑定点省编码
				fenbobangding.setString("bangdingdiansheng", provinceinfosfb[0].getString("areaName"));//绑定的所属省
				fenbobangding.setString("bangdingdian", provinceinfosfb[0].getString("gsname"));//绑定点名称
				fenbobangding.setString("applyuserid", user);//创建人
				fenbobangding.setString("delflag", "0");//删除标识
				fenbobangding.setDate("appdate", new java.util.Date());//创建日期
				fenbobangding.setString("operatorid", user);//修改人
				fenbobangding.setDate("operatordate", new java.util.Date());//修改日期
				if(a.length==3){
					fenbobangding.setString("beizhu", a[2]);//备注
				}
				
			}
			

				DatabaseUtil.insertEntity("default", fenbobangding);
			
			
		}
		
//	System.out.println(list);
		return falsewangdian;
	}
	
	
	
}
