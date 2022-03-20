package com.sol.squid.job;

import java.io.File;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sol.squid.SiteOption;
import com.sol.squid.board.Board;
import com.sol.squid.board.BoardMapper;
import com.sol.squid.board.BoardSelector;
import com.sol.squid.user.User;

@Service
public class JobDAO {


	@Autowired
	private SqlSession ss;
	
	@Autowired
	private SiteOption so;
	
	List<Job> jobs;
	
    
	public int allJobCount;
	
	public int getAllJobCount() {
		return allJobCount;
	}
	
	public void setAllJobCount(int allJobCount) {
		this.allJobCount = allJobCount;
	}
	
	public void calcAllJobCount() {
		JobSelector jSel = new JobSelector("", null, null);
		allJobCount = ss.getMapper(JobMapper.class).getJobCount(jSel);
	}

	// 구직 전체 + 페이지
	public void getJob(int pageNo, HttpServletRequest req) {
		
		int count = so.getBoardCountPerpage(); // 한 페이지당 몇 개 씩 보여줄껀지
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);
		
		// 검색어
		JobSelector search = (JobSelector) req.getSession().getAttribute("search");
		
		// 전체 게시글의 숫자
		int jobCount = 0;

		if (search == null) {
			// 검색어가 없는 경우
			search = new JobSelector("", new BigDecimal(start), new BigDecimal(end));
			// 검색어가 없을 때는 전체 몇 개
			jobCount = allJobCount;	
			
		} else {
			// 검색어가 있는 경우 // null이 아닌 경우
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			// 검색어가 있는 경우 게시글 몇 개 인지
			jobCount = ss.getMapper(JobMapper.class).getJobCount(search);
		}
		
		// List
		List<Job> jobs = ss.getMapper(JobMapper.class).getJob(search);
		// 메세지들		
		
		// 전체 게시글의 숫자 => 필요한 거 숫자!
		int pageCount = (int) Math.ceil(jobCount / (double) count);
		
		req.setAttribute("pageCount", pageCount);
		
		req.setAttribute("jobs", jobs);
		
