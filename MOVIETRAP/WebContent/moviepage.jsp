<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/li
bs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
body {
	background-color: black;
	
}

iframe {
	width: 100vw;
	height: 100vh;
}

#movie_trailer {
	color: white;
	left: 0;
	top: 0;
}

#detail_wrapper {
	width: 100%;
	height: 100px;
	font-size: 11px;
	color: #fff;
	background: #121212;

}

#movie_rationgscore {
	position: relative;
	font-size: 30px;
}

#movie_description {
	width: 60%;
}


</style>
<body >
	<div id="movie_trailer">
		<iframe src="https://www.youtube.com/embed/${key}?autoplay=1&mute=1"></iframe>
	</div>

	<div id="detail_wrapper" >

		<div id="movie_title">
			<h1>${title}</h1>
			<h3>${release_date}</h3>
		</div>

		<div id="movie_genre">
			<h2>${genres_array}</h2>
		</div>

		<div id="movie_description">
			<h2>${overview}</h2>
		</div>

		<div id="movie_rationgscore">
			<img src="assets/images/star.png" width="50px" height="50px" />
			${vote_average}
		</div>
		
	</div>	
</body>
</html>