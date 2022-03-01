package com.sol.squid.recruit;

import java.util.List;
import java.util.Map;

public interface RecruitMapper {

	List<Recruit> getAllRecruit(Map<String, Integer> m);

	int getCountRecruit();
	
}
