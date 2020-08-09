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
		<title>Insert title here</title>
	</head>
	<body>
		<div id="map"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4009667a257720563c477b09e2d86e6&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566667, 126.978417), // 지도의 중심좌표(서울 시청)
			        level: 4 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			//새로고침
			function reloadMap(){
      			$("#map").load(window.location.href + "#map");
			}
			
			// 주소로 좌표를 검색합니다
			function getCoordinate() {
				//reloadMap();
				var addressValue = document.getElementById("address").value;
				var address = addressValue.split(" ").join("");
				document.getElementById("address").value = address;
				geocoder.addressSearch(address, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        document.getElementById("coordinate").value = coords;
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        /*var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:50px;text-align:center;font-size:15px">우리집</div>'
				        });
				        infowindow.open(map, marker);*/
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } else {
				    	alert("주소가 올바르지 않습니다.");
				    }
				});
			}
		</script>
	</body>
</html>