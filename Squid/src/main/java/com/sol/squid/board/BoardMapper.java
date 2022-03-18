package com.sol.squid.board;

import java.util.List;
import java.util.Map;

public interface BoardMapper {
	
	// 글쓰기
	int regBoard(Board b);
	
	// 수정
	int updateBoard(Board b);
	
	// 삭제
	int deleteBoard(Board b);
	
	// 댓글 쓰기
	int regBoardComment(BoardComment bc);

	// 댓글 삭제
	int deleteBoardComment(BoardComment bc);

	// 게시판 전체
	List<Board> showAllBoards();

	// 상세 
	Board detailBoard(Board b);

	// 조회수
	int updateBoardViews(Board b);

	// 검색
	List<Board> searchBoardTitle(Board b);

	List<BoardComment> getBoardComments();

	
	
	int getBoardCount(BoardSelector bSel);

	List<Board> getBoard(BoardSelector search1);
}
