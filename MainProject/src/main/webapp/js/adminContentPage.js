function checkAll() {
	var mainChk = document.getElementById("mainCheck");
	var chk = document.getElementsByName("noArr");
	for (i = 0; i < chk.length; i++) {
		if (mainChk.checked == true) {
			chk[i].checked = true;
		} else {
			chk[i].checked = false;
		}
	}
}

function autoCheck(category, open) {
	if(category == '관광지') document.getElementById('tour').selected = true;
	else if(category == '숙박시설') document.getElementById('accom').selected = true;
	else document.getElementById('restaurant').selected = true;
	
	if(open == 'Y') document.getElementById('Y').checked = true;
	else document.getElementById('N').checked = true;
}

function resetListPage() {
	location.href="adminListContent.do?pageNo=1&table=content&open=Y";
}

function resetListPrivatePage() {
	location.href="adminListContent.do?pageNo=1&table=content&open=N";
}

function checkBlank() {
	var name = document.getElementById("name");
	var address = document.getElementById("address");
	var coordinate = document.getElementById("coordinate");
	var category = document.getElementById("category");
	var description = document.getElementById("description");
	var searchButton = document.getElementById("searchButton");
	
	if(name.value == "") {
		alert("컨텐츠명을 입력해주세요.");
		name.focus();
		return false;
	} else if(address.value == "") {
		alert("주소를 입력해주세요.");
		address.focus();
		return false;
	} else if(coordinate.value == "") {
		alert("좌표검색으로 좌표를 등록해주세요.");
		searchButton.focus();
		return false;
	} else if(category.value == "") {
		alert("분류를 선택해주세요.");
		category.focus();
		return false;
	} else if(description.value == "") {
		alert("상세설명을 입력해주세요.");
		description.focus();
		return false;
	}
}

function getParameterByNameforList(name, mode, open) {
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
    
    location.href = 'adminListContent.do?pageNo=' + no + '&table=content&open=' + open;
}

function getParameterByNameforSearchList(name, mode, searchType, keywordType, keyword, open) {
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
    
    location.href = 'adminListContent.do?pageNo=' + no + '&table=content&searchType=' + searchType + '&keywordType=' + keywordType + '&keyword=' + keyword + '&open=' + open;
}

function removeImage(no, contentno, filename) {
	if(confirm("사진을 삭제하시겠습니까?") == true)
		location.href="adminRemoveImage.do?no=" + no + "&contentno=" + contentno + "&name=" + filename;
	else
		return false;
}

$('.registfile').on('change', function() {
    ext = $(this).val().split('.').pop().toLowerCase();
    var fileInput = document.getElementsByClassName("registfile");
    var files = fileInput.files;
    
    if(files.length > 8) {
    	alert("이미지는 썸네일 포함 최대 8개까지 등록 가능합니다.");
    	resetFormElement($(this));
    }
    
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg', '']) == -1) {
        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        resetFormElement($(this));
    }
});

$('.inputfile').on('change', function() {
    ext = $(this).val().split('.').pop().toLowerCase();
    var fileInput = document.getElementById("files");
    var files = fileInput.files;
    var registedImageCnt = document.getElementsByClassName("image");
    var thumbnail = "";
    
    if($('#thumbnailImage') != null) thumbnail = $('#thumbnailImage').prop("files")[0];
    
    if(registedImageCnt == null || registedImageCnt == 0)
    	registedImageCnt = 0;
    
    if(files.length + registedImageCnt.length > 8) {
    	alert("이미지는 썸네일 포함 최대 8개까지 등록 가능합니다.");
    	resetFormElement($(this));
    }
    
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg', '']) == -1) {
        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        resetFormElement($(this));
    }
    
    if(thumbnail != null) {
	    blobURL = window.URL.createObjectURL(thumbnail);
	    $('#imageZone img').attr('src', blobURL);
	    $('#imageZone').slideDown();
	    $(this).slideUp();
    }
});
    
function resetFormElement(e) {
    e.wrap('<form>').closest('form').get(0).reset(); 
    e.unwrap();
}

function checkValue() {
	 var id = document.getElementById("search");

	 if(id.value == "") {
	 alert("검색어를 입력해주세요.");
	 	return false;
	 }
}

var img = document.getElementsByTagName("img");

for (var x = 0; x < img.length; x++) {
  img.item(x).onclick=function() {window.open(this.src)}; 
}