<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.qna_footer {
height: 150px;
}
.msg {
	left: 100px;	
}
.qna_container {
    display: flex;
    justify-content: center;
}
/* from w3 */
.padding_chatbox{
	z-index:3;
	display:none;
	padding-top:100px;
	float:center;
	top:0;
/* 	width: 700px; */
	height:100%;
	overflow: hidden;
	background-color: transparent;
	margin:auto;
	background-color:#C8C8C8;
	position:relative;
	outline:0;
	width: 400px;
	height: 450px;
	position:relative;animation:animatebottom 0.4s
}
.modal_content,.w3-hover-shadow:hover{
	box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19)
}
@keyframes animatebottom{
	from{bottom:-300px;opacity:0} to{bottom:0;opacity:1}}
.padding{
	padding:0.01em 16px
}
.padding:after,.padding:before, .qna_color{
	color:#fff!important;
	background-color:#009688!important
}
.qna_bttn:hover{
	color:#000!important;background-color:#ccc!important} /* 1/11 */
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<body>
  <button onclick="document.getElementById('qna').style.display='block'" 
  	class="qna_bttn">LIVE CHAT</button>
  	
	<div class="qna_container">
 		<div id="qna" class="padding_chatbox"> 
      			<header class="padding qna_color"> 
      			  <span onclick="document.getElementById('qna').style.display='none'" 
  				    class="qna_bttn ">&times;</span>  
  				    <h2>LIVE CHAT</h2>
   			   </header>
     			   <p>chat content</p>
            	<form>
    			  	<footer class="qna_footer qna_color padding"> <!-- qna_footer qna_color padding -->
    				<input style="float:center;" type="text" class="msg" name="" style="height:80px; width:400px;"
    				required minlength="1" maxlength="100">
    				  <input type="submit" value="send">
        			</footer> 
      			</form>     
      </div>
      </div>
      <div id="demo">     
      <button type="button" onclick="loadDoc()">Change Content</button>
      </div>

<script>
function loadDoc() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("demo").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "ajax_info.txt", true);
	  xhttp.send();
	}
	
	
</script>
</body>
</html>