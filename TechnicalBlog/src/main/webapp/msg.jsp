
<%
		Message msg = (Message)session.getAttribute("msg");
		if(msg != null)
		{%>
							
			<div class="alert <%=msg.getCssclass() %>" role="alert">
				<%= msg.getContent() %>
			</div>
								
		<%}
			session.removeAttribute("msg");
	%>