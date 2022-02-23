package com.sol.squid.board;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class TokenMaker {
	
	// 새로고침해도 글 재등록 안되게 해준다.
	public static void make(HttpServletRequest req) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss:SS");
		String token = sdf.format(d);
		req.setAttribute("token", token);
		
		System.out.println(token);
		
	}
	
	

}
