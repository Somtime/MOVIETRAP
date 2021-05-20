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
			<select>
				<option name="28">Action</option>
				<option name="12">Adventure</option>
				<option name="16">Animation</option>
				<option name="35">Comedy</option>
				<option name="80">Crime</option>
				<option name="99">Documentary</option>
				<option name="18">Drama</option>
				<option name="10751">Family</option>
				<option name="14">Fantasy</option>
				<option name="36">History</option>
				<option name="27">Horror</option>
				<option name="10402">Music</option>
				<option name="9648">Mystery</option>
				<option name="10749">Romance</option>
				<option name="878">Science Fiction</option>
				<option name="10770">Movie</option>
				<option name="53">Thriller</option>
				<option name="10752">War</option>
				<option name="37">Western</option>


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