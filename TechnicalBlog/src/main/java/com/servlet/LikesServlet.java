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
@WebServlet("/LikesServlet")
public class LikesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LikesServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		try(PrintWriter out = response.getWriter())
		{
			String operation = request.getParameter("operation");
			int uid =Integer.parseInt(request.getParameter("uid"));
			int pid =Integer.parseInt(request.getParameter("pid"));
		
//			out.println("");
//			out.println("data from server");
//		out.println(operation + " " + uid + " " + pid);
		
		LikesDao ldao = new LikesDao(ConnectionProvider.getConnection());
		
		if(operation.equals("like"))
		{
			boolean f = ldao.inserLike(pid, uid);
			out.print(f);
		}
		if(operation.equals("deletelike"))
		{
			boolean a = ldao.deleteLike(pid, uid);
			out.println(a);
		}
		else {
			out.print(false);
		}
			
			 
			
			
			
			
		}
	
	
		
		
	}
	
	

}
