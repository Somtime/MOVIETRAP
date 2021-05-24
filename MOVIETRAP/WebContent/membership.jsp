<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Membership</title>
<style>
* {
	color: white;
}

button {
	background-color: red;
}

#membership_page img {
	height: 250px;
	width: 250px;
	margin: 30px;
}

c {
	font-size: 1.05em;
}

#membership_page_wrapper {
	width: 100%;
	display: flex;
	justify-content: center;
	/*   align-items: center; */
}

#membership_page {
	
}

button {
	margin-left: 85%;
}
</style>
<script>
	function editPay() {
		var url = "MOVIETRAPServlet?command=edit_pay";
		window
				.open(url, "_blank_1",
						"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=630");
	}
	function editMember() {
		var url = "MOVIETRAPServlet?command=edit_member";
		window
				.open(url, "_blank_1",
						"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=630");
	}
</script>
</head>
<body>
	<div id="membership_page_wrapper">
		<div id="membership_page">
			<img src="${memberInfo.image}" /> <br>
			<hr>
			<h3>
				<c:out value="${memberInfo.name}" />
			</h3>
			<hr>
			<table>
				<tr>
					<td>EMAIL:</td>
					<td><c:out value="${memberInfo.email}" /></td>
				</tr>
				<tr>
					<td>PHONE:</td>
					<td><c:out value="${memberInfo.phone}" /></td>
				</tr>
				<tr>
					<td>PASSWORD:</td>
					<td>*************</td>
				</tr>
				<tr>
					<td><div id="newsletter" style="display:hidden;"><c:out value="${memberInfo.newsletter}" /></div></td>
					<td><div id="message"></div></td>
				</tr>
			</table>
			<button onclick="editMember()">Edit</button>
			
			<hr>

			<h3>Payment Details</h3>
			<hr>
			<table>
				<tr>
					<td>NAME ON CARD:</td>
					<td><c:out value="${memberInfo.pay_name}" /></td>
				</tr>
				<tr>
					<td> CARD LAST 4-DIGITS: </td>
					<td><c:out value="${memberInfo.pay_num_lstfour}" /></td>
				</tr>
				<tr>
				 	<td>next payment date:</td>
				 	<td>month from ${memberInfo.pay_date}</td>
				</tr>
				</table>
			 <button onclick="editPay()">Edit</button>
	</div>
<script>
var newsletter_yn = document.getElementById("newsletter");

if (newsletter_yn.equals("y")) {
	$("#message").text("Subscribed to our newsletter!");
} else {
	$("#message").text("Not subscribed to the newsletter!")
}
</script>
</body>
</html>

