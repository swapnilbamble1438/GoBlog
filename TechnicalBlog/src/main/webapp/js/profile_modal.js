$(document).ready(function()
	{
		console.log("first function called")
		
		let editStatus= false;
		
		$('#profile-edit-btn').click(function()
		{
			
			console.log("second function called");
			
			if(editStatus == false)
				{
					$('#profile-details').hide();
					$('#profile-edit').show();
					editStatus = true;
					
					$(this).text("Back");
				}else
				{
					$('#profile-details').show();
					$('#profile-edit').hide();	
					editStatus= false;
					
					$(this).text("Edit");
				}
			
			
			
		});
	});

