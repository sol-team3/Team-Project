package com.sol.squid.user;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.spi.MDCAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
public class UserController {

	@Autowired
	private UserDAO uDAO;
	
	// 로그인 컨트롤
	@RequestMapping(value = "/login.go", method = RequestMethod.GET )	// a태그 또는 js로 get요청해서 온것일 것이므로 당연히 get으로 받아야됨
	public String loginGo(User u,HttpServletRequest req) { 
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "user/login.jsp");
		return "index";
	}
	// 로그인 시도 
	@RequestMapping(value = "/login.do", method = RequestMethod.POST )	// 이젠 아디 비번쓴거 안나오는게 좋으니 post로 요청 (view에는 post로 되어있음 이미)
	public String loginDo(User u,HttpServletRequest req) {
		uDAO.login(u,req);
		uDAO.loginCheck(req);		
		return "index";
	}
	// 로그인아웃
	@RequestMapping(value = "/loginout.do", method = RequestMethod.GET )	
	public String loginoutDo(HttpServletRequest req) {

		uDAO.loginOut(req);		
		uDAO.loginCheck(req);
		return "index";
	}
	// 내프로필로 이동
	@RequestMapping(value = "/myprofil.go", method = RequestMethod.GET )	
	public String myprofileGo(User u,HttpServletRequest req) {
		
		uDAO.loginCheck(req); //로그인세션 확인후 널아니면 loginSuccess.jsp 보여줌(내 프로필 볼 수 있는 곳)
		return "index";
	}
	// 내프로필에서 '내정보'로 이동
	@RequestMapping(value = "/mypage.go", method = RequestMethod.GET )	
	public String mypageGo(HttpServletRequest req) {
		
		uDAO.loginCheck(req);
		uDAO.splitAddr(req);
		uDAO.splitPhonNum(req);
		req.setAttribute("contentPage", "user/mypage.jsp");
		return "index";
	}
	// 내프로필에서 탈퇴하기
	@RequestMapping(value = "/mypage.userdelete.go", method = RequestMethod.GET )	
	public String mypageUserDeleteGo(HttpServletRequest req) {
		
		uDAO.loginCheck(req);
		uDAO.delete(req); 
		req.setAttribute("contentPage", "user/deleteSuccess.jsp");
		return "index";
	}
	// 내프로필에서 업데이트페이지 가기
	@RequestMapping(value = "/mypage.update.go", method = RequestMethod.POST )	
	public String mypageUpdateGo(HttpServletRequest req) {
		
		uDAO.loginCheck(req);
		uDAO.splitAddr(req);
		uDAO.splitPhonNum(req);
		req.setAttribute("contentPage", "user/mypageUpdate.jsp");
		return "index";
	}
	// 내프로필업데이트페이지에서 업데이트하기
	@RequestMapping(value = "/mypage.update.do", method = RequestMethod.POST )	
	public String mypageUpdateDo(User u,HttpServletRequest req) {
		
		uDAO.loginCheck(req);
		uDAO.update(u, req);
		
		req.setAttribute("contentPage", "user/updateSuccess.jsp");
		return "index";
	}
		
	// 회원가입 컨트롤
	@RequestMapping(value = "/join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "user/join.jsp");
		return "index";
	}
	// 회원가입 컨트롤 - 개인회원가입
	@RequestMapping(value = "/join.IndividualMember.go", method = RequestMethod.GET)
	public String joinIndividualMemberGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "user/joinIndividualMember.jsp");
		return "index";
	}
	// 회원가입 컨트롤 - 사업자회원가입
	@RequestMapping(value = "/join.corporateMember.go", method = RequestMethod.GET)
	public String joinCorporateMeberGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "user/joinCorporateMember.jsp");
		return "index";
	}
	// 회원가입 동작
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinDo(User u,HttpServletRequest req) {
		
		uDAO.join(u, req);
		req.setAttribute("contentPage", "user/joinSuccess.jsp");
		return "index";
	}
	// 제이쿼리로 아디디 중복확인	
	@RequestMapping(value = "idcheck.do", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public @ResponseBody String idcheckDo(User u,HttpServletRequest req) {
		
		System.out.println(req.getParameter("u_id"));
		String uu = "";
		if(uDAO.idcheck(u,req) == null) {
			uu = "1";
		}

		return uu;
	}
	// 비밀번호찾기 페이지 가기
	@RequestMapping(value = "/findPw.go", method = RequestMethod.GET)
	public String findPwGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "user/findingPw.jsp");
		return "index";
	}
	// 비밀번호찾기 동작
	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public String findPwDo(User u,HttpServletRequest req) {
		
		uDAO.findPw(u, req);
		req.setAttribute("contentPage", "user/findingPwSuccess.jsp");
		return "index";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
