package com.sol.squid.review;

public class ReviewCriteria {

	private int pageNum; // 현재 페이지
	private int amount; // 한 페이지 당 보여질 게시물 갯수
	private int skip; // 스킵 할 게시물 수 (pageNum-1) * amount
	
	public ReviewCriteria() {
		this(1,10); // 파라미터가 없으면 1번 페이지에 게시물 10개를 출력함
		this.skip = 0;
	}

	public ReviewCriteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (this.pageNum-1)*amount;
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
}
