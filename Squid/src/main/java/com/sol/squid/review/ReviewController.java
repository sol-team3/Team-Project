package com.sol.squid.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO rDAO;
	
	@RequestMapping(value = "/review.go", method = RequestMethod.GET)
	public String goReviewPage(HttpServletRequest req) {
		
		rDAO.getAllReview(req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/review.write", method = RequestMethod.GET)
	public String goReviewWritePage(HttpServletRequest req) {
		req.setAttribute("contentPage", "review/reviewWrite.jsp");
		return "index";
	}

	@RequestMapping(value = "/review.search", method = RequestMethod.GET)
	public String searchReview(HttpServletRequest req) {
		
		rDAO.getReview(req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}

	@RequestMapping(value = "/reivew.reg", method = RequestMethod.POST)
	public String regReview(HttpServletRequest req, Review review) {
		
		System.out.println(req.getParameter("num"));
		
		rDAO.regReview(req, review);
		rDAO.getAllReview(req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}
	
}
