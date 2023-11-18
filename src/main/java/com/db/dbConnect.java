package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnect {
	private static Connection conn;
	static public  Connection getcon() {
		try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_book?user=root&password=admin");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
