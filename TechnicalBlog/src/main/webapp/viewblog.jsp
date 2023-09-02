<%@page import="com.dao.LikesDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entity.Message"%>
<%@page import="com.entity.User"%>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page errorPage="error.jsp" %>
    <% 
    User user = (User)session.getAttribute("currentuser"); 
    if(user == null)
    {
    	response.sendRedirect("login.jsp");
    }
    
    %>
    
    <%
	int pid = Integer.parseInt(request.getParameter("pid"));

	PostDao postDao = new PostDao(ConnectionProvider.getConnection());
	
	Post p = postDao.getPostByPid(pid);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= p.getTitle() %></title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link rel="stylesheet" href="css/mystyle.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
 
  .post-title{
  		font-weight: 100;
  		font-size: 30px;
  }
  
  .post-content{
  		font-weight: 100;
  		font-size: 20px;
  }
  
  .post-code{
  
  }
  
  .post-user{
  		font-size: 15px;
  		
  }
  
  .post-date{
  		font-style:italic;
  		font-weight: bold;
  }
  
  .row-user{
  		border: 1px solid #e2e2e2;
  		padding-top: 15px;
  }
  
    body{
  	background: url(image/background.jpg);
  	background-size: cover;
  	background-attachment: fixed;
  }


#overflowTest {
 
  color: black;
  padding: 15px;
  width: 100%;
  height: 150px;
  overflow-x: hidden;
  overflow-y: scroll;
  white-space: pre-wrap;

}

 .cov{
object-fit: cover;
  width: 100%;
  height: auto;
}

</style>
<script src="http://code.jquery.com/jquery-latest.js">
  </script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<!--  comment plugin -->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v17.0" nonce="JmWpedcq"></script>
<!--  end comment plugin -->
</head>
<body>

	<!-- navbar -->
	<%@include file = "usernavbar.jsp" %>
	
	<%@include file = "msg.jsp" %>
	
	<%@include file = "profile_modal.jsp" %>
	
	<%@include file = "addpost_modal.jsp" %>
	
	
	
	
	<!-- main content of body -->
	
	<div class="container">
	
		<div class="row my-4">
		
			<div class="col-md-8 offset-md-2">
			
				<div class="card">
				
					<div class="card-header bg-dark text-white">
					
						<h4 class="post-title"><%=p.getTitle() %></h4>
					
					</div>
					
					<div class="card-body">
						
						 <div class="text-center mt-1">
							<img src="image/<%=p.getImage() %>" alt="<%=p.getTitle()%>" class="cov">
						 </div>	
						 
						 <div class="row my-3 row-user">
						 	<div class="col-md-8">
						 		<%
						 			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
						 			User postOfUser =	userDao.getUserById(p.getId());
						 		%>
						 	
						 		<p class="post-user"><a href="#"> <%=postOfUser.getName()%> has posted </a></p>
						 	</div>
						 	
						 	<div class="col-md-4">
						 		<p class="post-date">Posted on <%= DateFormat.getDateTimeInstance().format(p.getCreationdate()) %>
						 	</div>
						 </div>
						 
						 <p class="post-content"> <%=p.getContent() %></p>
						 
						 
						 
						 <div class="post-code">
						 	<pre id="overflowTest"><%=p.getCode() %></pre>
						</div>
						
						<input type="hidden" id="uid" value="<%=user.getId()%>">
						<input type="hidden" id="pid" value="<%= p.getPid()%>">
						<% 
						LikesDao ldao = new LikesDao(ConnectionProvider.getConnection());
				
					
					%>
										
					
					<input type="hidden" id="input" name="input"/>
				<!-- 	 Result =  <span class='result' id="result"><%=ldao.checkLike(p.getPid(), user.getId()) %></span>  -->
				
				
						
						<%@include file = "checklike.jsp" %>
						
						
					
					
					</div>
					
					<div class="card-footer bg-dark text-center">
					
					<%
					String likefunc="";
					String likeclass="";
					%>
					<span class='result' id="result">
					<% if(ldao.checkLike(p.getPid(), user.getId()) >= 1)
						{
							likefunc = "deleteLike";
							likeclass= "fa fa-thumbs-o-down";
						}
					if(ldao.checkLike(p.getPid(), user.getId()) == 0)
					{
							likefunc = "doLike";
							likeclass= "fa fa-thumbs-o-up";
						}
						%></span>
									
				
					
					
					
						<a href="#" onClick="<%=likefunc%>(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="<%=likeclass%>"></i> <span class="like-counter"><%= ldao.countLike(p.getPid()) %></span></a>
						<!--  <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span></span></a>-->
					
				
				
					<%@include file = "likeworking.jsp" %>
				
					</div>
					
					<!-- comment plugin -->
					<div class="card-footer">    
					<div class="fb-comments" data-href="http://localhost:8081/TechnicalBlog/viewblog.jsp?pid=<%=p.getPid() %>" data-width="" data-numposts="3"></div>
				
					</div>
					<!-- end comment plugin -->
						
				</div>
				
				
				
				
				
			
			</div>
		
		</div>
	
	</div>
	
	
	<!-- end of main content -->
	
	
	
	
	
	
	
	


<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type = "text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	

<script src="js/profile_modal.js" type = "text/javascript"></script>

<script src="js/addpost_modal.js" type = "text/javascript"></script>

<script src="js/myjs.js" type = "text/javascript"></script>
	
	
</body>
</html>