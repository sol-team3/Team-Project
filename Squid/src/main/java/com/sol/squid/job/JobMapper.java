package com.sol.squid.job;

import java.util.List;

public interface JobMapper {
	
/*	int getJobCount(JobSelector jSel);
	
	//구직 게시판 전체 + 페이지
	List<Job> getJob(JobSelector search);
	
	// 검색
	List<Job> searchJob(Job j);
	*/
	
	// 구직 게시판 전체
	List<Job> getAllJob();
	
	// 구직게시판 상세
	Job detailJob(Job j);
	
	// 구직 게시판 수정
	int updateJob(Job j);
	
	// 구직 삭제
	int deleteJob(Job j);
	
	// 구직 등록
	int writeJob(Job j);
	
}
