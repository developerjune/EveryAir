<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<meta name="description" content="대한민국 여행지 추천">
			<meta name="keywords" content="국내여행 여행지 추천">
			<meta name="author" content="June">
			<title>EveryAir</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="css/view_by_map.css" type="text/css">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
		</head>
		<body>
		<div id="loading">
    		<img id="loading-image" src="image/ajax-loader.gif" alt="Loading..." />
    	</div>
		<c:choose>
			<c:when test="${sessionScope.id eq null}">
				<script src="js/sessionNull.js"></script>
			</c:when>
			<c:otherwise>
				<%@include file="header.jsp"%>
				<div class="toggleWrap">
					<span id="buttondesc">마커 노출</span>
						<input type="checkbox" id="toggle_alarm" name="" value="" checked="checked"/>
						<div>
							<label for="toggle_alarm">
								<span />
							</label>
						</div>
				</div>
				<div class="map_wrap">
				    <div id="map"></div>
				    <ul id="category">
				    	<a href="viewbymap.do?category=관광지">
				        <li id="BK9" data-order="0">
				            <span id="tour" class="category tour"></span>
				                     관광지
				        </li>
				        </a>
				        <a href="viewbymap.do?category=숙박시설">
				        <li id="MT1" data-order="1"> 
				            <span id="hotel" class="category hotel"></span>
				                      숙박시설
				        </li>
				        </a>
				        <a href="viewbymap.do?category=맛집">
				        <li id="PM9" data-order="2">
				            <span id="restaurant" class="category restaurant"></span>
				                     맛집
				        </li>
				        </a>
				    </ul>
				    <div id="searchForm">
						<form action="viewbymap.do" method="get">
							<input type="hidden" value="${param.category}" name="category">
							<input type="text" placeholder="컨텐츠 검색" name="name"><input type="submit" value="검색"><input type="button" value="초기화" onclick="resetPage()">
						</form>
					</div>
				</div>
				<script>
					if(${param.category eq '관광지'}) {
						document.getElementById("BK9").style.background='#ffe6e6';
					} else if(${param.category eq '숙박시설'}) {
						document.getElementById("MT1").style.background='#ffe6e6';
					} else if(${param.category eq '맛집'}) {
						document.getElementById("PM9").style.background='#ffe6e6';
					}
					
					$(window).on('load', function() {
						$("#loading").hide();
					});
					
					function resetPage() {
						location.href="viewbymap.do";
					}
				</script>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4009667a257720563c477b09e2d86e6"></script>
				<script>
					var markers = []; // 마커 객체 배열
					var imageSrc;
					var clickedOverlay = null;
					if(${key eq null}) {
						var mapContainer = document.getElementById('map'), // 지도가 포시될 div
						mapOption = {
							center : new kakao.maps.LatLng(37.5397629769285, 126.996240829219), // 지도의 중심좌표
							level : 7
						// 지도의 확대 레벨
						};
					} else {
						var mapContainer = document.getElementById('map'), // 지도가 포시될 div
						mapOption = {
							center : new kakao.maps.LatLng(${coordinate}), // 지도의 중심좌표
							level : 7
						// 지도의 확대 레벨
						};
					}
					
	
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
					// 마커를 표시할 위치와 title 객체 배열입니다
					var positions = [
							<c:forEach var="list" items="${list}">
								{
									no : ${list.no},
									title : '${list.name}',
									address : '${list.address}',
									category : '${list.category}',
									thumbnail : '${list.thumbnail}',
									phone : '${list.phone}',
									url : '${list.url}',
									latlng : new kakao.maps.LatLng${list.coordinate}
								},
							</c:forEach>
					];
					
					// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
					function setMarkers(map) {
					    for (var i = 0; i < markers.length; i++) {
					        markers[i].setMap(map);
					    }
					}
	
					// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
					var toggleKey = document.getElementById("toggle_alarm");
					
					toggleKey.addEventListener("click", function() {
						if(toggleKey.checked == true) showMarkers();
						else hideMarkers();
					});
					function showMarkers() {
					    setMarkers(map);
					}
	
					// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
					function hideMarkers() {
					    setMarkers(null);
					}
					
					positions.forEach(function (pos) {
						// 마커 이미지의 이미지 주소입니다
						if(pos.category == '관광지') imageSrc = "image/tourmarker.png";
						if(pos.category == '맛집') imageSrc = "image/restaurantmarker.png";
						if(pos.category == '숙박시설') imageSrc = "image/hotelmarker.png";
						
					    // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new kakao.maps.Size(30, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					    
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					    	map: map, // 마커를 표시할 지도
					        position: pos.latlng, // 마커를 표시할 위치
					        title : pos.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage, // 마커 이미지 
					        clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
						});
					    markers.push(marker);

					 	// content HTMLElement 생성
					    var wrap = document.createElement('div');
					    var info = document.createElement('div');
					    var title = document.createElement('div');
					    var close = document.createElement('div');
					    var aTag = document.createElement('a');
					    var contentTitle = pos.title;
					    aTag.setAttribute('href', 'selectContent.do?no=' + pos.no);
					    aTag.appendChild(document.createTextNode(contentTitle));
					    title.appendChild(aTag);
					    title.appendChild(close);
					    var body = document.createElement('div');
					    var img = document.createElement('div');
					    var imgTag = document.createElement('img');
					    imgTag.setAttribute('src', 'image/contents/' + pos.thumbnail);
					    img.appendChild(imgTag);
					    var desc = document.createElement('div');
					    var ellipsis = document.createElement('div');
					    var address = pos.address;
					    var phone = pos.phone;
					    var url = pos.url;
					    var br = document.createElement('br');
					    ellipsis.appendChild(document.createTextNode(address));
					    ellipsis.appendChild(br);
					    br = document.createElement('br');
					    ellipsis.appendChild(document.createTextNode(phone));
					    ellipsis.appendChild(br);
					    aTag = document.createElement('a');
					    aTag.setAttribute('href', url);
					    aTag.appendChild(document.createTextNode(url));
					    ellipsis.appendChild(aTag);
					    desc.appendChild(ellipsis);
					    body.appendChild(img);
					    body.appendChild(desc);
					    info.appendChild(title);
					    info.appendChild(body);
					    wrap.appendChild(info);
					    
					    wrap.className = "wrap";
					    info.className = "info";
					    title.className = "title";
					    close.className = "close";
					    body.className = "body";
					    img.className = "img";
					    desc.className = "desc";
					    ellipsis.className = "ellipsis";
					    
					    // 닫기 이벤트 추가
					    close.onclick = function() {
					        overlay.setMap(null);
					    };

					    // customoverlay 생성, 이때 map을 선언하지 않으면 지도위에 올라가지 않습니다.
					    var overlay = new daum.maps.CustomOverlay({
					        position: pos.latlng,
					        content: wrap
					    });

					    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
					    kakao.maps.event.addListener(marker, 'click', function() {
					    	if (clickedOverlay) {
					            clickedOverlay.setMap(null);
					        }
					        overlay.setMap(map);
					        clickedOverlay = overlay;
					    });
					});
				</script>
				<%@include file="footer.jsp"%>
			</c:otherwise>
		</c:choose>
	</body>
</html>