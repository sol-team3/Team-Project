package com.sol.squid.recruit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RecruitDAO {

	@Autowired
	private SqlSession ss;

	List<Recruit> recruits;
	
	public void getAllRecruit(HttpServletRequest req) {

		recruits = ss.getMapper(RecruitMapper.class).getAllRecruit();
		
		req.setAttribute("recruits", recruits);
		
	}
	
}
