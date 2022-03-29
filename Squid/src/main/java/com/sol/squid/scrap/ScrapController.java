package com.sol.squid.scrap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.squid.TokenMaker;

@Controller
public class ScrapController {

	@Autowired
	private ScrapDAO sDAO;
	
	// 스크랩 추가 (구인게시판)
	@RequestMapping(value = "/scrap.add", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody String addScrap(Scrap scrap, HttpServletRequest req, HttpServletResponse responce) {
		
//		System.out.println(scrap.getS_rt_no());
//		System.out.println(scrap.getS_u_id());
		String result = sDAO.addScrap(scrap, req);
		
		return result;
	}
	
	// 스크랩 추가 (구직게시판)
	@RequestMapping(value = "/scrap_c.add", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody String addScraps(Scrap scrap, HttpServletRequest req, HttpServletResponse responce) {
		
//		System.out.println(scrap.getS_rt_no());
//		System.out.println(scrap.getS_u_id());
		String result = sDAO.addScrap_c(scrap, req);
		
		return result;
	}
	
	// 마이스크랩 이동 (구인게시판)
	@RequestMapping(value = "/scrap.go", method = RequestMethod.GET)
	public String goScrapPage(Scrap scrap, HttpServletRequest req) {

		TokenMaker.make(req);
		
		// System.out.println(scrap.getS_u_id());
		sDAO.getAllScrap(scrap, req);
		
		req.setAttribute("contentPage", "scrap/scrapMain.jsp");
		return "index";
		
	}

	// 마이스크랩 이동 (구직게시판)
	@RequestMapping(value = "/scrap_c.go", method = RequestMethod.GET)
	public String goScrap_cPage(Scrap scrap, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		// System.out.println(scrap.getS_u_id());
		sDAO.getAllScrap_c(scrap, req);
		
		req.setAttribute("contentPage", "scrap/scrap_cMain.jsp");
		return "index";
		
	}

	// 스크랩 삭제 (구인게시판)
	@RequestMapping(value = "/scrap.delete", method = RequestMethod.GET)
	public String deleteScrap(Scrap scrap, HttpServletRequest req) {
		
		// System.out.println(scrap.getS_u_id());
		sDAO.deleteScrap(scrap, req);
		sDAO.getAllScrap(scrap, req);
		
		req.setAttribute("contentPage", "scrap/scrapMain.jsp");
		return "index";
		
	}
	
	// 스크랩 삭제 (구직게시판)
	@RequestMapping(value = "/scrap_c.delete", method = RequestMethod.GET)
	public String deleteScrap_c(Scrap scrap, HttpServletRequest req) {
		
		// System.out.println(scrap.getS_u_id());
		sDAO.deleteScrap_c(scrap, req);
		sDAO.getAllScrap_c(scrap, req);
		
		req.setAttribute("contentPage", "scrap/scrap_cMain.jsp");
		return "index";
		
	}
	
}
