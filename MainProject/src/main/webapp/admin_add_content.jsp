<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Document</title>
	    <link rel="stylesheet" href="css/add_content.css" type="text/css" />
	</head>
	<body>
		<div id="loading">
    		<img id="loading-image" src="image/ajax-loader.gif" alt="Loading..." />
    	</div>
		<%@include file="admin_header.jsp" %>
		<h3>컨텐츠 등록</h3>
		<div id="content_section">
			<form action="adminRegistContent.do" method="post" enctype="multipart/form-data" onsubmit="return checkBlank()">
				<table>
					<colgroup>
						<col style="width: 154px;">
						<col style="width: auto;">
					</colgroup>
					<tr>
						<th>컨텐츠명</th><td><input type="text" id="name" name="name"/></td>
					</tr>
					<tr>
						<th>주소</th><td><input type="text" id="address" name="address"><input type="button" id="searchButton" value="좌표검색" onclick="getCoordinate()"></td>
					</tr>
					<tr>
						<th>좌표</th><td><input type="text" id="coordinate" name="coordinate" readonly></td>
					</tr>
					<tr>
						<th>유선번호</th><td><input type="text" id="phone" name="phone"></td>
					</tr>
					<tr>
						<th>홈페이지</th><td><input type="text" id="url" name="url"></td>
					</tr>
					<tr>
						<th>분류</th>
						<td>
							<select id="category" name="category">
								<option value="">선택</option>
								<option value="관광지">관광지</option>
								<option value="숙박시설">숙박시설</option>
								<option value="맛집">맛집</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상세설명</th><td><textarea id="description" name="description"></textarea></td>
					</tr>
					<tr>
						<th>이미지</th><td><input type="file" name="files" class="registfile" id="files" multiple></td>
					</tr>
					<tr>
						<th>공개 여부</th>
						<td>
							<input type="radio" name="open" value="Y" checked="checked">공개
							<input type="radio" name="open" value="N">비공개
						</td>
					</tr>
				</table>
				<input type="submit" value="등록">
			</form>
		</div>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<%@include file="include_map.jsp" %>
		<script src="js/adminContentPage.js"></script>
		<script>
			$(window).on('load', function() {
				$("#loading").hide();
			});
		</script>
	</body>
</html>