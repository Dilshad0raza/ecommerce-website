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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	           try {
				     String name=req.getParameter("name");
				     String email=req.getParameter("email");
				     String phone=req.getParameter("number");
				     String pass=req.getParameter("password");
				     String pass1=req.getParameter("pass");
				     String check=req.getParameter("check");
				     HttpSession ss=req.getSession();
				     System.out.println(check);
				     
				     if(pass.equals(pass1)) {
				    	 
				    	 if(check!=null) {
				    		  UserDaoImple ud=new UserDaoImple(dbConnect.getcon());
				    		  boolean b=ud.checkUser(email,phone);
				    		  if(b) {
				    			  User u=new User();
								     u.setName(name);
								     u.setEmail(email);
								     u.setPhone(phone);
								     u.setPassword(pass);
								    
								     
								     boolean c=ud.userRegister(u);
								     if(c==true) {
								    	 ss.setAttribute("succmsg", "Register Successfully");
								    	 resp.sendRedirect("compnonent/register.jsp");
								    	 
								     }
				    			  
				    		  }
				    		  else {
				    			  ss.setAttribute("errormsg", "email or phone is already Exists");
							    	 resp.sendRedirect("compnonent/register.jsp");
				    		  }
				    		 
				    	 }
				    	 
				     }
				     else {
				    	 ss.setAttribute("errormsg", "Password mismatch");
				    	 resp.sendRedirect("compnonent/register.jsp");
				     
				     

				     }
				     
			} catch (Exception e) {
				e.printStackTrace();
			}
	
	}
	
	

}
