<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		<c:choose>
			<c:when test="${url eq 'wrong'}">
				<script>
					alert("${message}");
					history.go(-1);
				</script>
			</c:when>
			<c:when test="${no eq null}">
				<script>
					alert("${message}");
					location.href="${url}";
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("${message}");
					location.href="${url}" + "?no=" + ${no};
				</script>
			</c:otherwise>
		</c:choose>
	</body>
</html>