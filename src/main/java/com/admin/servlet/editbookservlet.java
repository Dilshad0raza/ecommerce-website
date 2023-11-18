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
import com.entity.addbook;
@WebServlet("/edit_details")
public class editbookservlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession hs=req.getSession();
			int id=Integer.parseInt(req.getParameter("id"));
			String bname=req.getParameter("bname");
			String aname=req.getParameter("aname");
			String price=req.getParameter("price");
			String cat=req.getParameter("bc");
			String status=req.getParameter("bs");
			
		    addbook a=new addbook();
		    a.setId(id);
		    a.setAname(aname);
		    a.setBname(bname);
		    a.setPrice(price);
		    a.setBc(cat);
		    a.setBs(status);
		    
		    booksDaoImple bd=new booksDaoImple(dbConnect.getcon());
		   boolean b= bd.updateBook(a);
		   if(b==true) {
			   hs.setAttribute("succmsg", "Update Successfully");
			   resp.sendRedirect("Admin/allbook.jsp");
		   }
		   else {
			   hs.setAttribute("errormsg", "something went wrong");
			   resp.sendRedirect("Admin/edit.jsp");
		   }
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
