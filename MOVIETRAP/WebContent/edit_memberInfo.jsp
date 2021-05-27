<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/movietrap.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Edit Membership Information</title>
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
<form method="post" class="login_join_form" name="edit_member_info" action="MOVIETRAPServlet?command=update_member_info" enctype="multipart/form-data">
	<div class="container">
	<label for="image"><b>Profile Image</b></label>
	<img name="og_img" style="height:35px; width:35px;" src="assets/images/${memberInfo.image}">
	<input type="file" name="image">
    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="${memberInfo.name}" name="name" required>
    
    <label for="phone"><b>Phone</b></label>
    <input type="text" placeholder="${memberInfo.phone}" name="phone" required>
    
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
	<input type="checkbox" value="y" name="newsletter"/>Notify me with new releases!
    <!-- Buttons -->
    <button type="submit" id="submit">Update</button>    
</div>
</form>

<script type="text/javascript">	
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
        number.≈.add("valid");
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