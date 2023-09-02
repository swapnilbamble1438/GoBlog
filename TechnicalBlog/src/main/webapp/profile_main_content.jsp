<!-- main content of the body  -->

	<main>
		<div class="container">
			<div class="row mt-4">
				
				
				<!-- first column -->
				<div class="col-md-4">
					<!-- categories -->
					
					<div class="list-group" >
					
						<div class="highlight">
							
							 	<a  onClick="getPosts(0)" href="#" class="list-group-item list-group-item-action" aria-current="true">
							    All Posts
							  </a>
							 
							 
					  <%
						CategoryDao categoryDao3 = new CategoryDao(ConnectionProvider.getConnection());
						ArrayList<Category> list3 = categoryDao3.getAllCategories();
								
						for(Category c:list3)
						{%>
							
					  			<a onClick="getPosts(<%=c.getCid()%>)" href="#" class="list-group-item list-group-item-action"><%=c.getName() %></a>
					  		
					  		
					  		<script>
								function getPosts(catId)
								{
									console.log(catId);
									var cid = catId;
									 window.location.replace("profile.jsp?cid="+cid);

								}

									
							</script>
					  		
					  <%}%>
		
						</div>
						
					</div>
					
					
	
					
				</div>
				
				<!-- second column -->
				<div class="col-md-8">
					<!-- posts -->
					
					
					<div class="container" >
						<div class="row">
								
								<% 
								String cid = request.getParameter("cid");
								
								 if(cid == null)
								 {
									 cid = "0";
								 }	 
						  		  int catId = Integer.parseInt(cid); 
						  		  
								 
							
									PostDao postDao = new PostDao(ConnectionProvider.getConnection());
									
									List<Post> posts = new ArrayList<>();
									
									// posts = postDao.getAllPosts();
								
									if(catId == 0)
									{
										 posts = postDao.getAllPosts();
									}
									else if(catId > 0 )
									{
										posts = postDao.getPostsByCatId(catId);
									}
									
									if(posts.size() == 0)
									{
										out.println("<b class='display-4 text-center'>No Posts in this Category...</b>");
										
									}
									
									
								   for(Post p: posts)
								   {
										UserDao userDao = new UserDao(ConnectionProvider.getConnection());
							 			User postOfUser =	userDao.getUserById(p.getId());
							 	
										LikesDao ldao = new LikesDao(ConnectionProvider.getConnection());

									   
								%>
								
								
									<div class="col-md-6 mt-2">
										<div class="card">
										<!--  <img class="card-img-top" src="image/<%=p.getImage() %>" alt="<%=p.getTitle()%>" width="30px"> -->
										  <div class="text-center mt-2">
										 	 <img src="image/<%=p.getImage() %>" alt="<%=p.getTitle()%>" class="cov">
										  </div>	
											<div class="card-body">
												<b><%= p.getTitle() %></b>
												<p><%= p.getContent() %></p>
												
											<input type="hidden" id="input" name="input"/>
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
																	
																
																
												<%@include file = "likeworking.jsp" %>												<a href="viewblog.jsp?pid=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
											</div>
										</div>
									</div>
								<%} %>
						</div>
					</div>

				</div>
				
				
				
			</div>
		</div>
	</main>
	
	
	<!-- end of main content -->
	
	