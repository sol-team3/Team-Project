package com.sol.squid.review;

import java.util.Date;

public class Review {

	private int rn;
	private int rv_no;
	private String rv_u_id;
	private String rv_title;
	private Date rv_date;
	private String rv_rest_name;
	private String rv_rest_img;
	private String rv_rest_addr;
	private String rv_content;
	private int rv_score;
	private int rv_views;
	
	public Review() {}

	public Review(int rn, int rv_no, String rv_u_id, String rv_title, Date rv_date, String rv_rest_name,
			String rv_rest_img, String rv_rest_addr, String rv_content, int rv_score, int rv_views) {
		super();
		this.rn = rn;
		this.rv_no = rv_no;
		this.rv_u_id = rv_u_id;
		this.rv_title = rv_title;
		this.rv_date = rv_date;
		this.rv_rest_name = rv_rest_name;
		this.rv_rest_img = rv_rest_img;
		this.rv_rest_addr = rv_rest_addr;
		this.rv_content = rv_content;
		this.rv_score = rv_score;
		this.rv_views = rv_views;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getRv_no() {
		return rv_no;
	}

	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}

	public String getRv_u_id() {
		return rv_u_id;
	}

	public void setRv_u_id(String rv_u_id) {
		this.rv_u_id = rv_u_id;
	}

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}

	public String getRv_rest_name() {
		return rv_rest_name;
	}

	public void setRv_rest_name(String rv_rest_name) {
		this.rv_rest_name = rv_rest_name;
	}

	public String getRv_rest_img() {
		return rv_rest_img;
	}

	public void setRv_rest_img(String rv_rest_img) {
		this.rv_rest_img = rv_rest_img;
	}

	public String getRv_rest_addr() {
		return rv_rest_addr;
	}

	public void setRv_rest_addr(String rv_rest_addr) {
		this.rv_rest_addr = rv_rest_addr;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public int getRv_score() {
		return rv_score;
	}

	public void setRv_score(int rv_score) {
		this.rv_score = rv_score;
	}

	public int getRv_views() {
		return rv_views;
	}

	public void setRv_views(int rv_views) {
		this.rv_views = rv_views;
	}
	
}
