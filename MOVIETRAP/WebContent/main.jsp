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

	<div id="main_movie" style="overflow-y: hidden; overflow-x: hidden;">
		<div id="main_movie_trailer"
			style="overflow-y: hidden; overflow-x: hidden;">
			<iframe id="main_movie_frame" width="100%" height="100%"
				style="overflow-y: hidden; overflow-x: hidden;" src=""> </iframe>
				
			<div id="detail_wrapper">
				<div id="main_detail">
					<div id="movie_title">
						<h1>${title}</h1>
						<h3>${release_date}</h3>
					</div>
	
					<div id="movie_genre">
						<h2></h2>
					</div>
	
					<div id="movie_description">
						<h2></h2>
					</div>
	
					<div id="movie_rationgscore">
						<img src="assets/images/star.png" width="50px" height="50px" />
						

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
	<form name="frm" method="post" onclick="MOVIETRAPServlet?command=qna_send">
		<div class="chat-box">
			<div class="chat-closed">Chat Now</div>
			<div class="chat-header hide">
				<div class="box"></div>
				Online Support
			</div>
			<div class="chat-content-container hide">
				<div id="chat_section" class="chat-content">
					<!-- 채팅 내용 위치 -->
				</div>
				<div id="chat_footer">
					<textarea id="chat_content" name="chat_content" cols="25" rows="5"></textarea>
					<input id="chat-submit" class="btn" type="submit" name="qna_send" value="send">
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
	success : function(result) {
		const json = JSON.parse(result);
		var user_id = "${sessionScope.loginUser.email}";
		
		console.log(json[0]["chat_content"]);
		for (var i = 0; i < json.length; i++) {// todo : 왼쪾오른ㄴ쪽 구분할꺼 생각필요
			if (user_id == json[i]["send_id"]) {
				document.querySelector('#chat_section').innerHTML += '<div ' + 'float:right' + '>' + json[i]["chat_content"] + '</div><br>';
			} else {
				document.querySelector('#chat_section').innerHTML += '<div ' + 'float:left' + '>' + json[i]["chat_content"] + '</div><br>';
			}
		}
		
		
	},
	error : function() {
		console.log("ajax : fail")
	}
});
</script>
</body>
</html>