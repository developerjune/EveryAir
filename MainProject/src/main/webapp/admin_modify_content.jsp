<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Document</title>
	    <link rel="stylesheet" href="css/admin_modify_content.css" type="text/css" >
	    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	</head>
	<body>
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<%@include file="admin_header.jsp" %>
		<h3>컨텐츠 수정</h3>
		<div class="content_section">
			<form action="adminModifyContent.do" method="post" onsubmit="return checkBlank()">
				<h3>내용 수정</h3>
				<table>
					<colgroup>
						<col style="width: 154px;">
						<col style="width: auto;">
					</colgroup>
					<tr>
						<th>컨텐츠명</th><td><input type="text" id="name" name="name" value="${dto.name}"/></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" id="address" name="address" value="${dto.address}">
							<input type="button" id="searchButton" value="좌표검색" onclick="getCoordinate()">
						</td>
					</tr>
					<tr>
						<th>좌표</th><td><input type="text" id="coordinate" name="coordinate" value="${dto.coordinate}" readonly></td>
					</tr>
					<tr>
						<th>유선번호</th><td><input type="text" id="name" name="phone" value="${dto.phone}"/></td>
					</tr>
					<tr>
						<th>홈페이지</th><td><input type="text" id="name" name="url" value="${dto.url}"/></td>
					</tr>
					<tr>
						<th>분류</th>
						<td>
							<select id="category" name="category">
								<option value="">선택</option>
								<option value="관광지" id="tour">관광지</option>
								<option value="숙박시설" id="accom">숙박시설</option>
								<option value="맛집" id="restaurant">맛집</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상세설명</th><td><textarea id="description" name="description">${dto.description}</textarea></td>
					</tr>
					<tr>
						<th>공개 여부</th>
						<td>
							<input type="radio" name="open" value="Y" id="Y">공개
							<input type="radio" name="open" value="N" id="N">비공개
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" value="${dto.no}" name="no">
							<input type="submit" value="수정" id="submitButton">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="content_section">
			<form action="adminModifyImage.do" method="post" enctype="multipart/form-data">
				<h3>이미지 수정</h3>
				<table>
					<tr>	
						<th>대표사진</th>
						<td>
							<div class="imageZone" id="imageZone">
								<img class="image" src="image/contents/${dto.thumbnail}">
							</div>
							<div id="thumbnail" class="file_input">
								<label>
							              대표사진 선택
							        <input type="file" onchange="javascript:document.getElementById('file_route').value=this.value" class="inputfile" id="thumbnailImage" name="thumbnail">
							    </label>
							    <input type="text" readonly="readonly" title="File Route" id="file_route" class="file">
						    </div>
						</td>
					</tr>
					<tr>
						<th>이미지 리스트</th>
						<td>
							<c:forEach var="list" items="${list}">
								<div class="imageZone">
									<img class="image" id="image${status.index}" src="image/contents/${list.name}">
									<button type="button" id="${list.name}" class="deleteButton" onclick="removeImage(${list.no}, ${list.contentno}, '${list.name}')"></button>
									<label for="${list.name}"><i class="xi-close-square xi-x"></i></label>
								</div>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>이미지등록</th>
						<td><input type="file" name="files" id="files" class="inputfile" multiple="multiple"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" value="${dto.no}" name="no">
							<input type="submit" value="수정" id="submitButton">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%@include file="include_map.jsp" %>
		<script>getCoordinate()</script>
		<script src="js/adminContentPage.js"></script>
		<script>autoCheck("${dto.category}", "${dto.open}")</script>
	</body>
</html>