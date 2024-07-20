package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("fname");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String pass=request.getParameter("pass");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			HttpSession session=request.getSession();
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.checkPassword(id, pass);
			
			
			if(f) {
				boolean b=dao.updateProfile(us);
				if(b) {
					session.setAttribute("succmsg", "User Profile Updated Successfully" );
					response.sendRedirect("Edit_profile.jsp");
				}
				else {
					session.setAttribute("failedmsg", "Something wrong on server" );
					response.sendRedirect("Edit_profile.jsp");
				}
			}
			else {
				session.setAttribute("failedmsg", "Incorrect Password" );
				response.sendRedirect("Edit_profile.jsp");
			}
			
			}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
