package com.sol.squid.recruit;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface RecruitMapper {

	List<Recruit> getAllRecruit(Map<String, Integer> m);

	int getCountRecruit();

	Recruit getRecruit(int no);
	
}
