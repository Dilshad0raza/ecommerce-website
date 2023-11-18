package com.Dao;

import com.entity.User;

public interface UserDao {
	public boolean userRegister(User user);

	public User userLogin(String email,String password);
	public boolean checkUser(String email,String phone);
}
