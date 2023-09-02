$(document).ready(function(){
console.log("loaded....");

$('#add_post').on('submit',function(event){
	
	event.preventDefault();
	
	let form = new FormData(this);
	
	$("#submitbtn").hide();
	$("#loader").show();
	
	// send register servlet:
		
		$.ajax({
			url: "AddPostServlet",
			type: 'POST',
			data: form,
			success: function(data, textStatus, jqXHR)
			{
				console.log("data: "+data.slice(25));
				console.log("textStatus: " + textStatus);
				$("#submitbtn").show();
				$("#loader").hide();
				
				if(textStatus == "success")
				{
				swal("Post Created successfully")
					.then((value)=>{
						window.location="profile.jsp"
					});
				}else
					{
						swal("Something Went wrong, Failed to Create Post")
						.then((value)=>{
							window.location="profile.jsp"
						});
					}
				
			},
			error: function(jqXHR, textStatus, errorThrown)
			{
				console.log(jqXHR);	
				$("#submitbtn").show();
				$("#loader").hide();
				
				swal("Something went wrong.. try again");
			
			},
			processData: false,
			contentType: false
		});
	
});

})