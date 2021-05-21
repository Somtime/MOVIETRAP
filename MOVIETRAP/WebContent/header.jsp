<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="assets/css/header.css" type="text/css" rel="stylesheet" >  
<title>Header</title>
<style>
body {
	z-index: 9;
	}
</style>
</head>
<body>
	<header>
		<div id="logo" onclick="location='main.jsp'">
				<img src="assets/images/logo.png" /> 
		</div>
		
		<div id="search">
			<input type="search" placeholder="search">
		</div>
		
		<div id="genre">
			<select name="genre">
			<option value="28"><a href="MOVIETRAPServlet?command=genre_movie&genre=28">Action</a></option>
				<option value="12"><a href="MOVIETRAPServlet?command=genre_movie&genre=12">Adventure</a></option>
				<option value="16"><a href="MOVIETRAPServlet?command=genre_movie&genre=16">Animation</a></option>
				<option value="35"><a href="MOVIETRAPServlet?command=genre_movie&genre=35">Comedy</a></option>
				<option value="80"><a href="MOVIETRAPServlet?command=genre_movie&genre=80">Crime</a></option>
				<option value="99"><a href="MOVIETRAPServlet?command=genre_movie&genre=99">Documentary</a></option>
				<option value="18"><a href="MOVIETRAPServlet?command=genre_movie&genre=18">Drama</a></option>
				<option value="10751"><a href="MOVIETRAPServlet?command=genre_movie&genre=10751">Family</a></option>
				<option value="14"><a href="MOVIETRAPServlet?command=genre_movie&genre=14">Fantasy</a></option>
				<option value="36"><a href="MOVIETRAPServlet?command=genre_movie&genre=36">History</a></option>
				<option value="27"><a href="MOVIETRAPServlet?command=genre_movie&genre=27">Horror</a></option>
				<option value="10402"><a href="MOVIETRAPServlet?command=genre_movie&genre=10402">Music</a></option>
				<option value="9648"><a href="MOVIETRAPServlet?command=genre_movie&genre=9648">Mystery</a></option>
				<option value="10749"><a href="MOVIETRAPServlet?command=genre_movie&genre=10749">Romance</a></option>
				<option value="878"><a href="MOVIETRAPServlet?command=genre_movie&genre=878">Science Fiction</a></option>
				<option value="10770"><a href="MOVIETRAPServlet?command=genre_movie&genre=10770">TV Movie</a></option>
				<option value="53"><a href="MOVIETRAPServlet?command=genre_movie&genre=53">Thriller</a></option>
				<option value="10752"><a href="MOVIETRAPServlet?command=genre_movie&genre=10752">War</a></option>
				<option value="37"><a href="MOVIETRAPServlet?command=genre_movie&genre=37">Western</a></option>


			</select>
		</div>
		
		<div id="user_icon" onclick="location='MOVIETRAPServlet?command=membership'">
			<img src="assets/images/user.png" />
		</div>
		
		<div id="watch_later">
			<a href="">
				<img src="assets/images/heart.png" />
			</a>
		</div>
		
		<div id="set">
			<a href="">
				<img src="assets/images/set.png" />
			</a>
		</div>
	</header>
</body>
</html>