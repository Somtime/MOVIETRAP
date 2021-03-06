<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="assets/css/main.css" type="text/css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>MOVIETRAP</title>
<style>
a:hover, a:visited, a:link, a:active {
	text-decoration: none;
}

* {
	font-family: oswald;
}
</style>
</head>
<body style="background-color: black;">
	<div class="main_movie_container">
		<div id="main_movie">
			<!-- style="overflow-y: hidden; overflow-x: hidden;" -->
			<div id="main_movie_trailer">
				<iframe id="main_movie_frame" src=""> </iframe>
				<div class="main_movie_info_hover">
					<div class="main_movie_info" style="color: white;">
						<div id="main_button">
							<!-- 							<div id="trailer_playbtn"> -->
							<a id="trailer_playbtn"> <img
								src="assets/images/main-play.png" />
							</a>
							<!-- 														</div> -->
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
	<form name="frm" method="post">
		<c:if test="${loginUser.email == 'admin'}">
			<!-- admin login -->
			<script type="text/javascript">
	        	$.ajax ({
	        		url : "MOVIETRAPServlet?command=admin_chat_list",
	        		type : "get",
	        		datatype : "json",
	        		success : function(result) {
	        			const json = JSON.parse(result)
	        			console.log("admin chat list : success")
	        			console.log(json)
	        			
	        			for(var i = 0; i < json.length; i++) {
        				  document.querySelector('.chat_list').innerHTML += '<div><button type="button" id="qna_list_btn" onclick="admin_qna_list()" class="qna_list_button" value=' + json[i]["cseq"] + '>' + json[i]["id"] + '</button></div><br>';
	        			}
	        		},
	        		error : function() {
	        			console.log("admin chat list : fail")
	        		}
	        	});
	        	
	        	function admin_qna_list() {
	        		var cseq = document.getElementById("qna_list_btn").value;
	        		var user_id = "${sessionScope.loginUser.email}";
	        		
	        		$('#chat_section').empty();
	        		$('#user_name_box').empty();
	        		
	        		$.ajax ({
	        			url : "MOVIETRAPServlet?command=admin_qna_list",
	        			type : "get",
	        			datatype : "json",
	        			data : {
	        				"cseq" : cseq
	        			},
	        			success : function(result) {
	        				const json = JSON.parse(result)
	        				console.log("admin qna list : success")

	        				document.querySelector('#user_name_box').innerHTML += '<div>' + json[0]["send_id"] + '</div>';
	        				document.querySelector('#user_name_box').innerHTML += "<input type='hidden' id='chat_cseq' value='" + json[0]["cseq"] + "' />";
	        				
	        				for (var i = 0; i < json.length; i++) {
	        					if (user_id == json[i]["send_id"]) {
			                        document.querySelector('#chat_section').innerHTML += '<div ' + 'style="float:right;"' + '>' + json[i]["chat_content"] + '</div><br>';
			                    } else {
			                        document.querySelector('#chat_section').innerHTML += '<div ' + 'style="float:left;"' + '>' + json[i]["chat_content"] + '</div><br>';
		                    	}
			                }
	        			},
	        			error : function() {
	        				console.log("admin qna list : fail")
	        			}
	        		});
	        	}
	        </script>
			<div class="chat-box">

				<div class="chat-closed">Chat Now - Admin</div>
				<div class="chat-header hide" style="float: left">
					<div class="box"></div>
					Online Support
				</div>
				<div id="user_name_box" class="chat-header hide"
					style="float: right">
					<div class="box">
						<!-- User Name -->
					</div>
				</div>
				<div class="clear"></div>
				<div class="chat_list hide"></div>
				<div class="chat-content-container hide">
					<div id="chat_section" class="chat-content">
						<!-- ?????? ?????? ?????? -->
					</div>
					<div id="chat_footer">
						<textarea id="chat_content" name="chat_content" cols="25" rows="4"></textarea>
						<input id="chat-submit" class="btn" type="button" name="qna_send"
							value="send">
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</c:if>
		<c:if test="${loginUser.email != 'admin'}">

			<!-- user login -->

			<div class="chat-box">
				<div class="chat-closed">Chat Now</div>
				<div class="chat-header hide">
					<div class="box"></div>
					Online Support
				</div>
				<div class="chat-content-container hide">
					<div id="chat_section" class="chat-content">
						<!-- ?????? ?????? ?????? -->
					</div>
					<div id="chat_footer">
						<textarea id="chat_content" name="chat_content" cols="25" rows="4"></textarea>
						<input id="chat-submit" class="btn" type="button" name="qna_send"
							value="send">
						<div class="clear"></div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
			     // qna_list ajax
			        $.ajax ({
			            url : 'MOVIETRAPServlet?command=qna_list',
			            async : false,
			            type : 'get',
			            datatype : 'json',
			            success : function(result) {
			                const json = JSON.parse(result);
			                var user_id = "${sessionScope.loginUser.email}";
			                document.querySelector('.chat-header').innerHTML += "<input type='hidden' id='chat_cseq' value='0' />";
			             	
			                for (var i = 0; i < json.length; i++) {
			                		
			                    if (user_id == json[i]["send_id"]) {
			                    	document.querySelector('#chat_section').innerHTML += '<div ' + 'style="float:right;"' + '>' + json[i]["chat_content"] + '</div><br>';
			                    } else {
			                        document.querySelector('#chat_section').innerHTML += '<div ' + 'style="float:left;"' + '>' + json[i]["chat_content"] + '</div><br>';
			                    }
			                }
			                
		
			            },
			            error : function() {
			                console.log("qna list : fail")
			            }
			        });
	        </script>

		</c:if>

	</form>

	<script type="text/javascript">
