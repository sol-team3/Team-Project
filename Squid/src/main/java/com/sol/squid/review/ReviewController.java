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

		rDAO.getAllReview(1, req);
		
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
		
		rDAO.searchReview(req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}

	@RequestMapping(value = "/review.reg", method = RequestMethod.POST)
	public String regReview(HttpServletRequest req, Review review) {
		
		System.out.println(req.getParameter("num"));
		
		rDAO.regReview(req, review);
		rDAO.getAllReview(1, req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}

	@RequestMapping(value = "/review.detail", method = RequestMethod.GET)
	public String reviewDetail(HttpServletRequest req, Review review) {
		
		rDAO.getReview(review, req);
		
		req.setAttribute("contentPage", "review/reviewDetail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/review.update.go", method = RequestMethod.GET)
	public String goUpdateReviewPage(HttpServletRequest req, Review review) {
		
		rDAO.getReview(review, req);
		
		req.setAttribute("contentPage", "review/updateReview.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/review.update", method = RequestMethod.POST)
	public String updateReview(HttpServletRequest req, Review review) {
		
		rDAO.updateReview(req, review);
		rDAO.getAllReview(1, req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/review.delete", method = RequestMethod.GET)
	public String deleteReview(HttpServletRequest req, Review review) {
		
		rDAO.deleteReview(review, req);
		rDAO.getAllReview(1, req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}
}
