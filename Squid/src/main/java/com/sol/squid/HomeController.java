package com.sol.squid;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "index.go", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/aboutus.go", method = RequestMethod.GET)
	public String aboutUs(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "about/aboutUs.jsp");
		return "index";
	}
	
}
