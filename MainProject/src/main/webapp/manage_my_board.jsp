<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="css/manage_my_board.css" type="text/css" />
    </head>
    <body>
        <script>
            function remove() {
                alert("정말 삭제 하시겠습니까?");
            }
        </script>
        <h3>후기 관리</h3>
        <table border="1">
            <tr>
                <th>제목</th>
                <th>조회수</th>
                <th>작성일자</th>
                <th>비고</th>
            </tr>
            <tr>
                <td>제목1</td>
                <td>100</td>
                <td>02-24</td>
                <td><span><input type="button" value="수정"></span><span><input type="button" value="삭제" onclick="remove()"></span></td>
            </tr>
            <tr>
                <td>제목1</td>
                <td>100</td>
                <td>02-24</td>
                <td><span><input type="button" value="수정"></span><span><input type="button" value="삭제" onclick="remove()"></span></td>
            </tr>
            <tr>
                <td>제목1</td>
                <td>100</td>
                <td>02-24</td>
                <td><span><input type="button" value="수정"></span><span><input type="button" value="삭제" onclick="remove()"></span></td>
            </tr>
            <tr>
                <td>제목1</td>
                <td>100</td>
                <td>02-24</td>
                <td><span><input type="button" value="수정"><span></span><input type="button" value="삭제" onclick="remove()"></span></td>
            </tr>
            <tr>
                <td>제목1</td>
                <td>100</td>
                <td>02-24</td>
                <td><span><input type="button" value="수정"></span><span><input type="button" value="삭제" onclick="remove()"></span></td>
            </tr>
        </table>
    </body>
</html>