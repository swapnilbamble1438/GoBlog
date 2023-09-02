package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LikesDao;
import com.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/CheckLikeServlet")
public class CheckLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CheckLikeServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		try(PrintWriter out = response.getWriter())
		{
		
			int uid =Integer.parseInt(request.getParameter("uid").trim());
			int pid =Integer.parseInt(request.getParameter("pid").trim());
		
			out.println(uid + " " + pid);
			
			System.out.println(uid + " " + pid);
		
			LikesDao ldao = new LikesDao(ConnectionProvider.getConnection());
			
			
			if( ldao.checkLike(pid, uid) > 0)
			{
				out.print(1);
			}
			else {
				out.print(0);
			}
			
			 
			
			
			
			
		}
	
	
	}

}
