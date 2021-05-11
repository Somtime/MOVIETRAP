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
				<option value="genre1">Horror</option>
				<option value="genre2">Romantic Comedy</option>
				<option value="genre3">SF/Fantasy</option>
				<option value="genre4">Thriller</option>
				<option value="genre5">Drama</option>
				<option value="genre6">Documentary</option>
				<option value="genre7">Mystery</option>
				<option value="genre8">Comedy</option>
				<option value="genre9">Action</option>
				<option value="genre10">Animation</option>
				<option value="genre11">Kids</option>
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