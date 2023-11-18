package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Dao.booksDaoImple;
import com.db.dbConnect;
import com.entity.addbook;

@WebServlet("/add_book")
@MultipartConfig
public class addbookServlet  extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession hs=req.getSession();
			String bname=req.getParameter("bname");
			String author=req.getParameter("aname");
            String  price=req.getParameter("price");
            String cat=req.getParameter("bc");
            String status=req.getParameter("bs");
            Part file=req.getPart("file");
            String filename=file.getSubmittedFileName();
            addbook ad=new addbook(bname,author,price,cat,status,filename);
            booksDaoImple bd=new booksDaoImple(dbConnect.getcon());
                        boolean b=bd.addbookdet(ad);
            
            if(b==true) {
            	String path=getServletContext().getRealPath("")+"books";
                File f=new File(path);
                file.write(path + File.separator + filename);

            	hs.setAttribute("succmsg", "successfull addbook");
            	resp.sendRedirect("Admin/allbook.jsp");
            	
            }
            else {
            	hs.setAttribute("errormsg", "something went worng");
            	resp.sendRedirect("Admin/addbook.jsp");
            	
            }
           
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
