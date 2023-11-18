package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.CartDaoIMple;
import com.Dao.booksDaoImple;
import com.db.dbConnect;
import com.entity.Cart;
import com.entity.addbook;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bid=req.getParameter("bid");
			System.out.println(bid);
			int bookid=Integer.parseInt(bid);
			int uid=Integer.parseInt(req.getParameter("uid"));
			System.out.println(uid);
			booksDaoImple bd=new booksDaoImple(dbConnect.getcon());
			addbook a=bd.getId(bookid);
			Cart c=new Cart();
			c.setUid(uid);
			c.setBid(bookid);
			c.setBname(a.getBname());
			c.setAname(a.getAname());
			c.setPrice(a.getPrice());
			CartDaoIMple cd=new CartDaoIMple(dbConnect.getcon());
			boolean b=cd.addCart(c);
			System.out.println(b);
			HttpSession hs=req.getSession();
			
			if(b==true) {
				hs.setAttribute("succmsg", "successfull");
				resp.sendRedirect("compnonent/CartModule.jsp");
			}
			else {
				resp.sendRedirect("compnonent/home.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
