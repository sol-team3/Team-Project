package com.sol.squid.job;

import java.util.List;

public interface JobMapper {

	// 구인 게시판 전체
	List<Job> getAllJob();
	
	// 구인게시판 상세
	Job detailJob(Job j);
	
	// 구인 게시판 수정
	int updateJob(Job j);
	
	// 구인 삭제
	int deleteJob(Job j);
	
	// 구인 등록
	int writeJob(Job j);
	
}
