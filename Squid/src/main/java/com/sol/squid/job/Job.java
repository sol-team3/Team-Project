package com.sol.squid.job;

import java.util.Date;

public class Job {

	private int j_no;
	private String j_title;
	private String j_u_id;
	private String j_u_name;
	private Date j_start_date;
	private Date j_end_date;
	private String j_start_time;
	private String j_end_time;
	private String j_area;
	private Date j_date;
	private String j_intro;
	private String j_pic;
	private int j_view;
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
	
	public Job() {
		// TODO Auto-generated constructor stub
	}

	public int getJ_no() {
		return j_no;
	}

	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}

	public String getJ_title() {
		return j_title;
	}

	public void setJ_title(String j_title) {
		this.j_title = j_title;
	}

	public String getJ_u_id() {
		return j_u_id;
	}

	public void setJ_u_id(String j_u_id) {
		this.j_u_id = j_u_id;
	}

	public String getJ_u_name() {
		return j_u_name;
	}

	public void setJ_u_name(String j_u_name) {
		this.j_u_name = j_u_name;
	}

	public Date getJ_start_date() {
		return j_start_date;
	}

	public void setJ_start_date(Date j_start_date) {
		this.j_start_date = j_start_date;
	}

	public Date getJ_end_date() {
		return j_end_date;
	}

	public void setJ_end_date(Date j_end_date) {
		this.j_end_date = j_end_date;
	}

	public String getJ_start_time() {
		return j_start_time;
	}

	public void setJ_start_time(String j_start_time) {
		this.j_start_time = j_start_time;
	}

	public String getJ_end_time() {
		return j_end_time;
	}

	public void setJ_end_time(String j_end_time) {
		this.j_end_time = j_end_time;
	}

	

	public String getJ_area() {
		return j_area;
	}

	public void setJ_area(String j_area) {
		this.j_area = j_area;
	}

	

	public Date getJ_date() {
		return j_date;
	}

	public void setJ_date(Date j_date) {
		this.j_date = j_date;
	}

	public String getJ_intro() {
		return j_intro;
	}

	public void setJ_intro(String j_intro) {
		this.j_intro = j_intro;
	}

	public String getJ_pic() {
		return j_pic;
	}

	public void setJ_pic(String j_pic) {
		this.j_pic = j_pic;
	}

	public int getJ_view() {
		return j_view;
	}

	public void setJ_view(int j_view) {
		this.j_view = j_view;
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

	public Job(int j_no, String j_title, String j_u_id, String j_u_name, Date j_start_date, Date j_end_date,
			String j_start_time, String j_end_time, String j_area, Date j_date, String j_intro, String j_pic,
			int j_view, String u_id, String u_pw, String u_name, String u_address, String u_address2, String u_birth,
			String u_type, String u_intro, String u_gender, String u_profile, String u_phonNumber) {
		super();
		this.j_no = j_no;
		this.j_title = j_title;
		this.j_u_id = j_u_id;
		this.j_u_name = j_u_name;
		this.j_start_date = j_start_date;
		this.j_end_date = j_end_date;
		this.j_start_time = j_start_time;
		this.j_end_time = j_end_time;
		this.j_area = j_area;
		this.j_date = j_date;
		this.j_intro = j_intro;
		this.j_pic = j_pic;
		this.j_view = j_view;
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

	@Override
	public String toString() {
		return "Job [j_no=" + j_no + ", j_title=" + j_title + ", j_u_id=" + j_u_id + ", j_u_name=" + j_u_name
				+ ", j_start_date=" + j_start_date + ", j_end_date=" + j_end_date + ", j_start_time=" + j_start_time
				+ ", j_end_time=" + j_end_time + ", j_area=" + j_area + ", j_date=" + j_date + ", j_intro=" + j_intro
				+ ", j_pic=" + j_pic + ", j_view=" + j_view + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name
				+ ", u_address=" + u_address + ", u_address2=" + u_address2 + ", u_birth=" + u_birth + ", u_type="
				+ u_type + ", u_intro=" + u_intro + ", u_gender=" + u_gender + ", u_profile=" + u_profile
				+ ", u_phonNumber=" + u_phonNumber + "]";
	}
	
	

}

