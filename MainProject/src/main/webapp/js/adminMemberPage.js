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

function resetListPage() {
	location.href="adminListMember.do?pageNo=1&table=member&denied=Y";
}

function resetListDormantPage() {
	location.href="adminListMember.do?pageNo=1&table=member&denied=N";
}

function getParameterByNameforList(name, mode, denied) {
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
    
    location.href = 'adminListMember.do?pageNo=' + no + '&table=member&denied=' + denied;
}

function getParameterByNameforSearchList(name, mode, searchType, keywordType, keyword, denied) {
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
    
    location.href = 'adminListMember.do?pageNo=' + no + '&table=member&searchType=' + searchType + '&keywordType=' + keywordType + '&keyword=' + keyword + '&denied=' + denied;
}
 
 function checkValue() {
	 var id = document.getElementById("search");
 
	 if(id.value == "") {
	 alert("검색어를 입력해주세요.");
	 	return false;
	 }
 }