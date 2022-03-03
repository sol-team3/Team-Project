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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sol.squid.user.User;

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

	public void getUserInfo(HttpServletRequest req) {

		String uId = req.getParameter("uId"); 
				
		User user = ss.getMapper(RecruitMapper.class).getUserInfo(uId);
		req.setAttribute("user", user);
		
	}

	public void regRecruit(Recruit r, HttpServletRequest req) {

		String path = req.getSession().getServletContext().getRealPath("resources/restImg");
		MultipartRequest mr = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			mr = new MultipartRequest(req, path, 10*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
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
			String rt_con_age = "";
			 // ,로 구분하고 합치기
			for (String s : rt_conAge) {
				rt_con_age += s + ", ";
			}
			 // 마지막 , 없애기
			int index = rt_con_age.length() - 2;
			rt_con_age = rt_con_age.substring(0, index);
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
			 // 시, 분을 나눠준다.
			String start_time = rt_start_time.replace(":", "");
			// System.out.println(rt_start_time);
			int start_hour = Integer.parseInt(start_time.substring(0, 2)) * 3600;
			int start_Minute = Integer.parseInt(start_time.substring(2, 4)) * 60;
			int total_start_time = start_hour + start_Minute;
			// System.out.println(total_start_time);
			
			String rt_end_time = mr.getParameter("rt_end_time");
			String end_time = rt_end_time.replace(":", "");
			// System.out.println(rt_end_time);
			int end_hour = Integer.parseInt(end_time.substring(0, 2)) * 3600;
			int end_Minute = Integer.parseInt(end_time.substring(2, 4)) * 60;
			int total_end_time = end_hour + end_Minute;
			// System.out.println(total_end_time);
			
			 // 시간 계산
			int total_time = total_end_time - total_start_time;
//			System.out.println(total_time + "초");
			
			int total_hour = total_time / 3600;
			int total_minute = total_time % 3600 / 60;
					
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
			}else{
				System.out.println("등록 실패!");
			};
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패!");
		}
	
		
	}
	
	
	
	
}
