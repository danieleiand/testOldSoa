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
 * Created on 2014-7-2
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.yufukuankaitong;


import com.eos.system.annotation.Bizlet;

/**
 * TODO fill class info here
 *
 * @author wulei
 * @date 2014-07-02 07:51:00
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("预付款开通字符串处理类")
public class StringUtil {
	/**
	 * 
	 * 根据orgseq查询其所在省companyid
	 * @param orgseq
	 * @return
	 */
	@Bizlet("根据orgseq查询其所在省companyid")
	public static String getCompanyId(String orgseq){
		String[] orgids = orgseq.split("\\.");
		return orgids[2];
	}

}
