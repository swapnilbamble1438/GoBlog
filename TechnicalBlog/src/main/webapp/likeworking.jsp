 <!-- like working  -->
				<script>
	//==========================insert like================================================			
					function doLike(pid,uid)
					{
						const d = {
								uid: uid,
								pid: pid,
								operation: 'like'
						}
						
						var input = document.getElementById('input');
						
						
						$.ajax({
							
							url: "LikesServlet",
							method: "POST",
							data:d,
							success: function (data, textStatus, jqXHR)
							{
								console.log("textStatus: " + textStatus);
								if(textStatus == "success")
									{
										let c = $(".like-counter").html();
										c++;
										$('.like-counter').html(c);
										$('.result').html(1);
										input.value=1;
										window.location.reload();

									}
							},
							error: function (data,textStatus,errorThrown)
							{
								console.log(data);
							}
							
							
						})
						
						
					}
					
					
		//==================delete like===========================================================			
					
					
					function deleteLike(pid,uid)
					{
						const d = {
								uid: uid,
								pid: pid,
								operation: 'deletelike'
						}
						
						var input = document.getElementById('input');

						$.ajax({
							
							url: "LikesServlet",
							method: "POST",
							data:d,
							success: function (data, textStatus, jqXHR)
							{
								console.log("textStatus: " + textStatus);
								if(textStatus == "success")
									{
										let c = $(".like-counter").html();
										c--;
										$('.like-counter').html(c);
										$('.result').html(0);
										input.value=0;
										window.location.reload();
									}
							},
							error: function (data,textStatus,errorThrown)
							{
								console.log(data);
							}
							
							
						})
						
						
					}

				
				
				
				
		
				
				
				
				
				
				
				
				
				
				</script>
				<!-- end like working -->	
					