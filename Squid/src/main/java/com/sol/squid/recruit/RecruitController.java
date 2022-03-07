package com.sol.squid.recruit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.squid.TokenMaker;

@Controller
public class RecruitController {
	
	@Autowired
	private RecruitDAO rDAO;
	
	@RequestMapping(value = "/recruit.go", method = RequestMethod.GET)
	public String goRecritPage(HttpServletRequest req) {

		rDAO.getAllRecruit(req);
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/recruit.detail", method = RequestMethod.GET)
	public String goRecritDeatailPage(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		req.setAttribute("contentPage", "recruit/recruitDetail.jsp");
		
		return "index";
	}
	
	
}
