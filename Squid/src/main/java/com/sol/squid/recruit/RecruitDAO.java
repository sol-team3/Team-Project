package com.sol.squid.recruit;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sol.squid.user.User;

@Service
public class RecruitDAO {

	@Autowired
	private SqlSession ss;

	List<Recruit> recruits;
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	
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
		
		// 전체 게시물 출력
		recruits = ss.getMapper(RecruitMapper.class).getAllRecruit(m);
		req.setAttribute("recruits", recruits);
		
	}

	
	public void searchRecruit(int pageNo, SearchRecruit sr, HttpServletRequest req) {
		
		// 검색 값 초기화
		String startDateSet = "2000-01-01";
		String endDateSet = "2100-12-31";
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			String what = sr.getRecruitResearchMainSelect();
			String search = sr.getRecruitResearchMainInput();

			String startDate = req.getParameter("searchStartDate");
			String endDate = req.getParameter("searchEndDate");
			
			if (startDate == "" || startDate == null) {
				sr.setRecruitResearchStartDate(startDateSet);
			} else {
				startDate = sf.format(sdf.parse(startDate));
				sr.setRecruitResearchStartDate(startDate);
			}
			
			if (endDate == "" || endDate == null) {
				sr.setRecruitResearchEndDate(endDateSet);
			} else {
				endDate = sf.format(sdf.parse(endDate));
				sr.setRecruitResearchEndDate(endDate);
			}
			
			String startTime = sr.getRecruitResearchStartTime();
			String endTime = sr.getRecruitResearchEndTime();
			if(startTime == null || startTime == "") {
				startTime = "00:01";
				sr.setRecruitResearchStartTime(startTime);
			}
			if(endTime == null || endTime == "") {
				endTime = "23:59";
				sr.setRecruitResearchEndTime(endTime);
			}

//			System.out.println(what);
//			System.out.println(search);
//			System.out.println(sr.getRecruitResearchStartDate());
//			System.out.println(sr.getRecruitResearchEndDate());
//			System.out.println(startTime);
//			System.out.println(endTime);
			
			req.setAttribute("curPageNo", pageNo);
			
			int count = 6; // 한페이지당 보여줄 갯수
			int total = ss.getMapper(RecruitMapper.class).getCountRecruit();
			int pageCnt = (int)Math.ceil((double)total/count); // 총 페이지 수
			int start = (pageNo - 1) * count + 1; // 데이터 시작 번호
			int end = start + (count - 1); // 데이터 끝 번호
		
			req.setAttribute("endPage", pageCnt);
			req.setAttribute("pageCnt", pageCnt);

			sr.setStartPage(start);
			sr.setEndPage(end);
			
			recruits = ss.getMapper(RecruitMapper.class).searchRecruit(sr);
			
			req.setAttribute("recruits", recruits);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getRecruit(HttpServletRequest req) {

		int no = Integer.parseInt(req.getParameter("rt_no"));
		Recruit recruit = ss.getMapper(RecruitMapper.class).getRecruit(no);
		req.setAttribute("recruit", recruit);
	}

	public void getUserInfo(HttpServletRequest req) {

		String uId = req.getParameter("uId"); 
				
		User user = ss.getMapper(RecruitMapper.class).getUserInfo(uId);
		req.setAttribute("user", user);
		
	}

	public void regRecruit(Recruit r, HttpServletRequest req) {
		
		try {
			
			String path = req.getSession().getServletContext().getRealPath("resources/restImg");
			MultipartRequest mr = new MultipartRequest(req, path, 10*1024*1024, "utf-8", new DefaultFileRenamePolicy());

			String token = (String) mr.getParameter("token");
			String successToken = (String) req.getSession().getAttribute("successToken");
			
			// System.out.println("토큰 : " + token);
			// System.out.println("성공토근 : " + successToken);
			
			if(token != null) {
				if(successToken != null && token.equals(successToken)) {
					return;
				}
			}
			
			String rt_rest_name = mr.getParameter("rt_rest_name");
			String rt_rest_img = mr.getFilesystemName("rt_rest_img");
			String rt_rest_type = mr.getParameter("rt_rest_type");
			String rt_title = mr.getParameter("rt_title");
			// String add1 = mr.getParameter("u_add1");
			String add2 = mr.getParameter("u_add2");
			// String add3 = mr.getParameter("u_add3");
			 // address 가공하기 (우편번호 + 기본주소 + 상세주소)
			String u_address = add2;
			 // address2 가공하기 (공백과 괄호 없애고 동네이름만 db에 넣기 위해서)
			String a1 = mr.getParameter("u_address2");
			String a2 = a1.replace("(", "");
			String a3 = a2.replace(" ", "");
			String u_address2 = a3.replace(")", "");
			 // radio 값 여러개 받기
			String rt_conAge[] = mr.getParameterValues("rt_con_age");
//			System.out.println(rt_conAge);
			String rt_con_age = "";

			if (rt_conAge == null) {
				rt_con_age = "연령무관";				
			} else {			
				// ,로 구분하고 합치기
				for (String s : rt_conAge) {
					rt_con_age += s + ", ";
				}
				int index = rt_con_age.length() - 2;
				rt_con_age = rt_con_age.substring(0, index);
			}
			
			 // 마지막 , 없애기
			String rt_con_gender = mr.getParameter("rt_con_gender");
			int rt_pay = Integer.parseInt(mr.getParameter("rt_pay"));			
			Date rt_start_date = sdf.parse(mr.getParameter("rt_start_date"));
			Date rt_end_date = sdf.parse(mr.getParameter("rt_end_date"));
			
			 // 날짜 차이 계산하기
			long total = ((rt_end_date.getTime() - rt_start_date.getTime()) / 1000)/(24*60*60);
			String rt_total_date = Long.toString(total);
			
			Date now = new Date();
			sdf.format(now);
			long rt_day = (((rt_end_date.getTime() - now.getTime()) / 1000) / (24*60*60)) + 1;
			String rt_Dday = Long.toString(rt_day);
			
			 // 시간 차이 계산하기
			String rt_start_time = mr.getParameter("rt_start_time");
			String rt_end_time = mr.getParameter("rt_end_time");
			 // 시, 분을 나눠준다.
			String start_time = rt_start_time.replace(":", "");
			String end_time = rt_end_time.replace(":", "");
			// System.out.println(rt_start_time);
			int start_hour = Integer.parseInt(start_time.substring(0, 2)) * 3600;
			int end_hour = Integer.parseInt(end_time.substring(0, 2)) * 3600;
			int start_Minute = Integer.parseInt(start_time.substring(2, 4)) * 60;
			int end_Minute = Integer.parseInt(end_time.substring(2, 4)) * 60;
			int total_start_time = start_hour + start_Minute;
			//System.out.println("토탈 스타트 = " + total_start_time);
			int total_end_time = end_hour + end_Minute;
			//System.out.println("토탈 엔드 = " + total_end_time);
			int total_time = 0;				
			int total_hour = 0;
			int total_minute = 0;

			if(total_start_time > total_end_time) {
				//System.out.println("1번 걸림");
				total_time = (86400 - total_start_time) + total_end_time;
				total_hour = total_time / 3600;
				total_minute = total_time % 3600 / 60;
			} else {
				//System.out.println("2번 걸림");
				total_time = total_end_time - total_start_time;				
				total_hour = total_time / 3600;
				total_minute = total_time % 3600 / 60;
			}
			//System.out.println(total_time);
					
			 // 시간 비례 총 급여 계산
			// int rt_calcPayTime = Integer.parseInt(String.valueOf(Math.round(((double)total_time / 60)) * ((double)rt_pay / 60)));
			double calcpt = Math.round(((double)total_time / 60) * ((double)rt_pay / 60) * total);
			Double calpt = new Double(calcpt);
			
			int rt_calcPayTime = calpt.intValue(); 
			
			String totalHour = Integer.toString(total_hour);
			String totalMinute = Integer.toString(total_minute);
			
			String rt_total_time = totalHour + "시간" + totalMinute + "분";
			
			String rt_con_type = mr.getParameter("rt_con_type");
			String rt_content = mr.getParameter("rt_content");
			String rt_u_id = mr.getParameter("rt_u_id");

//			System.out.println("------");
//			
//			System.out.println(rt_rest_name);
//			System.out.println(rt_rest_img);
//			System.out.println(rt_rest_type);
//			System.out.println(rt_title);
//			System.out.println(add1);
//			System.out.println(add2);
//			System.out.println(add3);
//			System.out.println(u_address);
//			System.out.println(u_address2);
//			System.out.println(rt_con_age);
//			System.out.println(rt_con_gender);
//			System.out.println(rt_pay);
//			System.out.println(rt_start_date);
//			System.out.println(rt_end_date);
//			System.out.println(rt_total_date);
//			System.out.println(rt_start_time);
//			System.out.println(rt_end_time);
//			System.out.println(rt_total_time);
//			System.out.println(rt_con_type);
//			System.out.println(rt_content);
//			System.out.println(rt_u_id);
			
			r.setRt_u_id(rt_u_id);
			r.setRt_rest_name(rt_rest_name);
			r.setRt_rest_img(rt_rest_img);
			r.setRt_rest_type(rt_rest_type);
			r.setRt_title(rt_title);
			r.setRt_rest_addr1(u_address);
			r.setRt_rest_addr2(u_address2);
			r.setRt_con_age(rt_con_age);
			r.setRt_con_gender(rt_con_gender);
			r.setRt_con_type(rt_con_type);
			r.setRt_pay(rt_pay);
			r.setRt_calcPayTime(rt_calcPayTime);
			r.setRt_start_date(rt_start_date);
			r.setRt_end_date(rt_end_date);
			r.setRt_total_date(rt_total_date);
			r.setRt_Dday(rt_Dday);
			r.setRt_start_time(rt_start_time);
			r.setRt_end_time(rt_end_time);
			r.setRt_total_time(rt_total_time);
			r.setRt_content(rt_content);
			
			if(ss.getMapper(RecruitMapper.class).regRecruit(r) >= 1) {
				System.out.println("등록 성공!");
				req.getSession().setAttribute("successToken", token);
			}else{
				System.out.println("등록 실패!");
			};
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패!");
		}
	
		
	}


	public void deleteRecruit(Recruit recruit, HttpServletRequest req) {

		if(ss.getMapper(RecruitMapper.class).deleteRecruit(recruit) >= 1) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");			
		}; 
		
	}


	public void updateRecruit(Recruit recruit, HttpServletRequest req) {

		try {

			// radio 값 여러개 받기 ----------------
			String rt_conAge[] = req.getParameterValues("rt_con_age");
			System.out.println(rt_conAge);
			String rt_con_age = "";
	
			if (rt_conAge == null) {
				rt_con_age = "연령무관";				
			} else {			
				// ,로 구분하고 합치기
				for (String s : rt_conAge) {
					rt_con_age += s + ", ";
				}
				int index = rt_con_age.length() - 2;
				rt_con_age = rt_con_age.substring(0, index);
			}
	
			recruit.setRt_con_age(rt_con_age);
			// ----------------------------------
			
			// 시간 차이 구하기 -----------------------
			Date rt_start_date = sdf.parse(req.getParameter("rt_start_date"));
			Date rt_end_date = sdf.parse(req.getParameter("rt_end_date"));

			// 날짜 차이 계산하기
			long total = ((rt_end_date.getTime() - rt_start_date.getTime()) / 1000)/(24*60*60);
			String rt_total_date = Long.toString(total);
			recruit.setRt_total_date(rt_total_date);
			// ----------------------------------
			
			// D-DAY 구하기 -----------------------
			Date now = new Date();
			sdf.format(now);
			long rt_day = (((rt_end_date.getTime() - now.getTime()) / 1000) / (24*60*60)) + 1;
			String rt_Dday = Long.toString(rt_day);
			recruit.setRt_Dday(rt_Dday);
			
			// 시간에 따른 급여 계산 ---------------------
			// 시간 차이 계산하기
			String rt_start_time = req.getParameter("rt_start_time");
			String rt_end_time = req.getParameter("rt_end_time");
			 // 시, 분을 나눠준다.
			String start_time = rt_start_time.replace(":", "");
			String end_time = rt_end_time.replace(":", "");
			// System.out.println(rt_start_time);
			int start_hour = Integer.parseInt(start_time.substring(0, 2)) * 3600;
			int end_hour = Integer.parseInt(end_time.substring(0, 2)) * 3600;
			int start_Minute = Integer.parseInt(start_time.substring(2, 4)) * 60;
			int end_Minute = Integer.parseInt(end_time.substring(2, 4)) * 60;
			int total_start_time = start_hour + start_Minute;
			//System.out.println("토탈 스타트 = " + total_start_time);
			int total_end_time = end_hour + end_Minute;
			//System.out.println("토탈 엔드 = " + total_end_time);
			int total_time = 0;				
			int total_hour = 0;
			int total_minute = 0;

			if(total_start_time > total_end_time) {
				//System.out.println("1번 걸림");
				total_time = (86400 - total_start_time) + total_end_time;
				total_hour = total_time / 3600;
				total_minute = total_time % 3600 / 60;
			} else {
				//System.out.println("2번 걸림");
				total_time = total_end_time - total_start_time;				
				total_hour = total_time / 3600;
				total_minute = total_time % 3600 / 60;
			}
			//System.out.println(total_time);
			
			// int rt_calcPayTime = Integer.parseInt(String.valueOf(Math.round(((double)total_time / 60)) * ((double)rt_pay / 60)));
			double calcpt = Math.round(((double)total_time / 60) * ((double)Integer.parseInt(req.getParameter("rt_pay")) / 60) * total);
			Double calpt = new Double(calcpt);
			
			int rt_calcPayTime = calpt.intValue(); 
			recruit.setRt_calcPayTime(rt_calcPayTime);
			// -----------------------------------
			
			// 총 시간 표시하기 -------------------------
			String totalHour = Integer.toString(total_hour);
			String totalMinute = Integer.toString(total_minute);
			
			String rt_total_time = totalHour + "시간" + totalMinute + "분";
			recruit.setRt_total_time(rt_total_time);
			// -----------------------------------
			
			if(ss.getMapper(RecruitMapper.class).updateRecruit(recruit) >= 1) {
				System.out.println("수정 성공");
			} else {
				System.out.println("수정 실패");			
			}; 
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void getRecruits(Model model, HttpServletRequest req) {

		recruits = ss.getMapper(RecruitMapper.class).getRecruits();
		
		model.addAttribute("recruits", recruits);
		
	}

}
