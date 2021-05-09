
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/movietrap.css" type="text/css" rel="stylesheet"> 
<title>Join</title>
</head>
<body>
<form class="login_join_form">
	<div class="container">
    <label for="id"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
    <input name="newsletter_yn" type="checkbox" value="y"> Notify me with new releases!<br>     
    
    <label for="id"><b>Name</b></label>
    <input type="text" placeholder="Full Name" name="name" required>
    
    <label for="pwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
    
    <label for="pwd"><b>Re-Enter Password</b></label>
    <input type="password" placeholder="Re-Enter Password" name="pwd" required>
    
    <label for="payment"><b>Payment</b></label>

     <!-- Card Number -->
    <input type="text" placeholder="Card Number Exclude '' - ''" name="pay_num" maxlength="12">
    <input type="text" placeholder="Last Four Digits" name="pay_num_lstfour" maxlength="4">
    
 
    <!-- Date Field -->
   		 <div class="month">
        <select name="Month">
          <option value="january">January</option>
          <option value="february">February</option>
          <option value="march">March</option>
          <option value="april">April</option>
          <option value="may">May</option>
          <option value="june">June</option>
          <option value="july">July</option>
          <option value="august">August</option>
          <option value="september">September</option>
          <option value="october">October</option>
          <option value="november">November</option>
          <option value="december">December</option>
        </select>
       </div>
        
        <div class="year">
        <select name="Year">
          <option value="2021">2021</option>
          <option value="2022">2022</option>
          <option value="2023">2023</option>
          <option value="2024">2024</option>
          <option value="2025">2025</option>
          <option value="2026">2026</option>
          <option value="2027">2027</option>
          <option value="2028">2028</option>          
        </select> 
        </div>
    <!-- Card Verification Field -->

        <input type="text" placeholder="CVV" maxlength="4" name="pay_cvc">
        <p style="font-size: .8rem;">3 or 4 digits usually found on the signature strip</p>
 
    <!-- Buttons -->
    <button type="submit">Register</button>    
</div>
</form>
</body>
</html>