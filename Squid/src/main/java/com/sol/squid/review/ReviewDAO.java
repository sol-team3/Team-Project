package com.sol.squid.review;

import java.util.List;

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


	
}
