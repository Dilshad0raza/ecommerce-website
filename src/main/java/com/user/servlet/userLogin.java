package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDaoImple;
import com.db.dbConnect;
import com.entity.User;
@WebServlet("/login")
public class userLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDaoImple ud=new UserDaoImple(dbConnect.getcon());
			HttpSession hs=req.getSession();
			String email=req.getParameter("email");
			String pass=req.getParameter("password");
			if(email.equals("admin@gmail.com")&&pass.equals("admin123")) {
				User u=new User();
				hs.setAttribute("userobj", u);
				u.setName("Admin");
				resp.sendRedirect("Admin/adminhome.jsp");
			}
			else {
				User u=ud.userLogin(email, pass);
				if(u!=null) {
					hs.setAttribute("userobj", u);
					resp.sendRedirect("compnonent/home.jsp");
					
				}
				else {
					hs.setAttribute("errormsg", "email or password are wrong");
					resp.sendRedirect("compnonent/login.jsp");
					
				}
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	

}
