package com.sol.squid.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReviewMapper {

	List<Review> getAllReviews();

	int regReview(Review review);

	List<Review> getReview(Map<String, String> mr, HttpServletRequest req);

}
