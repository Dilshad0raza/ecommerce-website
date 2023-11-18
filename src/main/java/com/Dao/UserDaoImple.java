package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDaoImple  implements UserDao{
	private  Connection con;
	

	public UserDaoImple(Connection con) {
		super();
		this.con = con;
	}


	public boolean userRegister(User user) {
		boolean b=false;
		String s="insert into  user(name,email,password,phone) values(?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1 ,user.getName());
			ps.setString(2 ,user.getEmail());
			ps.setString(3 ,user.getPassword());
			ps.setString(4 , user.getPhone());
			
			int i=ps.executeUpdate();
			if(i==1) {
				b=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}


	public User userLogin(String email, String password) {
		User u=null;
		try {
			String q="select * from user where email=? and password=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, email);
			ps.setString(2, password);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 u=new User();
				 u.setId(rs.getInt(1));
				 u.setName(rs.getString(2));
				 u.setEmail(rs.getString(3));
				 u.setPhone(rs.getString(4));
				 u.setPassword(rs.getString(5));
			 }

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}


	public boolean checkUser(String email,String phone) {
		boolean b=true;
	    try {
	    	String s="select * from user where email=? or phone=?";
	    	PreparedStatement ps=con.prepareStatement(s);
	    	ps.setString(1, email);
	    	ps.setString(2, phone);
	    	ResultSet rs=ps.executeQuery();
	    	while(rs.next()) {
	    		b=false;
	    	}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	

}
