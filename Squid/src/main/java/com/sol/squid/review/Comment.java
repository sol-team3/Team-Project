package com.sol.squid.review;

import java.util.Date;

public class Comment {
	private int rc_no;
	private int rc_rv_no;
	private String rc_u_id;
	private Date rc_date;
	private String rc_content;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
	public Comment(int rc_no, int rc_rv_no, String rc_u_id, Date rc_date, String rc_content) {
		super();
		this.rc_no = rc_no;
		this.rc_rv_no = rc_rv_no;
		this.rc_u_id = rc_u_id;
		this.rc_date = rc_date;
		this.rc_content = rc_content;
	}

	public int getRc_no() {
		return rc_no;
	}

	public void setRc_no(int rc_no) {
		this.rc_no = rc_no;
	}

	public int getRc_rv_no() {
		return rc_rv_no;
	}

	public void setRc_rv_no(int rc_rv_no) {
		this.rc_rv_no = rc_rv_no;
	}

	public String getRc_u_id() {
		return rc_u_id;
	}

	public void setRc_u_id(String rc_u_id) {
		this.rc_u_id = rc_u_id;
	}

	public Date getRc_date() {
		return rc_date;
	}

	public void setRc_date(Date rc_date) {
		this.rc_date = rc_date;
	}

	public String getRc_content() {
		return rc_content;
	}

	public void setRc_content(String rc_content) {
		this.rc_content = rc_content;
	}
	
}