		req.setAttribute("curPage", pageNo);
		
	}
		
	// 검색하기 , 페이지
	public void searchJob(JobSelector jSel, HttpServletRequest req) {
		
		
		req.getSession().setAttribute("search", jSel);
		// 검색한 내용을 세션에 넣기
	}
	
	
	
	// 구직 전체, 페이지x
	public void getAllJob(HttpServletRequest req) {

		jobs = ss.getMapper(JobMapper.class).getAllJob();
		
		req.setAttribute("jobs", jobs);
		
	}
	
	// 구직 상세
	public void detailJob(Job j, HttpServletRequest req) {
		
		Job dj = ss.getMapper(JobMapper.class).detailJob(j);
		
		req.setAttribute("dj", dj);
		
	}
	
	// 구직  등록
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

			String startDate = mr.getParameter("j_start_date"); 
			String endDate = mr.getParameter("j_end_date"); 
			
			String startTime = mr.getParameter("j_start_time");
			String endTime = mr.getParameter("j_end_time");
			
			String intro = mr.getParameter("j_intro");
			
			String pic = mr.getFilesystemName("j_pic");
			// 파일명 한글 관련 처리
			pic = URLEncoder.encode(pic, "utf-8");
			
			String[] area = mr.getParameterValues("j_area");
					
			System.out.println(saveDirectory);
			System.out.println(title);

			System.out.println(startDate);
			System.out.println(endDate);
			
			System.out.println(startTime);
			System.out.println(endTime);
			
			System.out.println(intro);
			
			System.out.println(pic);
			System.out.println(area);

			
			//로그인 유저 세션 가져오기
			User u = (User)req.getSession().getAttribute("loginUser");
			//세션에서 가져온 유저 아이디를 세팅
			j.setJ_u_id(u.getU_id());
			j.setJ_u_name(u.getU_name());
			
			j.setJ_title(title);
			
			// 자기소개
			j.setJ_intro(intro);
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
			
			// 지역
			String jArea = "";
			
			for (String s : area) {
				jArea += s + " ";
			}
			
			j.setJ_area(jArea);
			
			
			if (ss.getMapper(JobMapper.class).writeJob(j) == 1) {
				
				req.setAttribute("result", "  구직 글쓰기  성공");
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
	
	// 구직 수정
	public void updateJob(Job j, HttpServletRequest req) {
		
		
		try {
			
			String saveDirectory = req.getSession().getServletContext().getRealPath("resources/img");
			
			MultipartRequest mr = new MultipartRequest(req, saveDirectory, 
					1024 * 1024 * 30, "utf-8", new DefaultFileRenamePolicy());
			
			String title = mr.getParameter("j_title");

			String startDate = mr.getParameter("j_start_date"); 
			String endDate = mr.getParameter("j_end_date"); 

			String startTime = mr.getParameter("j_start_time");
			String endTime = mr.getParameter("j_end_time");

			String intro = mr.getParameter("j_intro");

			String pic = mr.getFilesystemName("j_pic");
			
			String[] area = mr.getParameterValues("j_area");
			int no = Integer.parseInt(mr.getParameter("j_no"));
			j.setJ_no(no);
			System.out.println(saveDirectory);
			System.out.println(title);
			System.out.println(startDate);
			System.out.println(endDate);
			System.out.println(startTime);
			System.out.println(endTime);
			System.out.println(intro);
			System.out.println(pic);
			System.out.println(area);
			
			//로그인 유저 세션 가져오기
			User u = (User)req.getSession().getAttribute("loginUser");
			//세션에서 가져온 유저 아이디를 세팅
			j.setJ_u_id(u.getU_id());
			
			//글 제목
			j.setJ_title(title);
			

			// 내용
			j.setJ_intro(intro);
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
			
			// 지역
			String jArea = "";
			
			for (String s : area) {
				jArea += s + " ";
			}
			
			j.setJ_area(jArea);
			
			System.out.println(jArea);
			
			
			if (ss.getMapper(JobMapper.class).updateJob(j) == 1) {
				System.out.println("구인 수정 성공");
				req.setAttribute("result", "구인 수정 성공");
			} else {
				System.out.println("구인 수정 실패1");
				req.setAttribute("result", "구인 수정 실패1");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("구인 수정 실패2");
			req.setAttribute("result", "구인 수정 실패2");
		}
	}	
	
	// 구직 삭제
	public void deleteJob(Job j, HttpServletRequest req) {
		
		try {
			if (ss.getMapper(JobMapper.class).deleteJob(j) == 1) {
				System.out.println("구인 삭제 성공");
				
				req.setAttribute("result", "구인 삭제 성공");
				
				String saveDirectory = req.getSession().getServletContext().getRealPath("resources/img");
				
				new File(saveDirectory + "/" + URLDecoder.decode(j.getJ_pic(), "utf-8")).delete();
				//파일 삭제하기			
						
			} else {
				System.out.println(" 구직 삭제 실패");
				req.setAttribute("result", " 구직  삭제 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(" 구직  삭제 실패");
			req.setAttribute("result", " 구직 삭제 실패");
		}
	}
	
	
	// 조회수
	public void updateJobViews(Job j, HttpServletRequest req) {
		
		String token = req.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");
		
		if(successToken != null && token.equals(successToken)) {
				return;
		}
		
		if (ss.getMapper(JobMapper.class).updateJobViews(j) == 1 ) {
			System.out.println("조회수 성공");
			req.setAttribute("result", "조회수 성공");
			req.getSession().setAttribute("successToken", token);
		} else {
			System.out.println("조회수 실패");
			req.setAttribute("result", "조회수 실패");
		}
		
		
	}
	
}
