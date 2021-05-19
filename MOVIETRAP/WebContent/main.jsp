<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="EUC-KR">
<link href="assets/css/main.css" type="text/css" rel="stylesheet"> 
<script src="https://ajax.googleapis.com/ajax/li
bs/jquery/3.5.1/jquery.min.js"></script>
<title>MOVIETRAP</title> 
</head>
<body style="background-color: black;">
	<div id="main_movie">
		<div id="main_movie_trailer" >
		<iframe width="100%" height="100%" src="https://www.youtube.com/embed/kRpkRkO9KUI">
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
			<div id="trend_movie" style="height: 300px; overflow-x:hidden;">
				<img class="thumbnail0" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail1" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail2" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail3" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail4" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail5" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail6" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail7" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail8" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail9" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail10" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail11" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail12" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail13" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail14" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail15" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail16" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail17" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail18" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail19" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail20" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail21" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail22" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail23" src="assets/images/heart.png" style="display: none;">
				<img class="thumbnail24" src="assets/images/heart.png" style="display: none;">
			</div>
			<img id="slideRight" class="arrow" src="assets/images/arrow.png">
		</div>
	</div>
</div>
	
<!-- QNA pop up -->
	<form>
	
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
		<textarea  id ="chat-input" name="item3" cols="30" rows="5"></textarea> 
					
<!-- 				</div> -->
				<div id="chat-submit">
					<input type="submit" value="send">
				</div>

</div>
</div>
		
	</form>

<script type="text/javascript">
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
$(document).ready(function(){
		$.ajax ({
			url : "MOVIETRAPServlet?command=main",
			async : false,
			type : 'get',
			datatype : 'json',
			success : function(result){
				const json =  JSON.parse(result)
				var trend = json["trendData"]
				var pop = json["popData"]
				var video = json["videoData"]
				
				for (var i = 0; i<= Object.keys(trend).length; i++){
					$('.thumbnail' + i).attr('src', 'http://image.tmdb.org/t/p//w200' + trend[Object.keys(trend)[i]]["poster_path"]);
					$('.thumbnail' + i).css('display', 'block');
					console.log("title : " + trend[Object.keys(trend)[i]]["title"])
					console.log("overview : " + trend[Object.keys(trend)[i]]["overview"])
					console.log("vote_average : " + trend[Object.keys(trend)[i]]["vote_average"])
					console.log("poster_path : " + trend[Object.keys(trend)[i]]["poster_path"])
					console.log('http://image.tmdb.org/t/p/original' + trend[Object.keys(trend)[i]]["poster_path"])
				}
			},
			error : function() {
				console.log("ajax : fail")
			}
		});
		
	})
</script>
</body>
</html>