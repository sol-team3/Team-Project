package com.sol.squid.scrap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScrapController {

	@Autowired
	private ScrapDAO sDAO;
	
	@RequestMapping(value = "/scrap.add", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody String submitChat(Scrap scrap, HttpServletRequest req, HttpServletResponse responce) {
		
		System.out.println(scrap.getS_rt_no());
		System.out.println(scrap.getS_u_id());
		String result = sDAO.addScrap(scrap, req);
		
		return result;
	}
	
	@RequestMapping(value = "/scrap.go", method = RequestMethod.GET)
	public String goScrapPage(Scrap scrap, HttpServletRequest req) {

		System.out.println(scrap.getS_u_id());
		sDAO.getAllScrap(scrap, req);
		
		req.setAttribute("contentPage", "scrap/scrapMain.jsp");
		return "index";
		
	}
	
}
