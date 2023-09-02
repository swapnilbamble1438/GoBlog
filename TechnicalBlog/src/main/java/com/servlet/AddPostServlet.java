package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.PostDao;
import com.dao.UserDao;
import com.entity.Message;
import com.entity.Post;
import com.entity.User;
import com.helper.ConnectionProvider;
import com.helper.MyUtility;
import com.helper.UploadPostPic;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddPostServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		try(PrintWriter out = response.getWriter())
	{

		try {
			int id = 0;
			int cid=0;
			String title="";
			String content="";
			String code="";
			String  image="";
			
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
					if(item.getFieldName().equals("cid"))
						cid= Integer.parseInt(item.getString().trim());
					if(item.getFieldName().equals("title"))
						title=item.getString().trim();
					if(item.getFieldName().equals("content"))
						content=item.getString().trim();
					if(item.getFieldName().equals("code"))
						code=item.getString().trim();
				
				}
				else
				{
					if(item.getName() == null || item.getName().isEmpty()
							|| item.getSize() == 0){
						System.out.println("file is not present");
					}
					else
					{	
	
						System.out.println("file is present");
						
						UploadPostPic myUtility = new UploadPostPic();
						 String destinationpath = path + "image/";
						 ArrayList<String> ext = new ArrayList();
						ext.add(".jpg");ext.add(".bmp");ext.add(".jpeg");ext.add(".png");ext.add(".webp");
						
					  image =	myUtility.UploadFile(title,item, destinationpath, ext);
					}
					System.out.println("file is not present");
				}
			}
			

				
				Post post = new Post();
				post.setId(id);
				post.setTitle(title);
				post.setContent(content);
				post.setCode(code);
				post.setCid(cid);
				post.setImage(image);
				
				System.out.println("post: " + post);
				
				PostDao postDao = new PostDao(ConnectionProvider.getConnection());
				
				if(postDao.savePost(post) > 0)
				{
				
					Message msg = new Message("Post Added successfully","success","alert-success");
	
					session.setAttribute("msg", msg);
					
					response.sendRedirect("profile.jsp");
					// out.print("Done");
				}
				else
				{
					Message msg = new Message("Failed to Add Post","error","alert-danger");
					
					session.setAttribute("msg", msg);
					
					response.sendRedirect("profile.jsp");
					
			//  	out.print("Failed");
				}
		
		
		} catch (FileUploadException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		
	}
		
		
		
	}

}
