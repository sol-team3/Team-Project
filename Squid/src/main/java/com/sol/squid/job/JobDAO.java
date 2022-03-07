package com.sol.squid.job;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sol.squid.user.User;

@Service
public class JobDAO {


	@Autowired
	private SqlSession ss;

	List<Job> jobs;
	
	// 구인 전체
	public void getAllJob(HttpServletRequest req) {

		jobs = ss.getMapper(JobMapper.class).getAllJob();
		
		req.setAttribute("jobs", jobs);
		
	}
	
	// 구인 상세
	public void detailJob(Job j, HttpServletRequest req) {
		
		Job dj = ss.getMapper(JobMapper.class).detailJob(j);
		
		req.setAttribute("dj", dj);
		
	}
	
	// 구인 등록
	public void writeJob(Job j, HttpServletRequest req) {
	
		//경로
		String saveDirectory = req.getSession().getServletContext().getRealPath("resources/img");
		
		MultipartRequest mr = null;
		
		String token = null;

		try {
			
			mr = new MultipartRequest(req, saveDirectory, 
						1024 * 1024 * 30, "utf-8", new DefaultFileRenamePolicy());	
				
			token = mr.getParameter("token");
			
			String successToken = (String) req.getSession().getAttribute("successToken");
	
			if(successToken != null && token.equals(successToken)) {
					
					String picName = mr.getFilesystemName("j_pic");
					//삭제
					new File(saveDirectory + "/" + picName).delete();
					//재요청을 하면 파일이 업로드가 되니까 파일삭제해주기
					return;			
			} 
			
			}	catch (Exception e) {
				e.printStackTrace();
				return;
			}
			
		try {
			
			String title = mr.getParameter("j_title");
			String restName = mr.getParameter("j_rest_name"); 
			String startDate = mr.getParameter("j_start_date"); 
			String endDate = mr.getParameter("j_end_date"); 
			String startTime = mr.getParameter("j_start_time");
			String endTime = mr.getParameter("j_end_time");
			String content = mr.getParameter("j_content");
			
			String pic = mr.getFilesystemName("j_pic");
			// 파일명 한글 관련 처리
			pic = URLEncoder.encode(pic, "utf-8");
			
			int pay = Integer.parseInt(mr.getParameter("j_pay"));
		
			System.out.println(saveDirectory);
			System.out.println(title);
			System.out.println(restName);
			System.out.println(startDate);
			System.out.println(endDate);
			System.out.println(startTime);
			System.out.println(endTime);
			System.out.println(content);
			System.out.println(pic);
			System.out.println(pay);
		
			//로그인 유저 세션 가져오기
			User u = (User)req.getSession().getAttribute("loginUser");
			//세션에서 가져온 유저 아이디를 세팅
			j.setJ_u_id(u.getU_id());
			
			j.setJ_title(title);
			
			// 가게 이름
			j.setJ_rest_name(restName);
			// 내용
			j.setJ_content(content);
			// 시작시간
			j.setJ_start_time(startTime);
			// 끝나는 시간
			j.setJ_end_time(endTime);
			// 파일
			j.setJ_pic(pic);
			// 날짜
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			j.setJ_start_date(sdf.parse(startDate));
			j.setJ_end_date(sdf.parse(endDate));
			
			// 시급 
			j.setJ_pay(pay);
		
			if (ss.getMapper(JobMapper.class).writeJob(j) == 1) {
				
				req.setAttribute("result", " 구인 글쓰기  성공");
				System.out.println(" 등록 성공");
				req.getSession().setAttribute("successToken", token);
			} 
			
		} catch(Exception e) {
			e.printStackTrace();
			String picName = mr.getFilesystemName("rt_pic");
			new File(saveDirectory + "/" + picName).delete();
			req.setAttribute("result", "글쓰기 실패 ");
			System.out.println("글쓰기 실패 ");
		}
		
		
	}
	
	// 구인 수정
	public void updateJob(Job j, HttpServletRequest req) {
			

		
		try {
			
			String saveDirectory = req.getSession().getServletContext().getRealPath("resources/img");
			
			MultipartRequest mr = new MultipartRequest(req, saveDirectory, 
					1024 * 1024 * 30, "utf-8", new DefaultFileRenamePolicy());
			
			String title = mr.getParameter("j_title");
			String restName = mr.getParameter("j_rest_name"); 

			String startDate = mr.getParameter("j_start_date"); 
			String endDate = mr.getParameter("j_end_date"); 

			String startTime = mr.getParameter("j_start_time");
			String endTime = mr.getParameter("j_end_time");

			String content = mr.getParameter("j_content");

			String pic = mr.getFilesystemName("j_pic");

			int pay = Integer.parseInt(mr.getParameter("j_pay"));
			
			System.out.println(saveDirectory);
			System.out.println(title);
			System.out.println(restName);
			System.out.println(startDate);
			System.out.println(endDate);
			System.out.println(startTime);
			System.out.println(endTime);
			System.out.println(content);
			System.out.println(pic);
			
			//로그인 유저 세션 가져오기
			User u = (User)req.getSession().getAttribute("loginUser");
			//세션에서 가져온 유저 아이디를 세팅
			j.setJ_u_id(u.getU_id());
			
			//글 제목
			j.setJ_title(title);
			
			// 가게 이름
			j.setJ_rest_name(restName);
			// 내용
			j.setJ_content(content);
			// 시작시간
			j.setJ_start_time(startTime);
			// 끝나는 시간
			j.setJ_end_time(endTime);
			// 파일
			j.setJ_pic(pic);
			// 날짜
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			j.setJ_start_date(sdf.parse(startDate));
			j.setJ_end_date(sdf.parse(endDate));
			
			// 시급 
			j.setJ_pay(pay);
			
			
			if (ss.getMapper(JobMapper.class).updateJob(j) == 1) {
				System.out.println("구인 수정 성공");
				req.setAttribute("result", "구인 수정 성공");
			} else {
				System.out.println("구인 수정 실패");
				req.setAttribute("result", "구인 수정 실패");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "구인 수정 실패");
		}

	}
	
	// 구인 삭제
	public void deleteJob(Job j, HttpServletRequest req) {
		
		try {
			if (ss.getMapper(JobMapper.class).deleteJob(j) == 1) {
				System.out.println("구인 삭제 성공");
				
				req.setAttribute("result", "구인 삭제 성공");
				
				String saveDirectory = req.getSession().getServletContext().getRealPath("resources/img");
				
				new File(saveDirectory + "/" + URLDecoder.decode(j.getJ_pic(), "utf-8")).delete();
				//파일 삭제하기			
						
			} else {
				System.out.println("구인 삭제 실패");
				req.setAttribute("result", "구인 삭제 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("구인 삭제 실패");
			req.setAttribute("result", "구인 삭제 실패");
		}
	}
	
	
	
}
