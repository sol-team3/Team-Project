package com.sol.squid.user;

public interface UserMapper {

	public User getUserByID(User u);

	public int join(User u);

	public int update(User u);

	public int delete(User u);

	public int idcheck(User u);

	public User findPw(User u);

}
