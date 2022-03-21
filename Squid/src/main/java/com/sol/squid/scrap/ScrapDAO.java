package com.sol.squid.scrap;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.squid.recruit.Recruit;
import com.sol.squid.recruit.RecruitMapper;

@Service
public class ScrapDAO {

	@Autowired
	private SqlSession ss;
	
	List<Scrap> scraps;
	
	public void getAllScrap(Scrap scrap, HttpServletRequest req) {

		System.out.println(scrap.getS_u_id());
		scraps = ss.getMapper(ScrapMapper.class).getAllScrap(scrap);
		
		Recruit rt = new Recruit();

		ArrayList<Recruit> recruits = new ArrayList<Recruit>();
		
		for (Scrap s : scraps) {
			// System.out.println(s.getS_rt_no());
			
			rt = ss.getMapper(RecruitMapper.class).getRecruitByScrap(s.getS_rt_no());
			
			// System.out.println(rt);
			recruits.add(rt); 
		}
		
		req.setAttribute("recruits", recruits);
	}

	public String addScrap(Scrap scrap, HttpServletRequest req) {

		Scrap s = ss.getMapper(ScrapMapper.class).getScrap(scrap);
		
		if (s == null) { // 이미 스크랩 했으면 등록 안함
			// System.out.println(scrap.getS_u_id());
			// System.out.println(scrap.getS_rt_no());
			if (ss.getMapper(ScrapMapper.class).addScrap(scrap) >= 1) {
				System.out.println("등록 성공");
			} else {
				System.out.println("등록 실패");
			};
			
			return "목록에 추가되었습니다.";
		} else {
			// System.out.println("이미 존재함");
			return "이미 추가되어있습니다.";
		}
	}

	public void deleteScrap(Scrap scrap, HttpServletRequest req) {
		
		if (ss.getMapper(ScrapMapper.class).deleteScrap(scrap) >= 1 ) {
			System.out.println("스크랩 삭제 성공!");
		} else {
			System.out.println("스크랩 삭제 실패!");
		};
	}
}
