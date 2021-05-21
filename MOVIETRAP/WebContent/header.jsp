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
		
	        <div class="dropdown">
  <button class="dropbtn">SELECT GENRES</button>
  <div class="dropdown-content">
 <a href="MOVIETRAPServlet?command=genre_movie&genre=28">Action</a> 
			 	<a href="MOVIETRAPServlet?command=genre_movie&genre=12">Adventure </a> 
			 	<a href="MOVIETRAPServlet?command=genre_movie&genre=16">Animation</a>  
			 	<a href="MOVIETRAPServlet?command=genre_movie&genre=35">Comedy</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=80">Crime</a>  
			 	<a href="MOVIETRAPServlet?command=genre_movie&genre=99">Documentary</a> 
			 	<a href="MOVIETRAPServlet?command=genre_movie&genre=18">Drama</a>  
			 	<a href="MOVIETRAPServlet?command=genre_movie&genre=10751">Family</a>  
			 	<a href="MOVIETRAPServlet?command=genre_movie&genre=14">Fantasy</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=36">History</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=27">Horror</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=10402">Music</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=9648">Mystery</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=10749">Romance</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=878">Science Fiction</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=10770">TV Movie</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=53">Thriller</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=10752">War</a>  
				 <a href="MOVIETRAPServlet?command=genre_movie&genre=37">Western</a>  
  </div>
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