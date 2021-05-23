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
 			 <select id="genre_select" onchange="selectGenre()">
 			 	 <option value= "" >SelectGenre</option>
				 <option value="28" >Action</option> 
			 	 <option value="12" >Adventure </option> 
			  	 <option value="16" >Animation</option>  
			     <option value="35" >Comedy</option>  
				 <option value="80" >Crime</option>  
			 	 <option value="99" >Documentary</option> 
			 	 <option value="18" >Drama</option>  
			 	 <option value="10751" >Family</option>  
			 	 <option value="14" >Fantasy</option>  
				 <option value="36" >History</option>  
				 <option value="27" >Horror</option>  
				 <option value="10402" >Music</option>  
				 <option value="9648" >Mystery</option>  
				 <option value="10749" >Romance</option>  
				 <option value="878" >Science Fiction</option>  
				 <option value="10770" >TV Movie</option>  
				 <option value="53" >Thriller</option>  
				 <option value="10752" >War</option>  
				 <option value="37" >Western</option>  
			</select>
		<div id="user_icon" onclick="location='MOVIETRAPServlet?command=membership'">
			<img src="assets/images/user.png" />
		</div>
		
		<div id="watch_later">
			<a href="" ></a>
				<img src="assets/images/heart.png" />
		</div>
		
		<div id="set">
			<a href="" ></a>
				<img src="assets/images/set.png" />
		</div>
	</header>
<script>
function selectGenre(){
	  var g = document.getElementById("genre_select");
	  var genre = g.value;
	  var genre_name = g.options[g.selectedIndex].text;
		var url = "MOVIETRAPServlet?command=genre_movie&genre="+genre+"&genre_name="+genre_name;
		console.log(genre)
		location.href = url;	  
	 
	}
</script>
</body>
</html>