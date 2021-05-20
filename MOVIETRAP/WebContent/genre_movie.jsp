<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장르별 영화 페이지</title>
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

$(document).ready(function(
	$.ajax ({
		url : 'MOVIETRAPServlet?command=genre_movie',
		asyn : false,
		type : 'get',
		datatype : 'json',
		succeess : function(result) {
			
		},
		error : function() {
			console.log("ajax : fail");
		}		
		
	});
		
));

</script>
</body>
</html>