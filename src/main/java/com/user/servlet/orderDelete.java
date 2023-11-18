package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.CartDaoIMple;
import com.db.dbConnect;
@WebServlet("/remove")
public class orderDelete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
			int id=Integer.parseInt(req.getParameter("id"));
			CartDaoIMple cd=new CartDaoIMple(dbConnect.getcon());
			boolean b=cd.RemoveOrder(id);
			if(b==true) {
				HttpSession hs=req.getSession();
				hs.setAttribute("succmsg", "successfull");
				resp.sendRedirect("compnonent/CartModule.jsp");
						
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	

}
