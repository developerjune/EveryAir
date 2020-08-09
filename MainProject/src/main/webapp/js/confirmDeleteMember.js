function removeMemberCheck(type, no, pageNo, denied) {
	if (type == 'single') {
		if (confirm("삭제하면 복구가 불가합니다. 삭제하시겠습니까?") == true) {
			location.href = "adminRemoveMember.do?no=" + no + "&denied=" + denied;
		} else {
			return false;
		}
	} else if (type == 'multi' && no == 0) {
		if (confirm("삭제하면 복구가 불가합니다. 삭제하시겠습니까?") == true) {
			var noArr = document.getElementsByName("noArr");
			var checkValue = ''; // 배열에 들어간 값 하나
			var checkCnt = 0; // 체크된 값의 개수
			var checkLast = ''; // 마지막 체크된 값의 인덱스
			var totalValue = ''; // 실제 request로 보내게 될 문자열 변수
			var result = true;

			for (var i = 0; i < noArr.length; i++) {
				if (noArr[i].checked == true) {
					checkCnt++;
					checkLast = i;
				}
			}
			if(checkCnt == 0) {
				alert("선택된 값이 없습니다.");
				return false;
			}

			for (var i = 0; i < noArr.length; i++) {
				if (noArr[i].checked == true) {
					checkValue = noArr[i].value;

					if (checkCnt == 0) {
						totalValue += checkValue;
					} else {
						if (i == checkLast) {
							totalValue += checkValue;
						} else {
							totalValue += checkValue + ",";
						}
					}
					checkValue = '';
				}
			}
			location.href = "adminMultiRemoveMember.do?strNum="+ totalValue + "&denied=" + denied;
		} else {
			return false;
		}
	}
}
