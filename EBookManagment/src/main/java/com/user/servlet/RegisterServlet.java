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

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("fname");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String pass=request.getParameter("pass");
			String check=request.getParameter("check");
			
			
			//System.out.println(name+" "+email+" "+phno+" "+pass+" "+check+" ");
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(pass);
			
			HttpSession session=request.getSession();
			
			if(check!=null) {
				
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				
				boolean f2=dao.checkUser(email);
				if(f2) {
					boolean f=dao.userRegister(us);
					if(f) {
						session.setAttribute("succmsg", "User Registered Successfully" );
						response.sendRedirect("register.jsp");
					}
					else {
						session.setAttribute("failedmsg", "Something went wrong" );
						response.sendRedirect("register.jsp");
						//System.out.println("Something Wrong");
						}
				}
				else {
					session.setAttribute("failedmsg", "User Already Exist" );
					response.sendRedirect("register.jsp");
				}
				
			}
			else{
				session.setAttribute("checkmsg", "Please check agree Terms and Condition" );
				response.sendRedirect("register.jsp");
				
				//System.out.println("Please check agree Terms and Condition");
				}
			}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
