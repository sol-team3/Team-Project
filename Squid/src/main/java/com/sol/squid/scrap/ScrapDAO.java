package com.sol.squid.scrap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScrapDAO {

	@Autowired
	private SqlSession ss;
	
	List<Scrap> scraps;
	
	public void getAllScrap(Scrap scrap, HttpServletRequest req) {

		System.out.println(scrap.getS_u_id());
		scraps = ss.getMapper(ScrapMapper.class).getAllScrap(scrap);
		
		req.setAttribute("scraps", scraps);
	}

	public void addScrap(Scrap scrap, HttpServletRequest req) {

		System.out.println(scrap.getS_rt_no());
		if (ss.getMapper(ScrapMapper.class).addScrap(scrap) >= 1) {
			System.out.println("등록 성공");
		} else {
			System.out.println("등록 실패");
		};
		
	}
}
