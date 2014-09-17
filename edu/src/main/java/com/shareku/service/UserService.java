package com.shareku.service;

import java.util.List;

import com.shareku.entity.User;

public interface UserService {
	public User getUserById(Integer userId);
	
	public boolean insertUser(User user);
	
	public void updateUser(User user);
	
	public User getUserByNameAndPwd(String username,String password);
	
	public void updateUserBaseInfo(User user);
	
	public void updateUserRights(User user);
	
	public void deleteUser(int userId);
	
	public List<User> listPageUser(User user);
	
	public void updateLastLogin(User user);
	
	public User getUserAndRoleById(Integer userId);
	
	public List<User> listAllUser();
}
