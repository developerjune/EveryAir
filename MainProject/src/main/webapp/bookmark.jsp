<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="css/bookmark.css" type="text/css" />
        <link="stylesheet" type="text/css" href="xeicon/xeicon.min.css">
    </head>
    <body>
        <script>
            function collectiveDeletion() {
                var x = document.getElementsByClassName("content");
                for(var i=0; i<x.length; i++) {
                    x[i].style.display = 'none';
                }
                alert("일괄 삭제를 완료하였습니다.")
            }
            
            function changeOrder() {
                var x = document.getElementsByName("item");
                for(var i=0; i<x.length; i++) {
                    x[i].style.display = 'block';
                }
                document.getElementById("change").style.display = 'none';
                document.getElementById("complete").style.display = 'inline';
                y = document.getElementsByClassName("updown");
                for(var j=0; j<y.length; j++) {
                    y[j].style.display = 'xblock';
                }
            }
            
            function changeComplete() {
                var x = document.getElementsByName("item");
                for(var i=0; i<x.length; i++) {
                    x[i].style.display = 'none';
                }
                document.getElementById("change").style.display = 'inline';
                document.getElementById("complete").style.display = 'none';
                y = document.getElementsByClassName("updown");
                for(var j=0; j<y.length; j++) {
                    y[j].style.display = 'none';
                }
            }
        </script>
        <h3>찜 목록</h3>
        <div class="content">
        <input type="radio" name="item">
            <div>
                <a href="content_detail.jsp"><img src="image/%EC%84%9C%EC%9A%B8%EC%8B%9D%EB%AC%BC%EC%9B%90.png"></a>
                <h3><a href="content_detail.jsp">서울 식물원</a></h3>
                <span>주소: 서울특별시 강서구 마곡동로 161 서울식물원</span><br>
                <span>전화번호: 120</span>
            </div>
        </div>
        <div class="content">
            <input type="radio" name="item">
            <div>
                <a href="content_detail.jsp"><img src="image/hyattseoul1.PNG"></a>
                <h3><a href="content_detail.jsp">하얏트 호텔 서울</a></h3>
                <span>주소: 서울특별시 용산구 소월로 322</span><br>
                <span>전화번호: 02-797-1234</span>
            </div>
        </div>
        <div class="content">
        <input type="radio" name="item">
            <div>
                <a href="content_detail.jsp"><img src="image/rastaurant.PNG"></a>
                <h3><a href="content_detail.jsp">저스틴스테이크</a></h3>
                <span>주소: 서울 용산구 이태원로26길 18</span><br>
                <span>전화번호: 02-790-8783</span>
            </div>
            <div id="button">
                <input type="submit" value="일괄 삭제" onclick="collectiveDeletion()">
                <input type="submit" value="순서 변경" id="change" onclick="changeOrder()">
                <input type="submit" value="변경 완료" id="complete" onclick="changeComplete()">
            </div>
        </div>
    </body>
</html>