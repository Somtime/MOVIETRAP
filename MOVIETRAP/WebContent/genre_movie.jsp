<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장르별 영화 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#genre_movie_list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
#g_movies {
  width: 500px;
  padding: 30px;
}
</style>
</head>
<body>
	<input id="genre" type="hidden" value="${genre_num}">
<!-- 	<div id="wrap"> -->
		
		<div id="genre_movie_genre" style="color:white; margin:20px;" >
			<h1>${selected_genre}</h1>
		</div>
<!-- 		<div id="genre_movie_list_wrapper"> -->
			<div id="genre_movie_list">	
			</div>
<!-- 		</div>	 -->

<script type="text/javascript">

 function genreMovie(img){
	var id = img.getAttribute('alt');
		var url = "MOVIETRAPServlet?command=moviepage&movieid="+id;
		console.log(id)
		location.href = url;	  
	}
	
var genre = $('#genre').val();
console.log(genre);

$(document).ready(function(){
	$.ajax ({
		url : 'MOVIETRAPServlet?command=genre_movie_list',
		async : false,
		type : 'get',
		datatype : 'json',
		data : {
			"genre" : genre
		},
		success : function(result) {
			const json = JSON.parse(result)
			console.log(json[0]["poster_path"])
			
			for (var i = 0; i < json.length; i++) {
				document.querySelector('#genre_movie_list').innerHTML += '<div id="g_movies"><img src='+'http://www.themoviedb.org/t/p/w500' + json[i]["poster_path"] 
																			+' alt='+json[i]["id"]+' onclick=genreMovie(this) /></div>';
			}
			
		},
		error : function() {
			console.log("ajax : fail");
		}
		
	});
		
});

</script>
</body>
</html>