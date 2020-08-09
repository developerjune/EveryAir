<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>EveryAir</title>
        <link rel="stylesheet" href="css/manage_info.css" type="text/css" />
    </head>
    <body>
        <script>
            function changable(sw) {
                var w = document.getElementById("main_content")
                var x = document.getElementById("button")
                var y = document.getElementById("sub_content")
                var z = document.getElementById("sub_button")
                if(sw == 0) {
                    w.style.display = 'none';
                    x.style.display = 'none';
                    y.style.display = 'block';
                    z.style.display = 'block';
                }
                if(sw == 1) {
                    w.style.display = 'block';
                    x.style.display = 'block';
                    y.style.display = 'none';
                    z.style.display = 'none';
                }
            }
        </script>
        <h3>내 정보 관리</h3>
        <div id="main_content" >
            <p><span>ID</span><input id="id" type="text" value="administrator" disabled="disabled"></p>
            <p><span>PW</span><input id="password" type="password" value="administrator" disabled="disabled"></p>
            <p><span>전화번호</span><input id="phoneNumber" type="text" value="01011112222" disabled="disabled"></p>
            <div id="button">
                <input type="submit" value="수정" onclick="changable(0)">
            </div>
        </div>

        <div id="sub_content">
            <p><span>ID</span><input id="id" type="text" value="administrator" disabled="disabled"></p>
            <p><span>PW</span><input id="password" type="password" value="administrator"></p>
            <p><span>PW 확인</span><input id="password" type="password" ></p>
            <p><span>전화번호</span><input id="phoneNumber" type="text" value="01011112222"></p>
            <div id="sub_button">
                <input type="submit" value="수정완료" onclick="changable(1)">
            </div>
        </div>
    </body>
</html>