package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.UserDao;
import com.entity.Message;
import com.entity.User;
import com.helper.ConnectionProvider;
import com.helper.MyUtility;


@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public EditServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);

		try {
			
			int id=0;
			String name="";
			String email="";
			String password="";
			String gender="";
			String about="";
			String profile="";
			
			HttpSession session = request.getSession();
			
			
			 String path = "C:/Users/Swapnil/eclipse-workspace/TechnicalBlog/src/main/webapp/";
		//	String path = request.getRealPath("/");			
			List<FileItem> file = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			for (FileItem item : file) 
			{
				if(item.isFormField())	
				{	
					if(item.getFieldName().equals("id"))
						id= Integer.parseInt(item.getString().trim());
					if(item.getFieldName().equals("name"))
						name=item.getString().trim();
					if(item.getFieldName().equals("email"))
						email=item.getString().trim();
					if(item.getFieldName().equals("password"))
						password=item.getString().trim();
					if(item.getFieldName().equals("gender"))
						gender=item.getString().trim();
					if(item.getFieldName().equals("about"))
						about=item.getString().trim();
				
				}
				else
				{
					if(item.getName() == null || item.getName().isEmpty()
							|| item.getSize() == 0){
						System.out.println("file is not present");
					}
					else
					{	
						User currentuser = (User) session.getAttribute("currentuser");
						String oldfilename = currentuser.getProfile();
						System.out.println("file is present");
						
						MyUtility myUtility = new MyUtility();
						 String destinationpath = path + "image/";
						 ArrayList<String> ext = new ArrayList();
						ext.add(".jpg");ext.add(".bmp");ext.add(".jpeg");ext.add(".png");ext.add(".webp");
						
					  profile =	myUtility.UploadFile(name,item, destinationpath, ext,oldfilename);
					}
					System.out.println("file is not present");
				}
			}
			
		
				
			
			
			
			//	User user = (User) session.getAttribute("currentuser");
				User user = new User();
				user.setId(id);
				user.setName(name);
				user.setPassword(password);
				user.setEmail(email);
				user.setGender(gender);
				user.setAbout(about);
				user.setProfile(profile);
				
				System.out.println("user: " + user);
				System.out.println("id: " + id);
				// update data in database
				UserDao userDao = new UserDao(ConnectionProvider.getConnection());
				
				if(userDao.updateUser(user, id) > 0)
				{
					
					User currentuser =userDao.getUserByEmailAndPassword(email, password);
					session.setAttribute("currentuser", currentuser);
					
					Message msg = new Message("User Updated successfully","success","alert-success");
	
					session.setAttribute("msg", msg);
					
					response.sendRedirect("profile.jsp");
				}
				else
				{
					Message msg = new Message("Failed to Update User","error","alert-danger");
					
					session.setAttribute("msg", msg);
					
					response.sendRedirect("profile.jsp");
				}
		
		
		} catch (FileUploadException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		
		
		
		
		
	}

}
