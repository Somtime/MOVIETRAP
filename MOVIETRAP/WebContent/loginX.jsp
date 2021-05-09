<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/movietrap.css" type="text/css" rel="stylesheet" >      
<style>

/* Change styles for span and cancel button on extra small screens*/ 
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 20%;
  }
}
</style>
</head>
<body>

<h2>Login Form</h2>
<form  class="credit-card" action="MovietrapServlet?command=login" method="post">
    <label for="id"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="pwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
        
    <button type="submit">Login</button>
    <button onclick="MovietrapServlet?command=join">Register</button>
   
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>
</body>
</html>
