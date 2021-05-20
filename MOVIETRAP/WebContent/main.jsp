<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html >
<head>
<meta charset="EUC-KR">
<link href="assets/css/main.css" type="text/css" rel="stylesheet"> 
<script src="main.js"></script>
<script src="https://ajax.googleapis.com/ajax/li
bs/jquery/3.5.1/jquery.min.js"></script>
<title>MOVIETRAP</title> 
</head>
<body style="background-color: black;">
	<div id="main_movie" style="overflow-y: hidden; overflow-x: hidden;">
		<div id="main_movie_trailer" style="overflow-y: hidden; overflow-x: hidden;">
			<iframe id="main_movie_frame" width="100%" height="100%" style="overflow-y: hidden; overflow-x: hidden;" src="">
			</iframe>
		</div>

		
		<div id="main_movie_info">	
			
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
	</div>
		
<div id="thumbnail_slideshow_wrapper">  
	<div class="thumbnail_slideshow_row">  
		<div id="thumbnail_wrapper" > 
			<img id="slideLeft" class="arrow" src="assets/images/left_arrow.png">
			<div id="trend_movie">
			</div>
			<img id="slideRight" class="arrow" src="assets/images/arrow.png">
		</div>
	</div>
</div>
	
<!-- QNA pop up -->
<form name="frm" method="post">
	
<div class="chat-box">
<div class="chat-closed"> Chat Now </div>
<div class="chat-header hide"><div class="box"></div>Online Support</div>
<div class="chat-content-container hide">

<div class="chat-content">

*<br>
Your chat content...
*<br>

*<br>
Your chat content…
</div>
<!-- 	<div id ="chat-input"> -->
		<textarea  id ="chat_content" name="chat_content" cols="30" rows="5"></textarea> 
					
<!-- 				</div> -->
				<div id="chat-submit">
<!-- 					<input type="submit" value="send"> -->
				<input class="btn" type="button" name="btn_search" value="send" onClick="qna_send()">
					
				</div>

</div>
</div>
		
</form>

<script type="text/javascript">
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
$(document).ready(function(){
		$.ajax ({
			url : 'MOVIETRAPServlet?command=main',
			async : false,
			type : 'get',
			datatype : 'json',
			success : function(result){
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
					document.querySelector('#trend_movie').innerHTML += '<div><img src='+'http://www.themoviedb.org/t/p/w200' + trend[Object.keys(trend)[i]]["poster_path"] +
																		' alt=' + trend[Object.keys(trend)[i]]["id"] +
																		' onclick="moviepage(this)" /></div>';
				}
				// trend_movie div 생성 및 포스터 이미지 삽입 끝
				
			},
			error : function() {
				console.log("ajax : fail")
			}
		});
		
	});
$(document).ready(function(){
	$.ajax ({
		url : 'MOVIETRAPServlet?command=qna_send',
		async : false,
		type : 'get',
		datatype : 'json',
		success : function(result){
			const json =  JSON.parse(result)
			
			${'#chat_content'}.text(json.)
		},
		error : function() {
			console.log("ajax : fail")
		}
	});
	
});	
</script>
</body>
</html>