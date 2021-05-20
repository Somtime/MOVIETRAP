<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	body{
		background-color: black;
	}
	
	iframe {
		width:100vw;
		height:100vh; 
	}
	#movie_trailer {
		color:white;
	}
	
</style>
<body>
<div id="movie_trailer"  >
	<iframe src="https://www.youtube.com/embed/${key}?autoplay=1&mute=1"></iframe>
</div>

<div style="display:none">	

	<div id="detail_wrapper">
	
		<div id="movie_title">
			<h2>${title}</H2>
		</div>
		
		<div id="movie_genre">
			<h2>${genres_array}</h2>
		</div>
		
		<div id="movie_description">
			<h3>${overview}</h3>
		</div>
		
		<div id="movie_rationgscore" >
			<img src="assets/images/star.png"/>
			<h1>${vote_average}</h1>
		</div>
	</div>	
	

<div style="color:white;">	
	
	
	${release_date}
	
	

</div>

</body>
</html>