package com.sol.squid.user;

public interface UserMapper {
	
//  CRUD
	public User getUserByID(User u);

	public int join(User u);

	public int update(User u);

	public int delete(User u);
// 아이디 비번 찾기	
	public User findId(User u);

	public User findPw(User u);
// 아이디 휴대폰번호 중복 확인
	public User idcheck(User u);

	public User phonNumcheck(User u);

	

}
