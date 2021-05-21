<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="assets/css/main.css" type="text/css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/li
bs/jquery/3.5.1/jquery.min.js"></script>
<title>MOVIETRAP</title>
</head>
<body style="background-color: black;">
	<div class="main_movie_container">
		<div id="main_movie" > <!-- style="overflow-y: hidden; overflow-x: hidden;" -->
			<div id="main_movie_trailer">
				<iframe id="main_movie_frame" src=""> </iframe> <!-- class="vid" -->
<!-- <iframe id="main_movie_frame" class="vid" width="100%" height="100%" style="overflow-y: hidden; overflow-x: hidden;" src=""> </iframe> -->
				<div class="main_movie_info_hover">
					<div class="main_movie_info">
						<div id="main_movie_title">
							<h1>${title}</h1>
							<h3>${release_date}</h3>
						</div>

						<div id="main_movie_genre">
							<h2>${genres_array}</h2>
						</div>

						<div id="main_movie_description">
							<h2>${overview}</h2>
						</div>

						<div id="main_movie_rationgscore">
							<img src="assets/images/star.png" width="50px" height="50px" />
							${vote_average}
						</div>

						<div id="main_button">
							<a href="MOVIETRAPServlet?command=moviepage&movieid="+id>
							<img src="assets/images/main-play.png" />
							</a>
<!-- 						</div> -->

<!-- 						<div id="main_watch_later"> -->
							<img src="assets/images/main-heart.png" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="thumbnail_slideshow_wrapper">
		<div class="thumbnail_slideshow_row">
			<div id="thumbnail_wrapper">
				<img id="slideLeft" class="arrow" src="assets/images/left_arrow.png">
				<div id="trend_movie"></div>
				<img id="slideRight" class="arrow" src="assets/images/arrow.png">
			</div>
		</div>
	</div>

	<!-- QNA / Chat pop up -->
	<form name="frm" method="post"
		onclick="MOVIETRAPServlet?command=qna_send">
		<div class="chat-box">
			<div class="chat-closed">Chat Now</div>
			<div class="chat-header hide">
				<div class="box"></div>
				Online Support
			</div>
			<div class="chat-content-container hide">
				<div class="chat-content"></div>
				<!-- 	<div id ="chat-input"> -->
				<textarea id="chat_content" name="chat_content" cols="30" rows="5"></textarea>
				<!-- 				</div> -->
				<div id="chat-submit">
					<!-- 		<input type="submit" value="send"> -->
					<input class="btn" type="submit" name="qna_send" value="send">
					<!-- 			onClick="qna_send()" -->
				</div>
			</div>
		</div>
	</form>

	<script type="text/javascript">
//send data for each movie(thumbnail);
 function moviepage(img){
var id = img.getAttribute('alt'); 		
var url = "MOVIETRAPServlet?command=moviepage&movieid="+id;
	console.log(id)
	location.href = url;	  
 
}
//qna send msg
function qna_send() {
var theForm = document.frm;
theForm.action =  "MOVIETRAPServlet?command=qna_send"; 
theForm.submit();
}
//pic slide 
let buttonRight = document.getElementById('slideRight');
let buttonLeft = document.getElementById('slideLeft');

buttonLeft.addEventListener('click', function(){
	document.getElementById('trend_movie').scrollLeft -= 500
})

buttonRight.addEventListener('click', function(){
	document.getElementById('trend_movie').scrollLeft += 500
})

//qna
 $(document).ready(function(){
    $(".chat-closed").on("click",function(e){
        $(".chat-header,.chat-content-container").removeClass("hide");
        $(this).addClass("hide");
    });

    $(".chat-header").on("click",function(e){
        $(".chat-header,.chat-content-container").addClass("hide");
        $(".chat-closed").removeClass("hide");
    });
});
	 
	
//movie info AJAX	
window.onload = function() {
		$.ajax ({
			url : 'MOVIETRAPServlet?command=main',
			async : false,
			type : 'get',
			datatype : 'json',
			success : function(result) {
				const json =  JSON.parse(result)
				var trend = json["trendData"]
				var pop = json["popData"]
				var trailerkey = json["popmoviekey"]
				
				// 메인 동영상 src 인기 영상 트레일러로 변경
				if (trailerkey != null) {
					console.log(trailerkey);
					document.getElementById('main_movie_frame').src = "https://youtube.com/embed/" + trailerkey + "?autoplay=1&mute=1";
				}	
				// 메인 동영상 src 인기 영상 트레일러로 변경 끝 
				
				// trend_movie div 생성 및 포스터 이미지 삽입
				for (var i = 0; i <= Object.keys(trend).length; i++) {
					document.querySelector('#trend_movie').innerHTML += '<div class="container"><img src='+'http://www.themoviedb.org/t/p/w200' + trend[Object.keys(trend)[i]]["poster_path"] +
																		' alt=' + trend[Object.keys(trend)[i]]["id"] +
																		' onclick="moviepage(this)" /></div>';
				}

				// trend_movie div 생성 및 포스터 이미지 삽입 끝
				
				//main_trailer_detail 삽입
					document.querySelector('#movie_title').h1.innerHTML =  pop[Object.keys(pop)[0]]["title"];
					document.querySelector('#movie_title').h3.innerHTML =  pop[Object.keys(pop)[0]]["release_date"];
					document.querySelector('#movie_genre').h2.innerHTML =  pop[Object.keys(pop)[0]]["genre"];
					document.querySelector('#movie_description').h2.innerHTML =  pop[Object.keys(pop)[0]]["overview"];
					document.querySelector('#movie_rationgscore').innerHTML =  pop[Object.keys(pop)[0]]["vote_average"];
			},
			error : function() {
				console.log("ajax : fail")
			}
			
		});
		
}
	
$.ajax ({
	url : 'MOVIETRAPServlet?command=qna_send',
	async : false,
	type : 'get',
	datatype : 'json',
	success : function(result2){
		const json2 =  JSON.parse(result2)
		
		//var x = document.getElementByClassName('chat_content')
		//x[0].innerHTML = json2;

		console.log(result2)
	},
	error : function() {
		console.log("ajax : fail")
	}
});
</script>
</body>
</html>