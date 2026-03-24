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
 * Created on 2015-3-17
 *******************************************************************************/

package com.yd.soa.bpsyewumgr.wangdianreplace;

import com.eos.system.annotation.Bizlet;

import java.util.*;

/**
 * TODO fill class info here
 *
 * @author puzhifeng
 * @date 2015-03-17 09:59:54
 */
/*
 * Modify history
 * $Log$ 
 */
@Bizlet("")
public class NextDate {
	public static void main(String[] args) {

		System.out.println("aa" + nextDate());

	}

	@Bizlet("")
	public static Date nextDate() {

		Date date = new Date();
		Long l = date.getTime() + 1000 * 60 * 60 * 24;
		date.setTime(l);
		// System.out.println(date);     	
		return date;

	}
}
