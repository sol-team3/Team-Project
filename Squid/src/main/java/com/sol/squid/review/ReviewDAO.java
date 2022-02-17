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
	
}
