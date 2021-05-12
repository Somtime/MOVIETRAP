<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/movietrap.css" type="text/css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Join</title>
</head>
<body>
<form method="post" class="login_join_form">
	<div class="container">
	
    <label for="id"><b>Email</b></label>
    <input type="email" placeholder="Enter Email" id="user_id" name="email" required>
    <div id="id_check"></div>
    
    <input name="newsletter_yn" type="checkbox" value="y"> Notify me with new releases!<br>     
    
    <label for="id"><b>Name</b></label>
    <input type="text" placeholder="Full Name" name="name" required>
    
    <label for="pwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
    
    <label for="pwd"><b>Re-Enter Password</b></label>
    <input type="password" placeholder="Re-Enter Password" name="pwd" required>
    
    <label for="payment"><b>Payment</b></label>
	<label for="id"><b>Name on Card</b></label>
    <input type="text" placeholder="Full Name" name="ay_name" required>
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
    <button type="submit" id="submit">Register</button>    
</div>
</form>

<script type="text/javascript">
	
	$("#user_id").blur(function() {
		var user_id = $('#user_id').val();
		
		$.ajax({
			url : 'MOVIETRAPServlet?command=idcheck',
			async: false,
			type : 'get',
			datatype : 'text',
			data : {
				"email" : user_id
			},
			success : function(result) {
				const json = JSON.parse(result)
				
				console.log("result : " + result)
				console.log("result : " + json.idCheck)
				
				
				if (json.idCheck == 1) {
					// 아이디가 중복인 경우
					$('#id_check').text("사용중인 아이디입니다.");
					$("#id_check").css('color', 'red');
					$('#submit').attr('disabled', true);
				} else {
					$('#id_check').text("사용 가능한 아이디입니다.");
					$("#id_check").css('color', 'blue');
				}
			},
			error : function() {
				console.log("아이디 중복체크 실패");
				
			}
			
		});
		
	});
	
</script>
</body>
</html>