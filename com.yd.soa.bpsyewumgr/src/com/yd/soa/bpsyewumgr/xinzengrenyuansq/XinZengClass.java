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
 * Created on 2012-11-5
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.xinzengrenyuansq;

import com.eos.system.annotation.Bizlet;

public class XinZengClass {
	
	@Bizlet("")
	public static String getCaozuocount(String orgseq)
	{
		String orgseqTemp="";
		String []str=orgseq.split("\\.");
		if(str.length==4)
		{
			String strseq=str[3].substring(0, 7)+"40.";
			orgseqTemp=orgseq+strseq;
		}

		return orgseqTemp;
		
	}
	
	
}
