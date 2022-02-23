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
	
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardGo(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		/*SiteOption.clearSearch(req);*/
		
		bDAO.getAllBoard(req);
		
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}

	// 검색
	@RequestMapping(value = "/board.search", method = RequestMethod.GET)
	public String boardSearch(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
					
		bDAO.searchBoardTitle(b, req);
		
				
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}
	
	// boardDetail.jsp
	@RequestMapping(value = "/board.detail.go", method = RequestMethod.GET)
	public String boardDetail(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
			
		bDAO.getBoard(b, req);
		
		//조회수
		bDAO.updateBoardViews(b, req);
		
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
	@RequestMapping(value = "/board.reg", method = RequestMethod.GET)
	public String boardReg(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);

		bDAO.regBoard(b, req);
		
		bDAO.getAllBoard(req);
				
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
	@RequestMapping(value = "/board.update", method = RequestMethod.GET)
	public String boardUpdate(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
				
		bDAO.updateBoard(b, req);
		
		bDAO.getAllBoard(req);
		
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/board.delete", method = RequestMethod.GET)
	public String boardDelete(Board b, HttpServletRequest req) {
		
		TokenMaker.make(req);
				
		bDAO.deleteBoard(b, req);
		
		bDAO.getAllBoard(req);
		
		req.setAttribute("contentPage", "board/board.jsp");
			
		return "index";
	}
	
	// 댓글 쓰기
	@RequestMapping(value = "/board.comment.reg", method = RequestMethod.GET)
	public String boardCommentReg(BoardComment bc, HttpServletRequest req) {
		
		TokenMaker.make(req);
				
		bDAO.regBoardComment(bc, req);
						
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/board.comment.delete", method = RequestMethod.GET)
	public String boardCommentDelete(BoardComment bc, HttpServletRequest req) {
		
		TokenMaker.make(req);
				
		bDAO.deleteBoardComment(bc, req);
				
		req.setAttribute("contentPage", "board/board.jsp");
		
		return "index";
	}
	

}
