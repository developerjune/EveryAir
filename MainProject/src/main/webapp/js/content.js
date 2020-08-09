function checkElement() {
	var sidoValue = getParameterByName('sido');
	var sigunguValue = getParameterByName('sigungu');
	var categoryValue = getParameterByName('category');
	
	document.getElementById(sidoValue).checked = "true";
	document.getElementById(sigunguValue).checked = "true";
	
	if(categoryValue == '관광지') document.getElementById("tour").checked = "true";
	else if(categoryValue == '숙박시설') document.getElementById("accommodation").checked = "true";
	else if(categoryValue == '맛집') document.getElementById("restaurant").checked = "true";
	else document.getElementById('allcategory').checked = "true";
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
    
function bookmark(chk) {
    var pic;
    if(chk == 0) {
        pic = "star.png"
    } else {
        pic = "yellowstar.png"
    }
    document.getElementById('bookmark').src = pic;
}

function getParameterByNameforList(name, mode) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    if(results == null) mode = "first";
    result = results == null ? '1' : decodeURIComponent(results[1].replace(/\+/g, " "));
    
    var no = parseInt(result);
    if(mode == 'next') {
    	if(no % 10 == 0) no = no + 1;
    	else if(no % 10 != 0) no = (Math.floor(no / 10) + 1) * 10 + 1;
    } else if(mode == 'prev') {
    	if(no % 10 == 0) no = result - 10;
    	else if(no % 10 != 0) no = Math.floor(no / 10) * 10;
    }
    
    location.href = 'viewByList.do?pageNo=' + no + '&table=content&open=Y';
}

function getParameterByNameforSearchList(name, mode, sido, sigungu, category) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    if(results == null) mode = "first";
    result = results == null ? '1' : decodeURIComponent(results[1].replace(/\+/g, " "));
    
    var no = parseInt(result);
    if(mode == 'next') {
    	if(no % 10 == 0) no = no + 1;
    	else if(no % 10 != 0) no = (Math.floor(no / 10) + 1) * 10 + 1;
    } else if(mode == 'prev') {
    	if(no % 10 == 0) no = result - 10;
    	else if(no % 10 != 0) no = Math.floor(no / 10) * 10;
    }
    
    location.href = 'viewByList.do?pageNo=' + no + '&table=content&sido=' + sido + '&sigungu=' + sigungu + '&category=' + category + '&open=Y&keywordType=address&searchType=contain';
}

var img = document.getElementsByClassName("mainImage");

for (var x = 0; x < img.length; x++) {
  img.item(x).onclick=function() {window.open(this.src)}; 
}
