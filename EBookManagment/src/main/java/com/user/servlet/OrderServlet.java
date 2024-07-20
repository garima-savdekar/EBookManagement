package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Order_Details;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String payment = req.getParameter("payment");

			String fulladdress = address + "," + landmark + "," + city + "," + state + "," + pincode;

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist = dao.getBookByUser(id);
			HttpSession session = req.getSession();

			if (blist.isEmpty()) {
				session.setAttribute("failedmsg", "Please add item to Cart");
				resp.sendRedirect("checkout.jsp");

			} else {

				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
				Order_Details o = null;
				ArrayList<Order_Details> orderlist = new ArrayList<Order_Details>();
				Random r = new Random();
				for (Cart c : blist) {
					o = new Order_Details();
					o.setOrderid("BOOK-ORD-00" + r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhoneno(phno);
					o.setFulladdress(fulladdress);
					o.setBookname(c.getBookname());
					o.setBookauthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(payment);

					orderlist.add(o);

				}
				if ("noselect".equals(payment)) {
					session.setAttribute("failedmsg", "Please Select Payment Method");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderlist);
					if (f) {
						session.setAttribute("succmsg", "Order Placed");
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedmsg", "Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
