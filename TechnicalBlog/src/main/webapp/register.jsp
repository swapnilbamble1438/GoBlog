<%@page import="com.entity.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link rel="stylesheet" href="css/mystyle.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<!-- navbar -->
	<%@include file = "normal_navbar.jsp" %>


<main class="d-flex align-items-center jumbotron bg-dark text-white bannerbg" style="padding-top:50px; padding-bottom:80px;">
		
		<div class="container">
		
			<div class="row">
			
				<div class="col-md-4 offset-md-4">
				
					<div class="card">
					
						<div class="card-header bg-dark text-white text-center">
						<span class="fa fa-user-plus fa-3x"></span>
						<br>
							<h3>Register Here</h3>
						
						</div>
							<%@include file = "msg.jsp" %>
						
						<div class="card-body">
							
							<form action="RegisterServlet" method="post" id="regform">
							
							 <div class="form-group">
							    <label for="exampleInputEmail1">User Name</label>
							    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Username">
							  </div>

							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							  </div>
							  
							  <div class="form-group">
							  	<label for="gender">Select Gender</label>
							  	<br>
							  	<input name="gender" type ="radio" value="Male" id="gender" > <span style="color:black">Male</span> &ensp;
							  	<input name="gender" type ="radio"  value="Female" id="gender"> <span style="color:black">Female</span>
							  </div>
							  
							  <div class="form-group">
							  	<textarea name="about" rows="5" class="form-control" placeholder="Enter something about yourself"></textarea>
							  
							  </div>
							  
							  
							  
							  
							  
							  <div class="form-check">
							    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">Agree Terms & Conditions</label>
							  </div>
							  <br>
							  <!--  
							  <div class="container text-center" id= "loader" style="display:none">
							  	<span class="fa fa-refresh fa-spin fa-2x text-dark"> </span>
							 	 <h5 class="text-dark">Please wait..</h5>
							  </div>
							  -->
							  <div class="container text-center" id="submitbtn">
							 	 <button type="submit" class="btn btn-dark">Submit</button>
							 </div>
							</form>
													
						
						</div>
					
					</div>
				
				</div>
			
			</div>
			
		</div>
	
	</main>


	
















<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type = "text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>



<script>
//	$(document).ready(function(){
//		console.log("loaded....");
		
//		$('#regform').on('submit',function(event){
//			
//			event.preventDefault();
			
//			let form = new FormData(this);
			
//			$("#submitbtn").hide();
//			$("#loader").show();
			
			// send register servlet:
				
//				$.ajax({
//					url: "RegisterServlet",
//					type: 'POST',
//					data: form,
//					success: function(data, textStatus, jqXHR)
//					{
//						console.log(data);
//						$("#submitbtn").show();
//						$("#loader").hide();
						
//						if(data.trim() === 'Done')
//						{
//						swal("Registered successfully.. we are redirecting to login page")
//							.then((value)=>{
//								window.location="login.jsp"
//							});
//						}else if(data.trim() === 'Failed')
//							{
//								swal("Email Id already exists, try using different Email Id")
//								.then((value)=>{
//									window.location="register.jsp"
//								});
//							}
						
//					},
//					error: function(jqXHR, textStatus, errorThrown)
//					{
//						console.log(jqXHR);	
//						$("#submitbtn").show();
//						$("#loader").hide();
						
//						swal("Something went wrong.. try again");
					
//					},
//					processData: false,
//					contentType: false
//				});
			
//		});
		
//	})
	
</script>


</body>
</html>