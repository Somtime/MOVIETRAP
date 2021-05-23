<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Membership</title>
<style>
* {
	color:white;
}
button {
	background-color: red;
}
</style>
<script>
function editPay() {
 var url = "MOVIETRAPServlet?command=edit_pay";
  window.open( url, "_blank_1",
 "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=400");
}
function editMember() {
	 var url = "MOVIETRAPServlet?command=edit_member";
	  window.open( url, "_blank_1",
	 "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=700");
	}
</script>
</head>
<body>
	<div id="user icon">
		<img src="" />
	</div>
Membership
	<table id="membership">
		<tr>
			<td>
				<c:out value="${memberInfo.email}"/>			
			</td>
			<td>
			<input type="checkbox" onclick="js function">Notify me with new releases!
			</td>   
		</tr>
		<tr>
			<td>
				change password 
			</td> 
		</tr>
		<tr>
			<td>
			<c:out value="${memberInfo.pay_name}"/>			
				<c:out value="${memberInfo.name}"/>		
				<c:out value="${memberInfo.phone}"/>	
				<c:out value="${memberInfo.pay_num_lstfour}"/>		
				<c:out value="${memberInfo.pay_name}"/>		
<%-- 			<input style="border: none; pointer-events: none;" type="password" value="${MemberVO.pay_num_lstfour}">			 --%>
				<c:out value="${memberInfo.newsletter}"/>		

			
			next payment date is ...
			</td>		
		<tr>
			<td>
				<button onclick="editPay()">Edit</button>
				<button onclick="editMember()">Edit</button>
				
			</td>
		</tr>
	</table>
</body>
</html>

