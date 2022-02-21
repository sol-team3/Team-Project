package com.sol.squid.user;

import java.util.Date;

public class User {

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

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String u_id, String u_pw, String u_name, String u_address, String u_address2, String u_birth,
			String u_type, String u_intro, String u_gender, String u_profile) {
		super();
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

}
