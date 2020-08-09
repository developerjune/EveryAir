<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="대한민국 여행지 추천">
        <meta name="keywords" content="국내여행, 여행지, 추천">
        <meta name="author" content="June">
        <title>EveryAir</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/my_page.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
    </head>
    <body>
        <header id="main_header">
            <div id="logo">
                <a href="before_login_main.jsp"><img src="image/logo2.png" /><span>EveryAir</span></a>
            </div>
            <nav id="main_gnb">
                <ul>
                    <li><a href="view_by_map.jsp">지도로 보기</a></li>
                    <li><a href="view_by_list.jsp">목록으로 보기</a></li>
                    <li><a href="#">코스 추천</a></li>
                    <li><a href="board.jsp">게시판</a></li>
                </ul>
            </nav>
            <nav id="logout_button">
                <ul>
                    <li><a href="before_login_main.jsp">로그아웃</a></li>
                    <li><a href="my_page.jsp"><img src="image/usericon.png"></a></li>
                </ul>
            </nav>
        </header>
        <div id="main_section">
            <aside id="menu">
                <ul>
                    <li><a href="manage_info.jsp" target="my_page">내 정보 관리</a></li>
                </ul>
                <hr>
                <ul>
                    <li><a href="bookmark.jsp" target="my_page">찜 목록</a></li>
                </ul>
                <hr>
                <ul>
                    <li><a href="manage_my_board.jsp" target="my_page">후기 관리</a></li>
                </ul>
                <hr>
                <ul>
                    <li><a href="membership_withdrawal.jsp" target="my_page">회원 탈퇴</a></li>
                </ul>
            </aside>
            <iframe src="bookmark.jsp" id="contents_section" name="my_page"></iframe>
        </div>
        <footer>
            <div id="main_footer">
                <p>상호:준컴퍼니</p>
                <p>대표이사: 안준 | 사업자 등록번호: 123-45-78900</p>
                <p><a href="privacy_policy.jsp">개인정보처리방침</a><a href="terms_and_conditions.jsp">이용약관</a></p>
            </div>
        </footer>
    </body>
</html>