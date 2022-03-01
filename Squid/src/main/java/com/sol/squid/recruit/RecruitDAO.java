package com.sol.squid.recruit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecruitDAO {

	@Autowired
	private SqlSession ss;

	List<Recruit> recruits;
	
	public void getAllRecruit(int pageNo, HttpServletRequest req) {

		req.setAttribute("curPageNo", pageNo);
		
		int count = 6; // 한페이지당 보여줄 갯수
		int total = ss.getMapper(RecruitMapper.class).getCountRecruit();
		int pageCnt = (int)Math.ceil((double)total/count); // 총 페이지 수
		int start = (pageNo - 1) * count + 1; // 데이터 시작 번호
		int end = start + (count - 1); // 데이터 끝 번호
	
		req.setAttribute("endPage", pageCnt);
		req.setAttribute("pageCnt", pageCnt);

		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start", start);
		m.put("end", end);
		
		recruits = ss.getMapper(RecruitMapper.class).getAllRecruit(m);
		
		req.setAttribute("recruits", recruits);
		
	}

	public void getRecruit(HttpServletRequest req) {

		int no = Integer.parseInt(req.getParameter("rt_no"));
		Recruit recruit = ss.getMapper(RecruitMapper.class).getRecruit(no);
		req.setAttribute("recruit", recruit);
	}
	
	
	
	
}
