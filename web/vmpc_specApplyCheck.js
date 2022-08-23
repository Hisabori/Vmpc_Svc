/**
 * 
 */
function specCheck(){
	
	//기본사양 입력체크
	if (document.specForm.def_spec.value=="0"){
		alert("기본 사양을 입력해 주세요");
		document.specForm.def_spec.focus();
		return;
	}
	
	//사양변경 입력체크
	if (document.specForm.custom_info.value=="0"){
		alert("사양 변경 여부를 선택")
		document.specForm.custom_info.focus();
		return;
	}
	
	
	//기본사양 외 커스텀 사양 입략시 알림		
		if(document.specForm.def_spec.value=="1,2,3"){
		if(documtnt.specForm.custom_info.value=="2,3,4,5"){
			alert("선택하신 사양은 사양 변경을 할 수 없습니더");
			document.specForm.def_spec.focus();
			document.custom_info.focus();
			}
		}
		
	document.specForm.summit();
}

