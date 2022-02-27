package com.sol.squid.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.squid.TokenMaker;

// import com.sol.squid.SiteOption;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO bDAO;
		
	// 자유게시판으로 가기
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardGo(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		/*SiteOption.clearSearch(req);*/
		
		bDAO.getBoard(1, req);

		System.out.println("11111");
		
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}

	
	//페이지
	@RequestMapping(value = "board.page.change", method = RequestMethod.GET)
	public String boardPageChange(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		int p = Integer.parseInt(req.getParameter("p"));

		bDAO.getBoard(p, req);
		
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}	

	// 검색
	@RequestMapping(value = "/board.search", method = RequestMethod.GET)
	public String boardSearch(BoardSelector bSel, HttpServletRequest req) {
		
		TokenMaker.make(req);
	
	//	bDAO.searchBoardTitle(b, req);
		
		bDAO.searchBoard(bSel, req);
		bDAO.getBoard(1, req);
				
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}
	
	// boardDetail.jsp
	@RequestMapping(value = "/board.detail.go", method = RequestMethod.GET)
	public String boardDetail(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
			
		bDAO.getBoardDetail(b, req);
		
		//조회수
		bDAO.updateBoardViews(b, req);
		
		// 댓글
		bDAO.getBoardComment(req);
		
		req.setAttribute("contentPage", "board/boardDetail.jsp");
		
		return "index";
	}
	
	
	// 게시글 등록페이지 가기
	@RequestMapping(value = "/board.reg.go", method = RequestMethod.GET)
	public String boardRegGo(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		req.setAttribute("contentPage", "board/boardReg.jsp");
		
		return "index";
	}
	
	// 게시글 등록하기
	@RequestMapping(value = "/board.reg", method = RequestMethod.POST)
	public String boardReg(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);

		bDAO.regBoard(b, req);
	
		bDAO.getBoard(1, req);
		
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}
	
	// 게시글 수정 페이지로
	@RequestMapping(value = "/board.update.go", method = RequestMethod.GET)
	public String boardUpdateGo(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
						
		req.setAttribute("contentPage", "board/boardUpdate.jsp");
		
		return "index";
	}
	
	
	// 게시글 수정
	@RequestMapping(value = "/board.update", method = RequestMethod.POST)
	public String boardUpdate(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
				
		bDAO.updateBoard(b, req);

	//	int p = Integer.parseInt(req.getParameter("p"));
		
		bDAO.getBoard(1, req);
		
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/board.delete", method = RequestMethod.GET)
	public String boardDelete(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
				
		bDAO.deleteBoard(b, req);
		
		bDAO.getBoard(1, req);
			
		req.setAttribute("contentPage", "board/board.jsp");
			
		return "index";
	}
	
	// 댓글 쓰기
	@RequestMapping(value = "/board.comment.reg", method = RequestMethod.POST)
	public String boardCommentReg(BoardComment bc, Board b,HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		if (bc.getBc_content() != null && bc.getBc_content() != "") {
			bDAO.regBoardComment(bc, req);
		}
		
		bDAO.getBoardComment(req);
		
		bDAO.getBoardDetail(b, req);
								
		req.setAttribute("contentPage", "board/boardDetail.jsp");
		
		return "index";
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/board.comment.delete", method = RequestMethod.GET)
	public String boardCommentDelete(BoardComment bc, Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
				
		bDAO.deleteBoardComment(bc, req);
		
		bDAO.getBoardComment(req);
		
		bDAO.getBoardDetail(b, req);
		
			
		req.setAttribute("contentPage", "board/boardDetail.jsp");
		
		return "index";
	}
	
}
