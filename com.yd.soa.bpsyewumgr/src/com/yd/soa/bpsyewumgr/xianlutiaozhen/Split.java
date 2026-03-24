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
 * Created on 2013-1-21
 *******************************************************************************/


package com.yd.soa.bpsyewumgr.xianlutiaozhen;

import com.eos.system.annotation.Bizlet;

public class Split {     
    public static void main(String[] args)   
	    {   
      String abc[]=split("a,b,c",",");
     System.out.println(abc[1]);
       
       

  
   
	    } 
	@Bizlet("")
    public static String[] split(String role,String a)
    {
    	String role1 = role;
    	String c[]=role1.split(a);
    	return c;
    	
    }
    		
	}


