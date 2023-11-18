package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;

public class booksDaoImple implements booksDao{
	private Connection con;
	
	

	public booksDaoImple(Connection con) {
		super();
		this.con = con;
	}



	public boolean addbookdet(addbook ad) {
		boolean b=false;
		
			String q="insert into addbook(book_name,author_name,price,catagory,status,filename) values(?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, ad.getBname());
			ps.setString(2, ad.getAname());
			ps.setString(3,ad.getPrice());
			ps.setString(4, ad.getBc());
			ps.setString(5, ad.getBs());
			ps.setString(6, ad.getFilename());
			
			int i=ps.executeUpdate();
			if(i==1) {
				b=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return b;
	}



	public List<addbook> getallbooks() {
		List <addbook>list=new ArrayList<addbook>();
		addbook a=null;
		try {
			String s="select * from addbook";
			PreparedStatement ps=con.prepareStatement(s);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				 a=new addbook();
				 a.setId(rs.getInt(1));
				 a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				 list.add(a);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	public addbook getId(int id) {
		addbook a=null;
		try {
			String s="select * from addbook where id=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new addbook();
				 a.setId(rs.getInt(1));
				 a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}



	public boolean updateBook(addbook ad) {
		boolean b=false;
		
		try {
			String s="update addbook set book_name=?, author_name=?, price=? ,catagory=?, status=? where id=?";
			PreparedStatement ps=con.prepareStatement(s);
			
			ps.setString(1, ad.getBname());
			ps.setString(2, ad.getAname());
			ps.setString(3,ad.getPrice());
			ps.setString(4, ad.getBc());
			ps.setString(5, ad.getBs());
			ps.setInt(6,ad.getId());
			int i=ps.executeUpdate();
			
			if(i==1) {
				b=true;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return b;
	}



	public boolean deleteDetail(int id) {
		boolean b=false;
		try {
			String s="delete from addbook where id=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				b=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}



	public List<addbook> getNewBook() {
		List<addbook> list=new ArrayList<addbook>();
		addbook a=null;
		try {
			String s="select * from addbook where catagory=? and status=? order by id DESC";
			
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, "new book");
			ps.setString(2, "active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next()&& i<4) {
				a=new addbook();
				a.setId(rs.getInt(1));
				 a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				 list.add(a);
				 i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}



	public List<addbook> getRecentBook() {
		List <addbook>list=new ArrayList<addbook>();
		addbook a=null;
		String q="select * from addbook where status=? order by id DESC";
		try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, "active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next()&&i<=3) {
				a=new addbook();
				a.setId(rs.getInt(1));
				 a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				 list.add(a);
				 i++;
			}
			
		} catch (Exception e) {
	        e.printStackTrace();
		}
		
		return list;
	}



	public List<addbook> getOldBook() {
		List <addbook> list=new ArrayList<addbook>();
		addbook a=null;
		String q="select * from addbook where catagory=? and status=? order by id DESC";
		try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, "old book");
			ps.setString(2, "active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next()&&i<4) {
				a=new addbook();
				a.setId(rs.getInt(1));
				 a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				 list.add(a);
				 i++;
				
			}
		}
		catch (Exception e) {
	        e.printStackTrace();
		}
		
		return list;
	}
	public List<addbook>getallRecentBook() {
		List <addbook>list=new ArrayList<addbook>();
		addbook a=null;
		String q="select * from addbook where status=? order by id DESC";
		try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, "active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new addbook();
				a.setId(rs.getInt(1));
				 a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				
				 list.add(a);
			}
			
		} catch (Exception e) {
	        e.printStackTrace();
		}
		
		return list;
	}



	public List<addbook> getallNewBook() {
		List<addbook> list=new ArrayList<addbook>();
		addbook a=null;
		try {
			String s="select * from addbook where catagory=? and status=? order by id DESC";
			
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, "new book");
			ps.setString(2, "active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new addbook();
				 a.setId(rs.getInt(1));
				 a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				 list.add(a);
				 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		return list;
	}



	public List<addbook> getallOldBook() {
		List <addbook> list=new ArrayList<addbook>();
		addbook a=null;
		String q="select * from addbook where catagory=? and status=? order by id DESC";
		try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, "old book");
			ps.setString(2, "active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new addbook();
				a.setId(rs.getInt(1));
				 a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				 list.add(a);
				
			}
		}
		catch (Exception e) {
	        e.printStackTrace();
		}
		return list;
	}



	public List<addbook> getbookbySearch(String ch) {
		List<addbook>list=new ArrayList<addbook>();
		addbook a=null;
		try {
			String s="select * from addbook where book_name like ? or author_name like ? or catagory like ? and status=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new addbook();
				a.setId(rs.getInt(1));
				a.setBname(rs.getString(2));
				 a.setAname(rs.getString(3));
				 a.setPrice(rs.getString(4));
				 a.setBc(rs.getString(5));
				 a.setBs(rs.getString(6));
				 a.setFilename(rs.getString(7));
				 list.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	

}
