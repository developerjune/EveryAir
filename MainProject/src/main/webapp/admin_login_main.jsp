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
        <link rel="stylesheet" href="css/after_login_main.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="main_background">
            <div class="mySlides fade">
                <img src="image/1.jpg">
                <p>오래걸리는 여행 플래닝</p>
                <p>이제 <span>EveryAir</span> 가 여러분의 플래닝을 쉽고 편하게</p> 
                <p>만들어드립니다.</p>
            </div>
            <div class="mySlides fade">
                <img src="image/2.jpg">
                <p>오래걸리는 여행 플래닝</p>
                <p>이제 <span>EveryAir</span> 가 여러분의 플래닝을 쉽고 편하게</p> 
                <p>만들어드립니다.</p>
            </div>
            <div class="mySlides fade">
                <img src="image/3.jpg">
                <p>오래걸리는 여행 플래닝</p>
                <p>이제 <span>EveryAir</span> 가 여러분의 플래닝을 쉽고 편하게</p> 
                <p>만들어드립니다.</p>
            </div>
            <div class="mySlides fade">
                <img src="image/4.jpg">
                <p>오래걸리는 여행 플래닝</p>
                <p>이제 <span>EveryAir</span> 가 여러분의 플래닝을 쉽고 편하게</p> 
                <p>만들어드립니다.</p>
            </div>
            <br>
            <div id="dot" style="text-align:center">
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script>
            var slideIndex = 0;
            showSlides();

            function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");

            for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
            }
            slideIndex++;

            if (slideIndex > slides.length) {slideIndex = 1}    
            for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
            }

            slides[slideIndex-1].style.display = "block";  
            dots[slideIndex-1].className += " active";
            setTimeout(showSlides, 5000); // Change image every 2 seconds
            }
        </script>
    </body>
</html>