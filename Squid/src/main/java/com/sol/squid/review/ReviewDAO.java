package com.sol.squid.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewDAO {

	@Autowired
	private SqlSession ss;
	
	public void getAllReview(HttpServletRequest req) {
		List<Review> reviews = ss.getMapper(ReviewMapper.class).getAllReviews();
		
		req.setAttribute("reviews", reviews);
	}

	public void regReview(HttpServletRequest req, Review review) {

		System.out.println();
		
		if (ss.getMapper(ReviewMapper.class).regReview(review) >= 1) {
			System.out.println("등록 성공!");
		} else {
			System.out.println("등록 실패!");
		};
		
	}

	public void searchReview(HttpServletRequest req) {

		String what = (String) req.getParameter("what");
		String search = (String) req.getParameter("search");

		System.out.println(what);
		System.out.println(search);

//		if (what.equals("1")) {
//			what = "rv_u_id";
//		} else if (what.equals("2")) {
//			what = "rv_rest_name";
//		} else {
//			what = "rv_title";
//		}

		Map<String, String> mr = new HashMap<String, String>();		
		mr.put("what", what);
		mr.put("search", search);
		
		List<Review> reviews = ss.getMapper(ReviewMapper.class).searchReview(mr);
		
		req.setAttribute("reviews", reviews);
	}


	
}
