package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.entity.Cart;

public class CartDaoIMple implements CartDao {
	private Connection con;

	public CartDaoIMple(Connection con) {
		super();
		this.con = con;
	}

	public boolean addCart(Cart c) {
		boolean b=false;
		try {
			String s="insert into cart(uid,bid,bname,aname,price) values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, c.getUid());
			ps.setInt(2, c.getBid());
			ps.setString(3, c.getBname());
			ps.setString(4, c.getAname());
			ps.setString(5, c.getPrice());
			
			int i=ps.executeUpdate();
			if(i==1) {
				b=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public List<Cart> getbookUser(int uid) {
		List<Cart>list=new ArrayList<Cart>();
		Cart c=null;
		try {
			String s="select * from cart where uid=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, uid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setId(rs.getInt(1));
				c.setUid(rs.getInt(2));
				c.setBid(rs.getInt(3));
				c.setBname(rs.getString(4));
				c.setAname(rs.getString(5));
				c.setPrice(rs.getString(6));
				list.add(c);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean RemoveOrder(int id) {
		boolean  b=false;
		try {
			String s="delete from cart where id=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				b=true;
			}
		} catch (Exception e) {
			e.printStackTrace();;
		}
		return b;
	}

	public List<Cart> getAllOrder() {
		List<Cart>list=new ArrayList<Cart>();
		Cart c=null;
		try {
			String s="select * from cart";
			PreparedStatement ps=con.prepareStatement(s);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setId(rs.getInt(1));
				c.setUid(rs.getInt(2));
				c.setBid(rs.getInt(3));
				c.setBname(rs.getString(4));
				c.setAname(rs.getString(5));
				c.setPrice(rs.getString(6));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

}
