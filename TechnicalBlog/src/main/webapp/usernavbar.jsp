<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> GoBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp">Posts <span class="sr-only">(current)</span></a>
      </li>
    
      
    
       <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#addpost" href="#"><span class="fa fa-asterisk"></span> Do Post</a>
      </li>
    </ul>
    
    
    <ul class="navbar-nav mr-right">
    	<li class="nav-item">
        	<a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-user-circle"></span> <span><%= user.getName() %></span> </a>
      	</li>
    
    	<li class="nav-item">
        	<a class="nav-link" href="LogoutServlet"><span class="fa fa-address-card-o"></span> Logout</a>
      	</li>
    </ul>
    

  </div>
</nav>