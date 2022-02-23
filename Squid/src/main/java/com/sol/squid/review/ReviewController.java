package com.sol.squid.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.squid.TokenMaker;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO rDAO;
	
	@RequestMapping(value = "/review.go", method = RequestMethod.GET)
	public String goReviewPage(HttpServletRequest req) {

		TokenMaker.make(req);
		rDAO.getAllReview(1, req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/review.write", method = RequestMethod.GET)
	public String goReviewWritePage(HttpServletRequest req) {
		
		TokenMaker.make(req);
		req.setAttribute("contentPage", "review/reviewWrite.jsp");
		return "index";
	}

	@RequestMapping(value = "/review.search", method = RequestMethod.GET)
	public String searchReview(HttpServletRequest req) {
		
		TokenMaker.make(req);
		rDAO.searchReview(req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}

	@RequestMapping(value = "/review.reg", method = RequestMethod.POST)
	public String regReview(HttpServletRequest req, Review review) {
		
		TokenMaker.make(req);
		System.out.println(req.getParameter("num"));
		
		rDAO.regReview(req, review);
		rDAO.getAllReview(1, req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}

	@RequestMapping(value = "/review.detail", method = RequestMethod.GET)
	public String reviewDetail(HttpServletRequest req, Review review) {
		
		TokenMaker.make(req);
		
		rDAO.getComment(req);
		rDAO.plusView(review, req);
		rDAO.getReview(review, req);
		
		req.setAttribute("contentPage", "review/reviewDetail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/review.update.go", method = RequestMethod.GET)
	public String goUpdateReviewPage(HttpServletRequest req, Review review) {
		
		TokenMaker.make(req);
		rDAO.getReview(review, req);
		
		req.setAttribute("contentPage", "review/updateReview.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/review.update", method = RequestMethod.POST)
	public String updateReview(HttpServletRequest req, Review review) {
		
		TokenMaker.make(req);
		rDAO.updateReview(req, review);
		rDAO.getReview(review, req);
		
		req.setAttribute("contentPage", "review/reviewDetail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/review.delete", method = RequestMethod.GET)
	public String deleteReview(HttpServletRequest req, Review review) {
		
		TokenMaker.make(req);
		rDAO.deleteReview(review, req);
		rDAO.getAllReview(1, req);
		
		req.setAttribute("contentPage", "review/review.jsp");
		return "index";
	}

	@RequestMapping(value = "/review.commnet.reg", method = RequestMethod.POST)
	public String regReviewComment(HttpServletRequest req, Comment comment, Review review) {

		TokenMaker.make(req);
		
		if(comment.getRc_content() != null && comment.getRc_content() != "") {
			rDAO.regComment(comment, req);
		}
		
		rDAO.getComment(req);
		rDAO.getReview(review, req);
		
		req.setAttribute("contentPage", "review/reviewDetail.jsp");
		return "index";
	}

	@RequestMapping(value = "/review.comment.delete", method = RequestMethod.GET)
	public String deleteComment(HttpServletRequest req, Comment comment, Review review) {
		
		TokenMaker.make(req);
		rDAO.delComment(comment, req);
		
		rDAO.getComment(req);
		rDAO.getReview(review, req);
		
		req.setAttribute("contentPage", "review/reviewDetail.jsp");
		return "index";
	}
}




