<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="assets/css/main.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>MOVIETRAP</title>
<style>
a:hover, a:visited, a:link, a:active
{  
    text-decoration: none;
}
* {
	font-family: oswald;
}
</style>
</head>
<body style="background-color: black;">
	<div class="main_movie_container">
		<div id="main_movie" > <!-- style="overflow-y: hidden; overflow-x: hidden;" -->
			<div id="main_movie_trailer">
				<iframe id="main_movie_frame" src=""> </iframe> 
				<div class="main_movie_info_hover">
					<div class="main_movie_info" style="color:white;">
						<div id="main_button">
<!-- 							<div id="trailer_playbtn"> -->
							<a id="trailer_playbtn">
							<img src="assets/images/main-play.png" />
							</a>
<!-- 														</div> -->
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
	 <form name="frm" method="post" >
	 	<c:if test="${loginUser.email != admin}">
        	<!-- user login -->
	        <div class="chat-box">
	            <div class="chat-closed">Chat Now</div>
	            <div class="chat-header hide">
	                <div class="box"></div>
	                Online Support
	            </div>
	            <div class="chat-content-container hide">
	                <div id="chat_section" class="chat-content">
	                    <!-- 채팅 내용 위치 -->
	                    <div class="clear"></div>
	                </div>
	                <div id="chat_footer">
	                    <textarea id="chat_content" name="chat_content" cols="25" rows="4"></textarea>
	                    <input id="chat-submit" class="btn" type="button" name="qna_send" value="send" >
	                    <div class="clear"></div>
	                </div>
	            </div>
	        </div>
        </c:if>
        <c:if test="${loginUser.email == admin}">
	        <!-- admin login -->
	         <div class="chat-box">
	            <div class="chat-closed">Chat Now - Admin</div>
	            <div class="chat-header hide">
	                <div class="box"></div>
	                Online Support
	            </div>
	            <div class="chat-content-container hide">
	                <div id="chat_section" class="chat-content">
	                    <!-- 채팅 내용 위치 -->
	                    <div class="clear"></div>
	                </div>
	                <div id="chat_footer">
	                    <textarea id="chat_content" name="chat_content" cols="25" rows="4"></textarea>
	                    <input id="chat-submit" class="btn" type="button" name="qna_send" value="send" >
	                    <div class="clear"></div>
	                </div>
	            </div>
	        </div>
        </c:if>
        
    </form>

<script type="text/javascript">
//send data for each movie(thumbnail);
 function moviepage(img){
var id = img.getAttribute('alt'); 		
	var url = "MOVIETRAPServlet?command=moviepage&movieid="+id;
	console.log(id)
	location.href = url;	  
 
}
 
//qna send ajax
$('#chat-submit').click(function () {
	var chat_content = document.getElementById("chat_content").value;
	$.ajax ({
		url : "MOVIETRAPServlet?command=qna_send",
		type : "get",
		async : false,
		datatype : "json",
		data : {
			"chat_content" : chat_content
		},
		success : function(result) {
			console.log("qna_send() suc")
		},
		error : function() {
			console.log("ajax : fail")
		}
		
	});
	
	
});

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
				var genre = pop[Object.keys(pop)[0]]["genre"]
				var trailer_id = json["trailer_id"]
				
				//main_trailer play button
				console.log("trailer_id: " +trailer_id)
				document.querySelector('#trailer_playbtn').href += 'MOVIETRAPServlet?command=moviepage&movieid='+trailer_id;
				
				//main_trailer_detail 삽입
				document.querySelector('.main_movie_info').innerHTML += '<div id="main_movie_title">'+ pop[Object.keys(pop)[0]]["title"] +'</div>' +
																		'<div id="main_movie_release_date">'+ pop[Object.keys(pop)[0]]["release_date"] +'</div>' +
																		'<div id="main_movie_description">'+ pop[Object.keys(pop)[0]]["overview"] +'</div>' +
																		'<div id="main_movie_rationgscore"><img src="assets/images/star.png" style="height: 50px; width:50px;"><strong>'+ pop[Object.keys(pop)[0]]["vote_average"] +'</strong> /10 </div>' ;				
				
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

			},
			error : function() {
				console.log("ajax : fail")
			}
			
		});
		
}

// qna_list ajax


$.ajax ({
    url : 'MOVIETRAPServlet?command=qna_list',
    async : false,
    type : 'get',
    datatype : 'json',
    success : function(result) {
        const json = JSON.parse(result);
        var user_id = "${sessionScope.loginUser.email}";
        
        for (var i = 0; i < json.length; i++) {
            if (user_id == json[i]["send_id"]) {
                document.querySelector('#chat_section').innerHTML += '<div ' + 'style="float:right;"' + '>' + json[i]["chat_content"] + '</div><br>';
            } else {
                document.querySelector('#chat_section').innerHTML += '<div ' + 'style="float:left;"' + '>' + json[i]["chat_content"] + '</div><br>';
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

