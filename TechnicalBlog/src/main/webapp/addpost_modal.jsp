<!-- add post modal -->
		
		<!-- Modal -->
		<div class="modal fade" id="addpost" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header bg-dark text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Create Post:</h5>
		        
		        
		        
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      
		      	</div>
		    	
		    	<div class="modal-body">
					<div class="container">
						
						
						<h5>Provide Post Details:</h5>
					
						<!-- details -->
						
													
						<div >
							<form id="add_post" action="AddPostServlet" method="post" enctype="multipart/form-data">
								
								<div class="form-group">
									<select class="form-control" name="cid">
										<option selected disabled>Select Category</option>
										
										<%
										CategoryDao categoryDao2 = new CategoryDao(ConnectionProvider.getConnection());
										ArrayList<Category> list2 = categoryDao2.getAllCategories();
										
										for(Category c:list2)
										{%>
											<option value="<%= c.getCid()%>"><%=c.getName() %></option>
									  
									  <%} %>
									</select>	
								</div>
								
								<input name="id" type="hidden" value="<%=user.getId()%>">
								
								
								<div class="form-group">
									<input name="title" type="text" placeholder ="Enter Post Title" class="form-control">
								</div>
								
								<div class="form-group">
									<textarea rows="3" class="form-control" name="content"
									placeholder="Enter Your Content"></textarea>
								</div>
								
								<div class="form-group">
									<textarea rows="3" class="form-control" name="code"
									placeholder="Enter Your Program(if any)"></textarea>
								</div>
								
								<div class="form-group">
									<label>Select your pic..</label>
									<br>
									<input type="file" name="image">
								</div>
								  
							  <div class="container text-center" id= "loader" style="display:none">
							  	<span class="fa fa-refresh fa-spin fa-2x text-dark"> </span>
							 	 <h5 class="text-dark">Please wait..</h5>
							  </div>
							  
								<div class="container text-center" id="submitbtn">
									<button type="submit" class="btn btn-dark">Save Post</button>
								</div>
								
								
							</form>
						</div>
						
					
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	
	
	
	
	<!-- end  add post modal -->