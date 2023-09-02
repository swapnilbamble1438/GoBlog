package com.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RegisterServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

//		try(PrintWriter out = response.getWriter())
//		{
//			out.println("<!DOCTYPE html>");
//			out.println("<html>");
//			out.println("<head>");
//			out.println("<title>RegisterServlet</title>");
//			out.println("</head>");
//			out.println("<body>");	
		
		HttpSession session = request.getSession();
			
		
			String check = request.getParameter("check");
			if(check == null)
			{
				System.out.println("Please check terms and conditions");
			}
			else
			{
				String name = request.getParameter("name").trim();
				String email = request.getParameter("email").trim();
				String password = request.getParameter("password").trim();
				String gender = request.getParameter("gender").trim();
				String about = request.getParameter("about").trim();
				
				if(about.trim().equals(""))
				{
					User user = new User(name,email,password,gender,about);
				}
				
				User user = new User(name,email,password,gender,about);
					
				
				// create user dao object
				UserDao dao = new UserDao(ConnectionProvider.getConnection());
				if(dao.saveUser(user) > 0)
				{
				
					Message msg = new Message("User Registered successfully","success","alert-success");
					
					session.setAttribute("msg", msg);
					
					response.sendRedirect("login.jsp");
					
				}
				else {
					Message msg = new Message("Failed to Register User , try using different Email Id","error","alert-danger");
					
					session.setAttribute("msg", msg);
					
					response.sendRedirect("register.jsp");

				}
				
				
				
			}
			
			
//			out.println("</body>");
//			out.println("</html>");
//		}
		
		
		
		
	}

}
