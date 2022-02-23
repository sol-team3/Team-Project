package com.sol.squid.board;

import java.util.Date;
import java.util.List;

public class Board {
	private int b_no;
	private String b_owner;
	private Date b_date;
	private String b_title;
	private String b_content;
	private int b_views;
	
	private List<BoardComment> b_comments;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_owner() {
		return b_owner;
	}

	public void setB_owner(String b_owner) {
		this.b_owner = b_owner;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public int getB_views() {
		return b_views;
	}

	public void setB_views(int b_views) {
		this.b_views = b_views;
	}

	public List<BoardComment> getB_comments() {
		return b_comments;
	}

	public void setB_comments(List<BoardComment> b_comments) {
		this.b_comments = b_comments;
	}

	public Board(int b_no, String b_owner, Date b_date, String b_title, String b_content, int b_views,
			List<BoardComment> b_comments) {
		super();
		this.b_no = b_no;
		this.b_owner = b_owner;
		this.b_date = b_date;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_views = b_views;
		this.b_comments = b_comments;
	}
	
	
	
}
