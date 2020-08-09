<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="대한민국 여행지 추천">
        <meta name="keywords" content="국내여행, 여행지, 추천">
        <meta name="author" content="June">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>EveryAir</title>
        <link rel="stylesheet" href="css/admin_account.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="main_section">
            <aside id="menu">
                <ul>
                    <li><a href="manage_info.jsp" target="my_page">내 정보 관리</a></li>
                </ul>
                
            </aside>
            <iframe src="manage_info.jsp" id="contents_section" name="my_page"></iframe>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>