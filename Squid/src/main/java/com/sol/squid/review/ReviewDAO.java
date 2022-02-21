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
	
	private List<Review> reviews;
	
	public void getAllReview(int pageNo, HttpServletRequest req) {
				
		// 게시물 뿌리는 기능 
		reviews = ss.getMapper(ReviewMapper.class).getAllReviews();
		
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

		Map<String, String> mr = new HashMap<String, String>();		
		mr.put("what", what);
		mr.put("search", search);
		
		List<Review> reviews = ss.getMapper(ReviewMapper.class).searchReview(mr);
		
		req.setAttribute("reviews", reviews);
	}

	public void getReview(Review r, HttpServletRequest req) {

		Review review = ss.getMapper(ReviewMapper.class).getReview(r);
		
		req.setAttribute("r", review);
		
	}

	public void deleteReview(Review review ,HttpServletRequest req) {

		if(ss.getMapper(ReviewMapper.class).deleteReview(review) >= 1) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");			
		}; 
		
	}

	public void updateReview(HttpServletRequest req, Review review) {
		
		System.out.println(review.getRv_no());
		System.out.println(review.getRv_title());
		System.out.println(review.getRv_rest_name());
		System.out.println(review.getRv_content());
		
		if(ss.getMapper(ReviewMapper.class).updateReview(review) >= 1) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");			
		}; 
		
	}

}
