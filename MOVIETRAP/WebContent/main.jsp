<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="assets/css/main.css" type="text/css" rel="stylesheet"> 
<title>Main</title> 
<script type="text/javascript">
	function qna() {
		
		if (document.getElementById("qna_container").style.display == "none") {
			document.getElementById("qna_container").style.display = "block";
		} else {
			document.getElementById("qna_container").style.display = "none";
		}
		
	}
</script>
</head>
<body>
	<div id="wrap">
	
		<div id="main_movie">
			
			<div id="main_movie_title">
				<input type="text" value="Main Movie Title">
			</div>
			
			<div id="main_movie_description">
				<input type="text" value="description">
			</div>
			
			<div id="main_play_button">
				<input type="button" value="play">
			</div>
			
			<div id="main_watch_later">
				<input type="button" value="play">
			</div>
		</div>
		
		<div id="genre_movie">
			
			<div id="genre_movie_genre">
				<input type="text" value="genre">
			</div>
			
			<div id="genre_movie_thumnail">
				<img src="" />
			</div>
			
		</div>
	
	</div>

<div id="content-wrapper">
	<div class="column">
		<div id="slide-wrapper" >
			<img id="slideLeft" class="arrow" src="assets/images/heart.png">
			<div id="slider">
				<img class="thumbnail active" src="assets/images/heart.png">
				<img class="thumbnail" src="assets/images/logo.png">
				<img class="thumbnail" src="assets/images/logo.png">
				<img class="thumbnail" src="assets/images/logo.png">
				<img class="thumbnail" src="assets/images/logo.png">
				<img class="thumbnail" src="assets/images/logo.png">
				<img class="thumbnail" src="assets/images/logo.png">
			</div>
			<img id="slideRight" class="arrow" src="assets/images/heart.png">
		</div>
	</div>
</div>

<!-- QNA pop up -->
	<form>
	
		<button id="qna_btn" value="Q&A" onclick="qna()"></button>
	  	
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

<script type="text/javascript">
//pic slide 
	let thumbnails = document.getElementsByClassName('thumbnail')

	let activeImages = document.getElementsByClassName('active')

	for (var i=0; i < thumbnails.length; i++){

		thumbnails[i].addEventListener('mouseover', function(){
			console.log(activeImages)
			
			if (activeImages.length > 0){
				activeImages[0].classList.remove('active')
			}
			

			this.classList.add('active')
			document.getElementById('featured').src = this.src
		})
	}


	let buttonRight = document.getElementById('slideRight');
	let buttonLeft = document.getElementById('slideLeft');

	buttonLeft.addEventListener('click', function(){
		document.getElementById('slider').scrollLeft -= 180
	})

	buttonRight.addEventListener('click', function(){
		document.getElementById('slider').scrollLeft += 180
	})
//timer test

</script>
</body>
</html>