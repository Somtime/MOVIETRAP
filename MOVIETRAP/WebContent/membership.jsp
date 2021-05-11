<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Membership</title>
<script>
function editPay() {
 var url = "MOVIETRAPServlet?command=edit_pay";
  window.open( url, "_blank_1",
 "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=330, height=500");
}
</script>
</head>
<body>
	<div id="user icon">
		<img src="" />
	</div>
Membership
<%-- 	<c:forEach items="${memberInfo} var="MemberVO"> --%>
	<table id="membership">
		<tr>
			<td>
				${MemberVO.email} 
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
<%-- 			${MemberVO.pay_fname}  --%>
<%-- 			${MemberVO.pay_lname}  --%>
			${MemberVO.pay_num} 
			<input style="border: none; pointer-events: none;" type="password" value="${MemberVO.pay_num_lstfour}">			
			${MemberVO.pay_cvc} 
			${MemberVO.pay_date}
			
			next payment date is ...
			</td>		
		<tr>
			<td>
				<button onclick="editPay()">edit payment</button>
			</td>
		</tr>
	</table>
<%-- 	</c:forEach> --%>

Q & A

</body>
</html>

