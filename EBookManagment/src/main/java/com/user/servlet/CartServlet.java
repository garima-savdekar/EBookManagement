package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Details;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			Book_Details b=dao.getBookById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookname(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalprice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			System.out.println(f);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("addcart", "Book Added to Cart");
				resp.sendRedirect("all_new_book.jsp");
			}
			else {
				session.setAttribute("failedmsg", "Something wrong on server");
				resp.sendRedirect("all_new_book.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
