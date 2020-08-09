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
		<link rel="stylesheet" href="css/admin_header.css" type="text/css" />
		<title>Insert title here</title>
	</head>
	<body>
		<header>
            <p><a href="logout.do">로그아웃</a><a href="main.jsp">홈으로</a></p>
            <div id="main_header">
                <span>EveryAir Admin</span>
            </div>
        </header>
        <nav id="menu_bar">
        <ul>
            <li id="member">
                <span class="dropdown">회원관리</span>
                <div class="dropdown_content" id="member_menu">
                    <a href="adminListMember.do?pageNo=1&table=member&denied=Y">일반 회원 목록</a>
                    <a href="adminListMember.do?pageNo=1&table=member&denied=N">휴면 회원 목록</a>
                </div>
            </li>
            <li id="data">
                <span class="dropdown">컨텐츠 관리</span>
                <div class="dropdown_content" id="data_menu">
                    <a href="admin_add_content.jsp">컨텐츠 등록</a>
                    <a href="adminListContent.do?pageNo=1&table=content&open=Y">공개 컨텐츠 목록</a>
                    <a href="adminListContent.do?pageNo=1&table=content&open=N">비공개 컨텐츠 목록</a>
                </div>
            </li>
            <li id="board">
                <span class="dropdown">게시판 관리</span>
                <div class="dropdown_content" id="board_menu">
                    <a href="admin_write_notice.jsp">공지사항 작성</a>
                    <a href="adminListBoard.do?pageNo=1&table=board">자유 게시판 목록</a>
                    <a href="adminListQnABoard.do?pageNo=1&table=qnaboard">QnA 게시판 목록</a>
                </div>
            </li>
        </ul>
        </nav>
	</body>
</html>