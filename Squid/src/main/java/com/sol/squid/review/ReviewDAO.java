package com.sol.squid.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ReviewDAO {

	@Autowired
	private SqlSession ss;
	
	private List<Review> reviews;
	
	private List<Comment> comments;
	
	public void getAllReview(int pageNo, HttpServletRequest req) {
		
		req.setAttribute("curPageNo", pageNo);
		
		int count = 20; // 한페이지당 보여줄 갯수
		int total = ss.getMapper(ReviewMapper.class).getCountReview();
		int pageCnt = (int)Math.ceil((double)total/count); // 총 페이지 수
		int start = (pageNo - 1) * count + 1; // 데이터 시작 번호
		int end = start + (count - 1); // 데이터 끝 번호
	
		req.setAttribute("endPage", pageCnt);
		req.setAttribute("pageCnt", pageCnt);

		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start", start);
		m.put("end", end);
		
		// 게시물 뿌리는 기능 
		reviews = ss.getMapper(ReviewMapper.class).getAllReviews(m);
		
		req.setAttribute("reviews", reviews);
	}

	public void regReview(HttpServletRequest req, Review review) {

		String token = req.getParameter("token");
		String successToken = (String)req.getSession().getAttribute("successToken");
		
		System.out.println("토큰 : " + token);
		System.out.println("성공토근 : " +successToken);
		
		if(successToken != null && token.equals(successToken)) {
			return;
		}
		
		if (ss.getMapper(ReviewMapper.class).regReview(review) >= 1) {
			System.out.println("등록 성공!");
			req.getSession().setAttribute("successToken", token);
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

	public void plusView(Review review, HttpServletRequest req) {

		String token = req.getParameter("token");
		String successToken = (String)req.getSession().getAttribute("successToken");
		
		System.out.println("토큰 : " + token);
		System.out.println("성공토근 : " +successToken);
		
		if(successToken != null && token.equals(successToken)) {
			return;
		}
		
		if(ss.getMapper(ReviewMapper.class).plusView(review) >= 1) {
			System.out.println("조회수가 올라갔습니다");
			req.getSession().setAttribute("successToken", token);
		}else{
			System.out.println("조회수 올리기 실패");			
		};
		
	}

	public void getComment(HttpServletRequest req) {

		comments = ss.getMapper(ReviewMapper.class).getComment();
		
		req.setAttribute("comments", comments);
		
	}

	public void regComment(Comment comment, HttpServletRequest req) {

		String token = req.getParameter("token");
		String successToken = (String)req.getSession().getAttribute("successToken");
		
		System.out.println("토큰 : " + token);
		System.out.println("성공토근 : " +successToken);
		
		if(successToken != null && token.equals(successToken)) {
			return;
		}
		
		if(ss.getMapper(ReviewMapper.class).regComment(comment) >= 1) {
			System.out.println("댓글 등록 성공");
			req.getSession().setAttribute("successToken", token);
		}else{
			System.out.println("댓글 등록 실패");			
		};
		
	}

	public void delComment(Comment comment, HttpServletRequest req) {

		ss.getMapper(ReviewMapper.class).deleteComment(comment);
		
	}

	public void getReviews(Model model, HttpServletRequest req) {

		reviews = ss.getMapper(ReviewMapper.class).getReviews();
		
		model.addAttribute("reviews", reviews);
		
	}

}
