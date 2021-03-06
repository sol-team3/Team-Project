package com.sol.squid.review;

import java.util.List;
import java.util.Map;

public interface ReviewMapper {
	List<Review> getAllReviews(Map<String, Integer> m);

	int regReview(Review review);

	List<Review> searchReview(Map<String, String> mr);

	Review getReview(Review r);

	int deleteReview(Review review);

	int updateReview(Review review);

	int plusView(Review review);

	int regComment(Comment comment);

	List<Comment> getComment();

	int deleteComment(Comment comment);

	int getCountReview();

	List<Review> getReviews();
	
}
