package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.booksDaoImple;
import com.db.dbConnect;
@WebServlet("/delete")
public class deleltebooksdtl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			booksDaoImple bd=new booksDaoImple(dbConnect.getcon());
			boolean b=bd.deleteDetail(id);
			HttpSession hs=req.getSession();
			if(b==true) {
				hs.setAttribute("succmsg", "delete successfully");
				resp.sendRedirect("Admin/allbook.jsp");
			}
			else {
				hs.setAttribute("errormsg", "something went wrong");
				resp.sendRedirect("Admin/allbook.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
