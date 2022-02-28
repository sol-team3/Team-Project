package com.sol.squid.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.squid.SiteOption;


@Service
public class BoardDAO {
	
	@Autowired
	private SqlSession ss;

 	@Autowired
	private SiteOption so;
		    
	public int allBoardCount;
	
	public int getAllBoardCount() {
		return allBoardCount;
	}

	public void setAllBoardCount(int allBoardCount) {
		this.allBoardCount = allBoardCount;
	}
	
	public void calcAllBoardCount() {
		BoardSelector bSel = new BoardSelector("", null, null);
		allBoardCount = ss.getMapper(BoardMapper.class).getBoardCount(bSel);
	}
	
	// 게시글 가져오기 , 페이징
	// 게시글 가져오는 기능
	public void getBoard(int pageNo, HttpServletRequest req) {
		
		int count = so.getBoardCountPerpage(); // 한 페이지당 몇 개 씩 보여줄껀지
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);
		
		// 검색어
		BoardSelector search = (BoardSelector) req.getSession().getAttribute("search");
		
		// 전체 게시글의 숫자
		int boardCount = 0;
		
		
		if (search == null) {
			// 검색어가 없는 경우
			search = new BoardSelector("", new BigDecimal(start), new BigDecimal(end));
			// 검색어가 없을 때는 전체 몇 개
			boardCount = allBoardCount;	
			
		} else {
			// 검색어가 있는 경우 // null이 아닌 경우
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			// 검색어가 있는 경우 게시글 몇 개 인지
			boardCount = ss.getMapper(BoardMapper.class).getBoardCount(search);
		}
		
		// List
		List<Board> boa = ss.getMapper(BoardMapper.class).getBoard(search);
		// 메세지들		
		
		// 전체 게시글의 숫자 => 필요한 거 숫자!
		int pageCount = (int) Math.ceil(boardCount / (double) count);
		
		req.setAttribute("pageCount", pageCount);
		
		req.setAttribute("boa", boa);
		
		req.setAttribute("curPage", pageNo);
		
	}
		
	// 검색하기
	public void searchBoard(BoardSelector bSel, HttpServletRequest req) {
		req.getSession().setAttribute("search", bSel);
		// 검색한 내용을 세션에 넣기
	}


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
	public void getBoardDetail(Board b, HttpServletRequest req) {
		
		Board bd = ss.getMapper(BoardMapper.class).detailBoard(b);
		
		req.setAttribute("bd1", bd);
		
	}
	
	// 게시글 쓰기
	public void regBoard(Board b, HttpServletRequest req) {

		String token = req.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");

		if(successToken != null && token.equals(successToken)) {
			return;
		}

		 		
		if (ss.getMapper(BoardMapper.class).regBoard(b) == 1) {
			
			req.setAttribute("result", " 글쓰기  성공");
			System.out.println(" 등록 성공");
			req.getSession().setAttribute("successToken", token);
			 
			allBoardCount++;
			
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
			req.setAttribute("result", "글 수정 실패");
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

	// 댓글 보기
	public void getBoardComment(HttpServletRequest req) {
		
		List<BoardComment> boardComments = ss.getMapper(BoardMapper.class).getBoardComments();
		
		req.setAttribute("boardComments", boardComments);
		
	}
	
	
	
	// 댓글쓰기
	public void regBoardComment(BoardComment bc, HttpServletRequest req) {
			
			String token = req.getParameter("token");
			String successToken = (String) req.getSession().getAttribute("successToken");
			
			if (successToken != null && token.equals(successToken)) {
				return;
			}
			
			if (ss.getMapper(BoardMapper.class).regBoardComment(bc) >= 1) {
				System.out.println("댓글 쓰기 성공");
				req.setAttribute("result", "댓글 쓰기 성공");
				req.getSession().setAttribute("successToken", token);
			} else {
				System.out.println("댓글 쓰기 실패");
				req.setAttribute("result", "댓글 쓰기 실패");
			}
		
	}

	// 댓글 삭제
	public void deleteBoardComment(BoardComment bc, HttpServletRequest req) {

		String token = req.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");
		
/*		if (successToken != null && token.equals(successToken)) {
			return;
		}*/

			if (ss.getMapper(BoardMapper.class).deleteBoardComment(bc) == 1) {
				System.out.println("댓글 삭제 성공");
				req.setAttribute("result", "댓글 삭제 성공");
			} else {
				req.setAttribute("result", "댓글 삭제 실패");
			}
	}
	
	// 조회수
	public void updateBoardViews(Board b, HttpServletRequest req) {
		
		String token = req.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");
		
		if(successToken != null && token.equals(successToken)) {
				return;
		}
		
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
