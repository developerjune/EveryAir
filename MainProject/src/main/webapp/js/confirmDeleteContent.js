function removeContentCheck(type, no, pageNo, open) {
	if (type == 'single') {
		if (confirm("삭제하면 복구가 불가합니다. 삭제하시겠습니까?") == true) {
			location.href = "adminRemoveContent.do?no=" + no + "&open=" + open;
		} else {
			return false;
		}
	} else if (type == 'multi' && no == 0) {
		if (confirm("삭제하면 복구가 불가합니다. 삭제하시겠습니까?") == true) {
			var noArr = document.getElementsByName("noArr");
			var checkValue = '';
			var checkCnt = 0;
			var checkLast = '';
			var totalValue = '';

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
			location.href = "adminMultiRemoveContent.do?strNum=" + totalValue + "&open=" + open;
		} else {
			return false;
		}
	}
}
