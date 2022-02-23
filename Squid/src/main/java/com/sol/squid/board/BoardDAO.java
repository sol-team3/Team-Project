package com.sol.squid.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAO {
	
	@Autowired
	private SqlSession ss;
	
	// 검색하기
	public void searchBoardTitle(Board b, HttpServletRequest req) {
		
		req.setAttribute("boa",
		ss.getMapper(BoardMapper.class).searchBoardTitle(b));
		
	}

	
	// 전체
	public void getAllBoard(HttpServletRequest req) {
		
		List<Board> boa = ss.getMapper(BoardMapper.class).showAllBoards();
		
		req.setAttribute("boa", boa);
	}
	
	// 글 하나
	public void getBoard(Board b, HttpServletRequest req) {
		
		Board bd = ss.getMapper(BoardMapper.class).detailBoard(b);
		
		req.setAttribute("bd1", bd);
		
	}
	
	// 게시글 쓰기
	public void regBoard(Board b, HttpServletRequest req) {

		String token = req.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");

/*		if (token.equals(successToken)) { 		
			return; 
		}
*/
		 		
		if (ss.getMapper(BoardMapper.class).regBoard(b) == 1) {
			
			req.setAttribute("result", " 글쓰기  성공");
			System.out.println(" 등록 성공");
			req.getSession().setAttribute("successToken", token);
			
		} else {
			req.setAttribute("result", "글쓰기  실패");
			System.out.println(" 등록 실패");

		}
	}
	
	// 게시글 수정
	public void updateBoard(Board b, HttpServletRequest req) {
			
			System.out.println(b.getB_content());
			System.out.println(b.getB_owner());
			System.out.println(b.getB_title());
		
		try {
			if (ss.getMapper(BoardMapper.class).updateBoard(b) == 1) {
				System.out.println("수정 성공");
				req.setAttribute("result", "수정 성공");
			} else {
				System.out.println("수정 실패");
				req.setAttribute("result", "수정 실패");
			}
		} catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "수정 실패");
		}

	}
	
	// 게시글 삭제
	public void deleteBoard(Board b, HttpServletRequest req) {
		
		try {
			if (ss.getMapper(BoardMapper.class).deleteBoard(b) == 1) {
				System.out.println("게시글 삭제 성공");
				req.setAttribute("result", "글 삭제 성공");
			} else {
				System.out.println("게시글 삭제 실패");
				req.setAttribute("result", "글 삭제 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시글 삭제 실패");
			req.setAttribute("result", "글 삭제 실패");
		}
	}

	// 댓글쓰기
	public void regBoardComment(BoardComment bc, HttpServletRequest req) {
		
		try {
			
			String token = req.getParameter("token");
			String successToken = (String) req.getSession().getAttribute("successToken");
			
			if (successToken != null && token.equals(successToken)) {
				return;
			}
			
			if (ss.getMapper(BoardMapper.class).regBoardComment(bc) == 1) {
				req.setAttribute("result", "댓글 쓰기 성공");
				req.getSession().setAttribute("successToken", token);
			} else {
				req.setAttribute("result", "댓글 쓰기 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "댓글 쓰기 실패");
		}
	}

	// 댓글 삭제
	public void deleteBoardComment(BoardComment bc, HttpServletRequest req) {

		try {
			if (ss.getMapper(BoardMapper.class).deleteBoardComment(bc) == 1) {
				req.setAttribute("result", "댓글 삭제 성공");
			} else {
				req.setAttribute("result", "댓글 삭제 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "댓글  삭제 실패");
		}
	}
	
	// 조회수
	public void updateBoardViews(Board b, HttpServletRequest req) {
		
		String token = req.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");
		
		if (ss.getMapper(BoardMapper.class).updateBoardViews(b) == 1 ) {
			System.out.println("조회수 성공");
			req.setAttribute("result", "조회수 성공");
			req.getSession().setAttribute("successToken", token);
		} else {
			System.out.println("조회수 실패");
			req.setAttribute("result", "조회수 실패");
		}
		
		
	}
	

	
}
