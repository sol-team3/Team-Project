package com.sol.squid.recruit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class recruitController {
	
	@RequestMapping(value = "/recruit.go", method = RequestMethod.GET)
	public String goRecritPage(HttpServletRequest req) {

		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		
		return "index";
	}
	
	
}
