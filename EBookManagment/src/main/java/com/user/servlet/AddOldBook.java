package com.user.servlet;

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

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Details;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String category="Old";
			String status="Active";
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();	
			
			String useremail=req.getParameter("user");
			
			
			Book_Details b=new Book_Details(bookName,author,price,category,status,fileName,useremail);
			
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.addBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f) {
				String path=getServletContext().getRealPath("")+"book";
				
				File file=new File(path);
				part.write(path + File.separator + fileName);
				
				session.setAttribute("succmsg", "Book Added Successfully");
				resp.sendRedirect("sell_book.jsp");
			}
			else {
				session.setAttribute("failedmsg", "Something went wrong");
				resp.sendRedirect("sell_book.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}


