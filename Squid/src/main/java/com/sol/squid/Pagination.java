package com.sol.squid;

public class Pagination {

	private int listSize = 10; // 총 보여질 데이터 개수 (10개 씩)
	private int rangeSize = 10; // 초기값으로 페이지범위를 10으로 셋팅
	private int curPage;		// 현재페이지
	private int range;		// 현재 페이지 범위
	private int listCnt;	// 총 게시물 개수
	private int pageCnt;	// 총 페이지 범위
	private int startPage;	// 시작 페이지
	private int startList;	// 페이지 별 시작 인덱스 번호
	private int endPage;	// 끝 페이지
	private boolean prev;	// 이전 페이지
	private boolean next;	// 다음 페이지

	public Pagination() {}
	
	public Pagination(int listSize, int rangeSize, int curPage, int range, int listCnt, int pageCnt, int startPage,
			int startList, int endPage, boolean prev, boolean next) {
		super();
		this.listSize = listSize;
		this.rangeSize = rangeSize;
		this.curPage = curPage;
		this.range = range;
		this.listCnt = listCnt;
		this.pageCnt = pageCnt;
		this.startPage = startPage;
		this.startList = startList;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int page) {
		this.curPage = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void pageInfo(int curPage, int range, int listCnt) {
		this.curPage = curPage;
		this.range = range;
		this.listCnt = listCnt;

		//전체 페이지수 
		this.pageCnt = (int) Math.ceil(listCnt/listSize);

		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;

		//끝 페이지
		this.endPage = range * rangeSize;

		//게시판 시작번호
		this.startList = (curPage - 1) * listSize;

		//이전 버튼 상태
		this.prev = range == 1 ? false : true;

		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}

