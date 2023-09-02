<!-- profile modal -->
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header bg-dark text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
		        
		        
		        
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      
		      	</div>
		    	
		    	<div class="modal-body">
					<div class="container text-center">
						
						<img src="image/<%=user.getProfile() %>" height="45px"/>
						
						<h5><%=user.getName() %></h5>
					
						<!-- details -->
							
						<div id="profile-details">
								
								<table class="table">
	  
								  <tbody>
						    	  	<tr>
						      			<th scope="row">Id :</th>
						      			<td><%=user.getId() %></td>
						     
								    </tr>
								    <tr>
								      	<th scope="row">Email Id :</th>
								      	<td><%=user.getEmail() %></td>
								     
								    </tr>
								    <tr>
								      	<th scope="row">Gender :</th>
								     	<td><%=user.getGender() %></td>
								     
								    </tr>
								     <tr>
								      	<th scope="row">About :</th>
								      	<td><%=user.getAbout() %></td>
								     
								    </tr>
								     <tr>
								      	<th scope="row">Registered Date :</th>
								      	<td><%=user.getRegdate() %></td>
								     
								    	</tr>
								  </tbody>
								</table>
							
						</div>
					
					<!-- profile edit -->
					<div id="profile-edit" style="display:none">
						
						<h5 class="mt-2">Please Edit Carefully</h5>
						
						<form method="post" action="EditServlet" enctype="multipart/form-data">
						
							<table class="table">
		  
							  <tbody>
							  
							    <tr>
							      <th scope="row">Id :</th>
							      <td><%=user.getId() %></td>
							    	 <input name="id" type="hidden" 
							          value="<%=user.getId() %>">
							    </tr>
							    <tr>
							      <th scope="row">Name :</th>
							      <td><input type="text" name="name" 
							          value="<%=user.getName() %>"
							          class="form-control"></td>
							     
							    </tr>
							    
							    <tr>
							      <th scope="row">Email Id :</th>
							      <td><input type="email" name="email" 
							          value="<%=user.getEmail() %>"
							          class="form-control"></td>
							     
							    </tr>
							     <tr>
							      <th scope="row">Password :</th>
							      <td><input type="password" name="password" 
							          value="<%=user.getPassword() %>"
							          class="form-control"></td>
							     
							    </tr>
							    <tr>
							      <th scope="row">Gender :</th>
							      <td><input type="text" name="gender" 
							          value="<%=user.getGender() %>"
							          class="form-control"></td>
							  
							    
							     <tr>
							      <th scope="row">About :</th>
							      <td><textarea class="form-control"
							      		name="about" rows="3">
							      		<%=user.getAbout() %>
							      	  </textarea></td>
							     
							    </tr>
							    
							     
							     <tr>
							      <th scope="row">Profile Pic :</th>
							      <td><input type="file" name="profile"
							           class="form-control"></td>
							     
							    </tr>
							    
							  </tbody>
							</table>
							
							<div class="container">
								<button type="submit" class="btn btn-outline-dark">Save</button>
							</div>
							
						</form>
					</div>
					
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
		        <button  id="profile-edit-btn" type="button" class="btn btn-dark">Edit</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	
	<!-- end of profile modal -->