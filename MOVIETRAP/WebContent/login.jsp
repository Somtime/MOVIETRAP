<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- new login.jsp -->
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/movietrap.css" type="text/css" rel="stylesheet"> 
<title>Login</title>
</head>
<body>
<form class="credit-card">
  <div class="container">
	<label for="id"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
    
    <label for="pwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
    
    <button type="submit">Login</button>
    <button onclick="MovietrapServlet?command=join">Register</button>
    <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
 </div>
</form>
</body>
</html>