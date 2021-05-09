<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h2>Selected Genre</h2>
		</div>
		<div>
			<select name="sortby">
				<option value="" selected>sort by</option>
				<option value="">Recent release</option>
				<option value="">Popular</option>
				<option value="">Alphabetical</option>
			</select>
		</div>
		<div id="movielist">
			<div id="movie">			
			</div>
		</div>
	</div>
</body>
</html>