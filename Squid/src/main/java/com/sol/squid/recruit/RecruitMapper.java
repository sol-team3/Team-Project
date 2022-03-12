package com.sol.squid.recruit;

import java.util.List;
import java.util.Map;

import com.sol.squid.user.User;

public interface RecruitMapper {

	List<Recruit> getAllRecruit(Map<String, Integer> m);

	int getCountRecruit();

	Recruit getRecruit(int no);

	User getUserInfo(String uId);

	int regRecruit(Recruit recruit);

	List<Recruit> searchRecruit(SearchRecruit sr);

	int deleteRecruit(Recruit recruit);

	int updateRecruit(Recruit recruit);
	
}
