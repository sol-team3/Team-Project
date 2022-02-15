package com.sol.squid.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

	@Autowired
	private UserDAO uDAO;
	
	@RequestMapping(value = "/join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "user/join.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/join.IndividualMember.go", method = RequestMethod.GET)
	public String joinIndividualMemberGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "user/joinIndividualMember.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/join.corporateMember.go", method = RequestMethod.GET)
	public String joinCorporateMeberGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "user/joinCorporateMember.jsp");
		return "index";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
