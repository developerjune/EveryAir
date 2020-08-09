<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="HTML Study">
		<meta name="keywords" content="HTML,CSS,XML,JavaScript">
		<meta name="author" content="June">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
	</head>
	<body>
		<script>
			if(${status eq '1'}) {
				alert("${message}");
				history.back();
			} else if(${status eq '2'}) {
				alert("${message}");
				history.go(-2);
			} else {
				alert("${message}");
				opener.document.getElementById("phonenumber").value = "${phonenumber}";
				window.close();
			}
		</script>
	</body>
</html>