<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

#qna_btn {
	position: absolute;
	bottom: 5%;
	right: 0;
}

#qna_container {
	display:none;
	margin: 0 auto;
	position: absolute;
	height: 400px;
	width: 250px;
	right: 5%;
	bottom: 5%;
	border: 1px solid black;
}

#qna_header {
	display: inline-block;
	width: 100%;
	margin: 0;
	height: 20%;
	border: 1px solid black;
}

#qna_section {
	display: inline-block;
	width: 100%;
	margin: 0;
	height: 70%;
	border: 1px solid black;
}

#qna_footer {
	display: inline-block;
	width: 100%;
	margin: 0;
	height: 10%;
	border: 1px solid black;
}

#qna_footer_text {
	float: left;
	margin: 0;
	width: 70%;
	height: 100%;
}

#qna_footer_text input[type="text"] {
	width: 100%;
	height: 100%;
	padding: 0;
    border: 0;
}

#qna_footer_submit {
	float: right;
	margin: 0;
	width: 30%;
	height: 100%;
}

#qna_footer_submit input[type="submit"] {
	width: 100%;
	height: 100%;
}


</style>
<script type="text/javascript">
	function qna() {
		
		if (document.getElementById("qna_container").style.display == "none") {
			document.getElementById("qna_container").style.display = "block";
		} else {
			document.getElementById("qna_container").style.display = "none";
		}
		
	}
</script>
<body>
	<form>
	
		<button id="qna_btn" onclick="qna()">
			<input type="text" value="Q&A">
		</button>
	  	
		<div id="qna_container">
		
	  		<div id="qna_header">  
		    <h2>LIVE CHAT</h2>
		   </div>
	    			
			<div id="qna_section">
			   <p>chat content</p>
			</div>
	   			
	      	<div id="qna_footer">
	      		<div id ="qna_footer_text">
					<input type="text" required>
				</div>
				<div id="qna_footer_submit">
					<input type="submit" value="send">
				</div>
			</div>
			
		</div>
		
	</form>
</body>
</html>