package com.sol.squid.board;

import java.util.Date;

// 댓글 bean
public class BoardComment {
	private int bc_no;
	private String bc_b_no;
	private String bc_owner;
	private String bc_content;
	private Date bc_date;
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}

	public int getBc_no() {
		return bc_no;
	}

	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
	}

	public String getBc_b_no() {
		return bc_b_no;
	}

	public void setBc_b_no(String bc_b_no) {
		this.bc_b_no = bc_b_no;
	}

	public String getBc_owner() {
		return bc_owner;
	}

	public void setBc_owner(String bc_owner) {
		this.bc_owner = bc_owner;
	}

	public String getBc_content() {
		return bc_content;
	}

	public void setBc_content(String bc_content) {
		this.bc_content = bc_content;
	}

	public Date getBc_date() {
		return bc_date;
	}

	public void setBc_date(Date bc_date) {
		this.bc_date = bc_date;
	}

	public BoardComment(int bc_no, String bc_b_no, String bc_owner, String bc_content, Date bc_date) {
		super();
		this.bc_no = bc_no;
		this.bc_b_no = bc_b_no;
		this.bc_owner = bc_owner;
		this.bc_content = bc_content;
		this.bc_date = bc_date;
	}
	
	
}
