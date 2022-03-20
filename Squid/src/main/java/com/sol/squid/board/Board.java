package com.sol.squid.board;

import java.util.Date;
import java.util.List;

public class Board {
	private int b_no;
	private String b_owner;
	private String b_u_type;
	private Date b_date;
	private String b_title;
	private String b_content;
	private int b_views;
	
	private List<BoardComment> b_comments;
	
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_address;
	private String u_address2;
	private String u_birth;
	private String u_type;
	private String u_intro;
	private String u_gender;
	private String u_profile;
	private String u_phonNumber;
	
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

	public String getB_u_type() {
		return b_u_type;
	}

	public void setB_u_type(String b_u_type) {
		this.b_u_type = b_u_type;
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

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_address2() {
		return u_address2;
	}

	public void setU_address2(String u_address2) {
		this.u_address2 = u_address2;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_type() {
		return u_type;
	}

	public void setU_type(String u_type) {
		this.u_type = u_type;
	}

	public String getU_intro() {
		return u_intro;
	}

	public void setU_intro(String u_intro) {
		this.u_intro = u_intro;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_profile() {
		return u_profile;
	}

	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}

	public String getU_phonNumber() {
		return u_phonNumber;
	}

	public void setU_phonNumber(String u_phonNumber) {
		this.u_phonNumber = u_phonNumber;
	}

	public Board(int b_no, String b_owner, String b_u_type, Date b_date, String b_title, String b_content, int b_views,
			List<BoardComment> b_comments, String u_id, String u_pw, String u_name, String u_address, String u_address2,
			String u_birth, String u_type, String u_intro, String u_gender, String u_profile, String u_phonNumber) {
		super();
		this.b_no = b_no;
		this.b_owner = b_owner;
		this.b_u_type = b_u_type;
		this.b_date = b_date;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_views = b_views;
		this.b_comments = b_comments;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_address = u_address;
		this.u_address2 = u_address2;
		this.u_birth = u_birth;
		this.u_type = u_type;
		this.u_intro = u_intro;
		this.u_gender = u_gender;
		this.u_profile = u_profile;
		this.u_phonNumber = u_phonNumber;
	}

	
	
	
}
