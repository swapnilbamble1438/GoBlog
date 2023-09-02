<%@page import="com.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entity.Message"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.LikesDao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entity.Message"%>

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
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
  body{
  	background: url(image/background.jpg);
  	background-size: cover;
  	background-attachment: fixed;
  }

	
 /* active links */
    .highlight a:hover{
      background-color:black;
      color: white;
    }
 /* end active links */
 
 .cov{
object-fit: cover;
  width: 100%;
  height: auto;
}
 
</style>


</head>
<body>

	<!-- navbar -->
	<%@include file = "usernavbar.jsp" %>
	
	
	<%@include file = "msg.jsp" %>	
	
	<%@include file = "profile_modal.jsp" %>
	
	<%@include file = "addpost_modal.jsp" %>

<%@include file = "profile_main_content.jsp" %> 
		
	
	


<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type = "text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


<script src="js/profile_modal.js" type = "text/javascript"></script>










</body>
</html>						
						
						
						
						
									
