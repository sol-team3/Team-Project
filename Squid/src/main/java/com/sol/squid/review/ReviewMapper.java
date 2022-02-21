package com.sol.squid.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReviewMapper {

	List<Review> getAllReviews();

	int regReview(Review review);

	List<Review> searchReview(Map<String, String> mr);

	Review getReview(Review r);

	int deleteReview(Review review);

	int updateReview(Review review);

}
