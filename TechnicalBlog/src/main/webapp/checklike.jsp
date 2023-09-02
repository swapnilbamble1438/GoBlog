<script>


$(document).ready(function(){


	const uid = document.getElementById("uid").value;
	const pid = document.getElementById("pid").value;
	const no = document.getElementById("result").innerHTML;

	
	console.log(no);
	
	const urls = "viewblog.jsp?pid="+pid;
	
	  console.log(urls);

		var input = document.getElementById('input');
		input.value=no;
   
	
});


</script>
