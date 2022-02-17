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
	
}