//send data for each movie(thumbnail);
 function moviepage(img){
var id = img.getAttribute('alt'); 		
	var url = "MOVIETRAPServlet?command=moviepage&movieid="+id;
	location.href = url;	  
 
}
 
//qna send ajax
$('#chat-submit').click(function() {
	var chat_content = document.getElementById("chat_content").value;
	var chat_cseq = document.getElementById("chat_cseq").value;
	$.ajax ({
		url : "MOVIETRAPServlet?command=qna_send",
		type : "get",
		async : false,
		datatype : "json",
		data : {
			"chat_content" : chat_content,
			"chat_cseq": chat_cseq
		},
		success : function(result) {
			$("#chat_section").empty();
			$("#chat_content").val("");
            const json = JSON.parse(result);
            var user_id = "${sessionScope.loginUser.email}";
            console.log("user_id : " + user_id)
         	
            for (var i = 0; i < json.length; i++) {
            		
                if (user_id == json[i]["send_id"]) {
                	document.querySelector('#chat_section').innerHTML += '<div ' + 'style="float:right;"' + '>' + json[i]["chat_content"] + '</div><br>';
                } else {
                    document.querySelector('#chat_section').innerHTML += '<div ' + 'style="float:left;"' + '>' + json[i]["chat_content"] + '</div><br>';
                }
            }
            

        
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
        $(".chat-header,.chat-content-container,.chat_list").removeClass("hide");
        $(this).addClass("hide");
    });

    $(".chat-header").on("click",function(e){
        $(".chat-header,.chat-content-container,.chat_list").addClass("hide");
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
				//console.log("trailer_id: " +trailer_id)
				document.querySelector('#trailer_playbtn').href += 'MOVIETRAPServlet?command=moviepage&movieid='+trailer_id;
				
				//main_trailer_detail ??????
				document.querySelector('.main_movie_info').innerHTML += '<div id="main_movie_title">'+ pop[Object.keys(pop)[0]]["title"] +'</div>' +
																		'<div id="main_movie_release_date">'+ pop[Object.keys(pop)[0]]["release_date"] +'</div>' +
																		'<div id="main_movie_description">'+ pop[Object.keys(pop)[0]]["overview"] +'</div>' +
																		'<div id="main_movie_rationgscore"><img src="assets/images/star.png" style="height: 50px; width:50px;"><strong>'+ pop[Object.keys(pop)[0]]["vote_average"] +'</strong> /10 </div>' ;				
				
				// ?????? ????????? src ?????? ?????? ??????????????? ??????
				
				if (trailerkey != null) {				
					//console.log(trailerkey);
					document.getElementById('main_movie_frame').src = "https://youtube.com/embed/" + trailerkey + "?autoplay=1&mute=1";
				}	
				// ?????? ????????? src ?????? ?????? ??????????????? ?????? ??? 
				
				// trend_movie div ?????? ??? ????????? ????????? ??????
				for (var i = 0; i <= Object.keys(trend).length; i++) {
					document.querySelector('#trend_movie').innerHTML += '<div class="container"><img src='+'http://www.themoviedb.org/t/p/w200' + trend[Object.keys(trend)[i]]["poster_path"] +
																		' alt=' + trend[Object.keys(trend)[i]]["id"] +
																		' onclick="moviepage(this)" /></div>';
				}
				// trend_movie div ?????? ??? ????????? ????????? ?????? ???

			},
			error : function() {
				console.log("trend movie : fail")
			}
			
		});
		
}


</script>
</body>
</html>

