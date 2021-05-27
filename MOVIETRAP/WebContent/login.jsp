<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- new login.jsp -->
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/movietrap.css" type="text/css" rel="stylesheet"> 
<title>Login</title>
<script>
function PwdFunction() {
	  var x = document.getElementById("login_pwd");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
</head>
<body>
<form method="post" action="MOVIETRAPServlet?command=login" name="frm" class="login_join_form">
	<div class="container">
		<label for="id"><b>Email</b></label>
	    <input type="text" placeholder="Enter Email" name="email" required>
	    <label for="pwd"><b>Password</b></label>
	    <input type="password" id="login_pwd" placeholder="Enter Password" name="pwd" required>
	    <input type="checkbox" onclick="PwdFunction()">Show Password
	    <button type="submit" class="button">Login</button>
	    
	       			    <span class="psw">Forgot <a href="#">password?</a><br>
	  	<a href="MOVIETRAPServlet?command=join_form">Sign up</a></span>  
<!--    		<div class="container" style="background-color:#f1f1f1"> -->
   		  
	
<!-- 		</div> -->
	</div>
</form>
</body>
</html>