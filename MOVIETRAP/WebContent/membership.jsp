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
	font-size: 1.05em;
}

button {
	background-color: red;
}

#membership_page img{
    display: block;

    height: 250px;
    width: 250px;
    margin: 30px;
}

#membership_page_wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
 }
#membership_page {
}
</style>
<script>
function editPay() {
 var url = "MOVIETRAPServlet?command=edit_pay";
  window.open( url, "_blank_1",
 "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=500");
}
function editMember() {
	 var url = "MOVIETRAPServlet?command=edit_member";
	  window.open( url, "_blank_1",
	 "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=400");
	}
</script>
</head>
<body>
	<div id="membership_page_wrapper">
		<div id="membership_page">
			<img src="assets/images/user.png" /> <input type="checkbox"
				onclick="js function">Notify me with new releases! <br>

			<c:out value="${memberInfo.email}" /> email<br>
			<c:out value="${memberInfo.pay_name}" /> 	payname <br>
			<c:out value="${memberInfo.name}" />	name<br>
			<c:out value="${memberInfo.phone}" />	phone<br>
			<c:out value="${memberInfo.pay_num_lstfour}" /> last four <br>
			<c:out value="${memberInfo.newsletter}" /> newsletter yes or no<br> next payment date is ...<br>
			<button onclick="editPay()">Edit pay</button>
			<button onclick="editMember()">Edit info</button>
		</div>
	</div>
</body>
</html>

