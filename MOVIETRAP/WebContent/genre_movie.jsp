<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�帣�� ��ȭ ������</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	
	<div id="wrap">
		
		<div id="genre_movie_genre">
			<input type="text" value="Selected Genre">
		</div>
		
		<div id="genre_movie_list">
			
		</div>
			
	</div>	

<script type="text/javascript">

$(document).ready(function(){
	$.ajax ({
		url : 'MOVIETRAPServlet?command=genre_movie',
		async : false,
		type : 'get',
		datatype : 'json',
		success : function(result) {
			const json = JSON.parse(result)
			console.log(json[0]["poster_path"])
			
			for (var i = 0; i < json.length; i++) {
				document.querySelector('#genre_movie_list').innerHTML += '<div><img src='+'http://www.themoviedb.org/t/p/w200' + json[i]["poster_path"] +
																	' alt=' + json[i]["id"] +
																	' onclick="moviepage(this)" /></div>';
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