package com.sol.squid.recruit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.squid.TokenMaker;

@Controller
public class RecruitController {
	
	@Autowired
	private RecruitDAO rDAO;
	
	// 구인게시판 이동
	@RequestMapping(value = "/recruit.go", method = RequestMethod.GET)
	public String goRecritPage(HttpServletRequest req) {
		
		if(!req.getParameterNames().hasMoreElements()) {
			rDAO.getAllRecruit(1,req);
		} else {
			int p = Integer.parseInt(req.getParameter("p"));
			rDAO.getAllRecruit(p,req);
		}
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		return "index";
	}
	
	// 구인게시물 이동
	@RequestMapping(value = "/recruit.detail", method = RequestMethod.GET)
	public String goRecritDeatailPage(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		rDAO.getRecruit(req);
		
		req.setAttribute("contentPage", "recruit/recruitDetail.jsp");
		return "index";
	}

	// 검색 기능
	@RequestMapping(value = "/recruit.search", method = RequestMethod.GET)
	public String searchRecritWritePage(SearchRecruit sr, HttpServletRequest req) {
		
		rDAO.searchRecruit(1, sr, req);
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		
		return "index";
	}
	
	// 구인 게시물 등록페이지
	@RequestMapping(value = "/recruit.write", method = RequestMethod.GET)
	public String goRecritWritePage(HttpServletRequest req) {
				
		rDAO.getUserInfo(req);
		
		req.setAttribute("contentPage", "recruit/recruitWrite.jsp");
		
		return "index";
	}
	
	// 구인 게시물 등록
	@RequestMapping(value = "/recruit.reg", method = RequestMethod.POST)
	public String regRecrit(Recruit recruit, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		rDAO.regRecruit(recruit, req);
		rDAO.getAllRecruit(1, req);
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		
		return "index";
	}	
	
	// 게시물 삭제
	@RequestMapping(value = "/recruit.delete", method = RequestMethod.GET)
	public String deleteRecrit(Recruit recruit, HttpServletRequest req) {
		
		rDAO.deleteRecruit(recruit, req);
		rDAO.getAllRecruit(1, req);
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		
		return "index";
	}

	// 게시물 수정페이지
	@RequestMapping(value = "/recruit.update.go", method = RequestMethod.GET)
	public String goUpdateRecrit(HttpServletRequest req) {
		
		rDAO.getRecruit(req);
		
		req.setAttribute("contentPage", "recruit/recruitUpdate.jsp");
		
		return "index";
	}
	
	// 게시물 수정
	@RequestMapping(value = "/recruit.update", method = RequestMethod.GET)
	public String updateRecrit(Recruit recruit, HttpServletRequest req) {
		
		rDAO.updateRecruit(recruit, req);
		rDAO.getAllRecruit(1, req);
		
		req.setAttribute("contentPage", "recruit/recruitMain.jsp");
		
		return "index";
	}


}
