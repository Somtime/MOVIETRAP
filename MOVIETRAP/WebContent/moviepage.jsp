<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
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
</style>
<body>
<div id="movie_trailer">
	<iframe width="100%" height="100" src="https://www.youtube.com/embed/${key}"/>
	</iframe>
</div>
<div style="color:white;">	
	${title}
	${overview}
	${release_date}
	${vote_average}
	${genres_array}	
</div>

</body>
</html>