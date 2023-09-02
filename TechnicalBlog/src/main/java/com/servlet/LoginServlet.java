package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entity.Message;
import com.entity.User;
import com.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
			
			String email= request.getParameter("email").trim();
			String password = request.getParameter("password").trim();
			
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			
			User user =dao.getUserByEmailAndPassword(email, password);
			
			if(user == null)
			{
				Message msg = new Message("Invalid Details ! try with another","error","alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				
				response.sendRedirect("login.jsp");
			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("currentuser",user);
				response.sendRedirect("profile.jsp");
			}
			
			
			
			
			
			
			
			
		
		
		
		
	}

}
