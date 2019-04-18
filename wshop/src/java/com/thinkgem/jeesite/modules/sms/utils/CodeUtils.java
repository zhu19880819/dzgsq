package com.thinkgem.jeesite.modules.sms.utils;

public class CodeUtils {

	public static String getCode(){
		String random=(int)((Math.random()*9+1)*100000)+""; 
        return random;
	}

	
}
