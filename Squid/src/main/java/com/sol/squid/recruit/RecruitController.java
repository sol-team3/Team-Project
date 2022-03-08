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

		
		TokenMaker.make(req);

		if(!req.getParameterNames().hasMoreElements()) {			
			rDAO.getAllRecruit(1,req);
		} else {
			int p = Integer.parseInt(req.getParameter("p"));
			rDAO.getAllRecruit(p,req);
		}
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/recruit.detail", method = RequestMethod.GET)
	public String goRecritDeatailPage(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		rDAO.getRecruit(req);
		
		req.setAttribute("contentPage", "recruit/recruitDetail.jsp");
		
		return "index";
	}

	@RequestMapping(value = "/recruit.search", method = RequestMethod.GET)
	public String searchRecritWritePage(HttpServletRequest req) {
		
		
		rDAO.getAllRecruit(1, req);
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "/recruit.write", method = RequestMethod.GET)
	public String goRecritWritePage(HttpServletRequest req) {
				
		TokenMaker.make(req);
		
		rDAO.getUserInfo(req);
		
		req.setAttribute("contentPage", "recruit/recruitWrite.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "/recruit.reg", method = RequestMethod.POST)
	public String regRecrit(Recruit recruit, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		rDAO.regRecruit(recruit, req);
		rDAO.getAllRecruit(1, req);
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		
		return "index";
	}
	

}
