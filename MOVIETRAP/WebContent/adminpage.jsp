<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>



<script type="text/javascript">

$.ajax ({
	url : "MOVIETRAPServlet?command=admin_page",
	async : false,
	type : 'get',
	datatype : 'json',
	success : function(result) {
		const json = JSON.parse(result);
		
		for (var i = 0; i < json.length; i++) {
			for (var j = 0; j < json[i].length; j++) {
				console.log(json[i][j]["cseq"])
				console.log(json[i][j]["send_id"])
				console.log(json[i][j]["rcvd_id"])
				console.log(json[i][j]["chat_content"])
			}
			
		}

	},
	error : function() {
		console.log("ajax : fail")
	}
});
</script>
</body>
</html>