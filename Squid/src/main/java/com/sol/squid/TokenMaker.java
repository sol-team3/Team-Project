package com.sol.squid;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class TokenMaker {

	public static void make(HttpServletRequest req) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss:SS");	 // 시 분 초 SS?
		String token = sdf.format(d);
		req.setAttribute("token", token);
		
		System.out.println(token);
	}	
}