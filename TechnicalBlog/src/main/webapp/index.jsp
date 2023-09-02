<%@page import="com.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link rel="stylesheet" href="css/mystyle.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
 .cov{
object-fit: cover;
  width: 100%;
  height: auto;
}

</style>


</head>
<body>
	
	
	<!-- navbar -->
	<%@include file = "normal_navbar.jsp" %>
	
	<!-- banner -->
	<div class="container-fluid p-0 m-0 ">
	
		<div class ="jumbotron bg-dark text-white bannerbg"><!-- primary-background text-white -->
			<div class="container">
				<h3 class="display-3">Welcome To GoBlog</h3>
				<h3>GoBlog</h3>
			<p>Publish your passions your way. Whether you'd like to share your knowledge, experiences or the latest news, create a unique and beautiful blog.</p>
				<button class="btn btn-outline-light btn-lg bg-white" style="color:black"><span class="fa fa-user-plus"></span> Start ! its Free</button> &ensp;
				<a href="login.jsp" class="btn btn-outline-light btn-lg bg-white" style="color:black"><span class="fa fa-user-circle fa-spin"></span> Login</a>
			</div>
		</div>
	</div>
	
	
	<br>
	
	<div class="container">
		
		<div class="row">
		
		<%
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		
		List<Post> posts = postDao.getAllPosts();
		

		   for(Post p: posts)
		   {
		
		%>
		
		
			
			<div class="col-md-4 mt-2">
			
			
				<div class="card" >
				<div class="text-center mt-2">
				 	<img src="image/<%=p.getImage() %>" alt="<%=p.getTitle()%>" class="cov">
				</div>
				  <div class="card-body">
				    <h5 class="card-title"><%=p.getTitle() %></h5>
				    <p class="card-text"><%=p.getContent() %></p>
			
				    </div>
				    <div class="card-footer bg-dark text-center">
				    <a href="viewblog.jsp?pid=<%=p.getPid() %>" class="btn btn-dark text-white">Read More...</a>
				  </div>
				</div>
				
			
			
			</div>
			
				<%} %>
			
		</div>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type = "text/javascript"></script>
</body>
</html>