package com.sol.squid.job;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.squid.JobSiteOption;
import com.sol.squid.TokenMaker;
import com.sol.squid.user.UserDAO;

@Controller
public class JobController {

	@Autowired
	private JobDAO jDAO;
	
	@Autowired
	private UserDAO uDAO;
	
	// 구직 게시판 가기 + 페이지
	@RequestMapping(value = "/job.go", method = RequestMethod.GET)
	public String goJobPage(HttpServletRequest req) {
		jDAO.calcAllJobCount();
		
		TokenMaker.make(req);
		
		JobSiteOption.searchClear1(req);
		
		uDAO.loginCheck(req);
		
		jDAO.getJob(1, req);
		
		System.out.println("구직 게시판 가기");
		
		req.setAttribute("contentPage", "job/jobMain.jsp");
		
		return "index";
	}
	
	//페이지 
	@RequestMapping(value = "job.page.change", method = RequestMethod.GET)
	public String jobPageChange(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		int p = Integer.parseInt(req.getParameter("p"));

		jDAO.getJob(p, req);
		
		req.setAttribute("contentPage", "job/jobMain.jsp");
		
		return "index";
	}
	
	// 검색
	@RequestMapping(value = "/job.search", method = RequestMethod.GET)
	public String jobSearch(JobSelector jSel, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		jDAO.searchJob(jSel, req);
		jDAO.getJob(1, req);
				
		req.setAttribute("contentPage", "job/jobMain.jsp");
		
		return "index";
	}
	
	// 구직 게시판 가기
/*	@RequestMapping(value = "/job.go", method = RequestMethod.GET)
	public String goJobPage(HttpServletRequest req) {
		
		jDAO.getAllJob(req);
		
		req.setAttribute("contentPage", "job/jobMain.jsp");
		return "index";
	}*/
	
	// 구직 게시판 상세보기
	@RequestMapping(value = "/job.detail", method = RequestMethod.GET)
	public String goJobDetailPage(Job j, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		uDAO.loginCheck(req);
		
		// 조회수
		jDAO.updateJobViews(j,req);
		
		// 상세
		jDAO.detailJob(j, req);
		
		req.setAttribute("contentPage", "job/jobDetail.jsp");
		
		return "index";
	}
	
	// 구직 게시판 등록 페이지 가기
	@RequestMapping(value = "/job.write.go", method = RequestMethod.GET)
	public String goJobWrite(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		req.setAttribute("contentPage", "job/jobWrite.jsp");
		
		System.out.println("등록페이지가기");

		return "index";
	}
	
	// 구직 게시판 등록
	@RequestMapping(value = "/job.write", method = RequestMethod.POST)
	public String jobWrite(Job j, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		//등록
		jDAO.writeJob(j, req);
		
		// 전체
		jDAO.getJob(1, req);
		
		req.setAttribute("contentPage", "job/jobMain.jsp");
		
		return "index";
	}
	
	// 구직 게시판 삭제
	@RequestMapping(value = "/job.delete", method = RequestMethod.GET)
	public String jobDelete(Job j, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		jDAO.deleteJob(j, req);
		
		jDAO.getJob(1, req);
		
		req.setAttribute("contentPage", "job/jobMain.jsp");
		
		return "index";
	}
	
	// 구직 게시판 수정 페이지로 가기
	@RequestMapping(value = "/job.update.go", method = RequestMethod.GET)
	public String goJobUpdatePage(HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		req.setAttribute("contentPage", "job/jobUpdate.jsp");
		
		return "index";
	}
	
	// 구직 게시판 수정
	@RequestMapping(value = "/job.update", method = RequestMethod.POST)
	public String jobUpdate(Job j, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		jDAO.updateJob(j, req);
		
		jDAO.getJob(1, req);
		
		req.setAttribute("contentPage", "job/jobMain.jsp");
		
		return "index";
	}
	

	
	
}
