<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Membership</title>
</head>
<body>
	<div id="user icon">
		<img src="" />
	</div>

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
				<p onclick="editPay()">edit payment</p>
			</td>
		</tr>
	</table>
<%-- 	</c:forEach> --%>
	
</body>
</html>


<script>
function editPay() {
  var url = "MovietrapServlet?command=edit_pay" 
+ document.formm.id.value;
  window.open( url, "_blank_1",
"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=330, height=400");
}
</script>