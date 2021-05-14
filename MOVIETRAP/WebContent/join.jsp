<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/movietrap.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Join</title>
<style>
/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

#message p {
  padding: 10px 35px;
  font-size: 1em;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
}
</style>
</head>
<body>
<form method="post" class="login_join_form" name="join_form" action="MOVIETRAPServlet?command=join" >
	<div class="container">
	
    <label for="id"><b>Email</b></label>
    <input type="email" placeholder="Enter Email" id="user_id" name="email" required>
    <div id="id_check"></div>
    
    <input name="newsletter_yn" type="checkbox" value="y"> Notify me with new releases!<br>     
    
    <label for="id"><b>Name</b></label>
    <input type="text" placeholder="Full Name" name="name" required>
    
    <label for="pwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" id="pwd1" required>
    
    <label for="pwd"><b>Re-Enter Password</b></label>
    <input type="password" placeholder="Re-Enter Password" name="pwd" id="pwd2"required>
    <div id="CheckPasswordMatch"></div>
    <div id="message">
	  <h4>Password must contain the following:</h4>
	  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
	  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
	  <p id="number" class="invalid">A <b>number</b></p>
	  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
	</div>
    
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
	
	// ID 중복 확인
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
				
				if (json.idCheck == 1) {
					// 아이디가 중복인 경우
					$('#id_check').text("사용중인 아이디입니다.");
					$("#id_check").css('color', 'red');
					$('#submit').attr('disabled', true);
				} else {
					// 아이디가 중복이 아닌 경우
					$('#id_check').text("사용 가능한 아이디입니다.");
					$("#id_check").css('color', 'green');
				}
			},
			error : function() {
				console.log("아이디 중복체크 실패");	
			}
		});
	});
	
	// 비밀번호 확인
	    function checkPasswordMatch() {
        var password = $("#pwd1").val();
        var confirmPassword = $("#pwd2").val();
        if (password != confirmPassword) {
            $("#CheckPasswordMatch").text("비밀번호가 일치하지 않습니다");
     		$("#CheckPasswordMatch").css('color', 'red');
        }  else {
            $("#CheckPasswordMatch").text("비밀번호가 일치합니다");
 			$("#CheckPasswordMatch").css('color', 'green');
   	 }
	}
    $(document).ready(function () {
       $("#pwd2").keyup(checkPasswordMatch);
    });
    //password validation
    var myInput = document.getElementById("pwd1");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");

    // When the user clicks on the password field, show the message box
    myInput.onfocus = function() {
      document.getElementById("message").style.display = "block";
    }

    // When the user clicks outside of the password field, hide the message box
    myInput.onblur = function() {
      document.getElementById("message").style.display = "none";
    }

    // When the user starts to type something inside the password field
    myInput.onkeyup = function() {
      // Validate lowercase letters
      var lowerCaseLetters = /[a-z]/g;
      if(myInput.value.match(lowerCaseLetters)) {  
        letter.classList.remove("invalid");
        letter.classList.add("valid");
      } else {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
      }
      
      // Validate capital letters
      var upperCaseLetters = /[A-Z]/g;
      if(myInput.value.match(upperCaseLetters)) {  
        capital.classList.remove("invalid");
        capital.classList.add("valid");
      } else {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
      }

      // Validate numbers
      var numbers = /[0-9]/g;
      if(myInput.value.match(numbers)) {  
        number.classList.remove("invalid");
        number.classList.add("valid");
      } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
      }
      
      // Validate length
      if(myInput.value.length >= 8) {
        length.classList.remove("invalid");
        length.classList.add("valid");
      } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
      }
    }
</script>
</body>
</html>