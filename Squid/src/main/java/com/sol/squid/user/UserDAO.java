package com.sol.squid.user;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
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
				req.getSession().setMaxInactiveInterval(60 * 10);
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
			String address = add1 + "_" + add2 + "_" + add3;
			String address2 = mr.getParameter("u_address2");
			String birth = mr.getParameter("u_birth");
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Date birth2 = date.parse(birth);
			String type= mr.getParameter("u_type");
			String intro = mr.getParameter("u_intro");
			String gender = mr.getParameter("u_gender");
			String profile = mr.getFilesystemName("u_profile");
			profile = URLEncoder.encode(profile, "utf-8");
			profile = profile.replace("+", " ");
			
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
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입실패");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
