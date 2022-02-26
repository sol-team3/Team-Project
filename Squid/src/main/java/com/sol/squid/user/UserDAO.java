package com.sol.squid.user;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class UserDAO {
	
	@Autowired
	private SqlSession ss;

	public void login(User u, HttpServletRequest req) {
		
		User dbUser = ss.getMapper(UserMapper.class).getUserByID(u);
		
		if (dbUser != null) {
			if (u.getU_pw().equals(dbUser.getU_pw())) {
				req.getSession().setAttribute("loginUser", dbUser);
				req.getSession().setMaxInactiveInterval(60 * 60);
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}
		
	}

	public boolean loginCheck(HttpServletRequest req) {
		
		User u = (User) req.getSession().getAttribute("loginUser");
		if(u != null) {
			req.setAttribute("contentPage", "user/loginSuccess.jsp");
			return true;
		} else {
			req.setAttribute("contentPage", "user/login.jsp");
			return false;
		}
		
	}

	public void loginOut(HttpServletRequest req) {
		
		req.getSession().setAttribute("loginUser", null);
			
	}

	public void join(User u, HttpServletRequest req) {
		
		String path = req.getSession().getServletContext().getRealPath("resources/profileImg");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입 실패");
		}
		
		try {
			String id = mr.getParameter("u_id");
			String pw = mr.getParameter("u_pw");
			String name = mr.getParameter("u_name");
			String add1 = mr.getParameter("u_add1");
			String add2 = mr.getParameter("u_add2");
			String add3 = mr.getParameter("u_add3");
			 // address 가공하기 (우편번호 + 기본주소 + 상세주소)
			String address = add1 + "_" + add2 + "_" + add3;
			 // address2 가공하기 (공백과 괄호 없애고 동네이름만 db에 넣기 위해서)
			String a1 = mr.getParameter("u_address2");
			String a2 = a1.replace("(", "");
			String a3 = a2.replace(" ", "");
			String address2 = a3.replace(")", "");
			 // phonNumber 가공하기 (첫번째 자리 + 두번째 자리 + 세번째자리)
			String phonNum1 = mr.getParameter("u_phonNum1");
			String phonNum2 = mr.getParameter("u_phonNum2");
			String phonNum3 = mr.getParameter("u_phonNum3");
			String phonNumber = phonNum1 + "-" + phonNum2 + "-" + phonNum3;
			
			String birth = mr.getParameter("u_birth");
			String type= mr.getParameter("u_type");
			String intro = mr.getParameter("u_intro");
			String gender = mr.getParameter("u_gender");
			String profile = mr.getFilesystemName("u_profile");
			profile = URLEncoder.encode(profile, "utf-8");
			profile = profile.replace("+", " ");
			// 값 넘어오는지 확인 ok
			System.out.println(id);
			System.out.println(pw);
			System.out.println(name);
			System.out.println(address);
			System.out.println(address2);
			System.out.println(birth);
			System.out.println(type);
			System.out.println(intro);
			System.out.println(gender);
			System.out.println(profile);
			System.out.println(phonNumber);
			
			u.setU_id(id);
			u.setU_pw(pw);
			u.setU_name(name);
			u.setU_address(address);
			u.setU_address2(address2);
			u.setU_birth(birth);
			u.setU_type(type);
			u.setU_intro(intro);
			u.setU_gender(gender);
			u.setU_profile(profile);
			u.setU_phonNumber(phonNumber);
			
			if(ss.getMapper(UserMapper.class).join(u) == 1) {
				System.out.println("가입성공");
			}else {
				System.out.println("가입실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입실패");
		}
	}

	public void update(User u, HttpServletRequest req) {
		
		String path = req.getSession().getServletContext().getRealPath("resources/profileImg");
		MultipartRequest mr = null;
		User loginUser = (User) req.getSession().getAttribute("loginUser");
		String oldFile = loginUser.getU_profile();
		String newFile = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			newFile = mr.getFilesystemName("u_profile");
			if (newFile == null) {
				newFile = oldFile;
			}
//			} else {
//				newFile = URLEncoder.encode(newFile, "utf-8");
//				newFile = newFile.replace("+", " ");
//			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정 실패");
			return;
		}
		try {
			String pw = mr.getParameter("u_pw");

				
			String add1 = mr.getParameter("u_add1");
			String add2 = mr.getParameter("u_add2");
			String add3 = mr.getParameter("u_add3");
			// address 가공하기 (우편번호 + 기본주소 + 상세주소)				
			String address = add1 + "_" + add2 + "_" + add3;
			// address2 가공하기
			String a1 = mr.getParameter("u_address2");
			String a2 = a1.replace("(", "");
			String a3 = a2.replace(" ", "");
			String address2 = a3.replace(")", "");
			 // 폰넘버 가공하기
			String phonNum1 = mr.getParameter("phonNum1");
			String phonNum2 = mr.getParameter("phonNum2");
			String phonNum3 = mr.getParameter("phonNum3");
			String phonNumber = phonNum1+ "-" +phonNum2+ "-" + phonNum3;
		
			String intro = mr.getParameter("u_intro");
			String profile = newFile;
			System.out.println("-----------------------------------");
			System.out.println(loginUser.getU_id());
			System.out.println(pw);
			System.out.println(address);
			System.out.println(address2);
			System.out.println(intro);
			System.out.println(profile);
			System.out.println(phonNumber);
			System.out.println("-----------------------------------");
		
//			u.setU_name(loginUser.getU_name());
			u.setU_id(loginUser.getU_id());
//			u.setU_gender(loginUser.getU_gender());
//			u.setU_birth(loginUser.getU_birth());
//			u.setU_type(loginUser.getU_type());
			u.setU_pw(pw);
			u.setU_address(address);
			u.setU_address2(address2);
			u.setU_intro(intro);
			u.setU_profile(profile);
			u.setU_phonNumber(phonNumber);
			
			
			if(ss.getMapper(UserMapper.class).update(u) == 1) {
				System.out.println("업데이트 성공");
				login(u,req);
				if(!oldFile.equals(newFile)) {
					oldFile = URLDecoder.decode(oldFile, "utf-8");
					new File(path + "/" + oldFile).delete();
				}
			} else {
				System.out.println("수정실패");
				if (!oldFile.equals(newFile)) {
					newFile = URLDecoder.decode(newFile,"utf-8");
					new File(path + "/" + newFile).delete();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정실패");
			if (!oldFile.equals(newFile)) {
				try {
					newFile = URLDecoder.decode(newFile, "utf-8");
				} catch (UnsupportedEncodingException e1) {
				}
				new File(path + "/" + newFile).delete();
			}
		}
		
	}

	public void splitAddr(HttpServletRequest req) {
		User u = (User) req.getSession().getAttribute("loginUser");
		String address = u.getU_address();
		String[] address123 = address.split("_");
		String add1 = address123[0];
		String add2 = address123[1];
		String add3 = address123[2];
		
		req.setAttribute("add1", add1);
		req.setAttribute("add2", add2);
		req.setAttribute("add3", add3);
	}
	
	public void splitPhonNum(HttpServletRequest req) {
		User u = (User) req.getSession().getAttribute("loginUser");
		String phonNum = u.getU_phonNumber();
		String[] phonNum123 = phonNum.split("-");
		String phonNum1 = phonNum123[0];
		String phonNum2 = phonNum123[1];
		String phonNum3 = phonNum123[2];
		req.setAttribute("phonNum1", phonNum1);
		req.setAttribute("phonNum2", phonNum2);
		req.setAttribute("phonNum3", phonNum3);
	}

	public void delete(HttpServletRequest req) {
		
		try {
			User u = (User) req.getSession().getAttribute("loginUser");
			
			if(ss.getMapper(UserMapper.class).delete(u) == 1) {
				System.out.println("탈퇴성공");
				
				String path = req.getSession().getServletContext().getRealPath("resources/profileImg");
				String profile = u.getU_profile();
				profile = URLDecoder.decode(profile, "utf-8");
				new File(path + "/" + profile).delete();
				
				loginOut(req);
				loginCheck(req);
			}else {
				System.out.println("탈퇴실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("탈퇴실패");
		}
	}

	public User idcheck(User u, HttpServletRequest req) {
		System.out.println("userDAO" + req.getParameter("u_id"));
		u.setU_id(req.getParameter("u_id"));
		User user = (User)ss.getMapper(UserMapper.class).idcheck(u);
		System.out.println(user);

			return user;
	}

	public void findPw(User u, HttpServletRequest req) {
		
		u.setU_id(req.getParameter("u_id"));
		u.setU_name(req.getParameter("u_name"));
		String phonNum1 = req.getParameter("u_phonNum1");
		String phonNum2 = req.getParameter("u_phonNum2");
		String phonNum3 = req.getParameter("u_phonNum3");
		String phonNumber = phonNum1 + "-" + phonNum2 + "-" + phonNum3;
		u.setU_phonNumber(phonNumber);
		
		User user = (User)ss.getMapper(UserMapper.class).findPw(u);
		
		if(user == null) {
			req.setAttribute("information", "정보를 찾을 수 없습니다.");			
		} else {
			req.setAttribute("userByPw", user);
		}
			
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

