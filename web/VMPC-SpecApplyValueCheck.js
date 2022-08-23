
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 사양신청 입력값 체크 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// --------------------------------------------------------------- 

function SpecApplyCheck(){
	
	//if (def_spec.)
	
	var chk_radio1 = document.getElementsByName('def_spec');
	var sel_type1 = null;
	for (var i=0; i<chk_radio1.length;i++) {
		if (chk_radio1[i].checked==true){
			sel_type1=chk_radio1[i].value;
		}
	}
	
	if (sel_type1==null) {
		alert("사양신청을 선택하세요");
		return false;
	}
	
	var chk_radio2 = document.getElementsByName('custom_info');
	var sel_type2 = null;
	for (var i=0; i<chk_radio2.length;i++) {
		if (chk_radio2[i].checked==true){
			sel_type2=chk_radio2[i].value;
		}
	}
	
	if (sel_type2==null) {
		alert("변경할 세부 사양을 입력하세요");
		return false;
	}
	
	var chk_radio3 = document.getElementsByName('custom_cpu_info');
	var sel_type3 = null;
	for (var i=0; i<chk_radio3.length;i++) {
		if (chk_radio3[i].checked==true){
			sel_type3=chk_radio3[i].value;
		}
	}
	
	if (sel_type3==null) {
		alert("변경할 CPU 사양을 입력하세요");
		return false;
	}
	
	var chk_radio4 = document.getElementsByName('custom_ram_info');
	var sel_type4 = null;
	for (var i=0; i<chk_radio4.length;i++) {
		if (chk_radio4[i].checked==true){
			sel_type4=chk_radio4[i].value;
		}
	}
	
	if (sel_type4==null) {
		alert("변경할 램 사양을 입력하세요");
		return false;
	}
	
	
	var chk_radio5 = document.getElementsByName('custom_net_info');
	var sel_type5 = null;
	for (var i=0; i<chk_radio5.length;i++) {
		if (chk_radio5[i].checked==true){
			sel_type5=chk_radio5[i].value;
		}
	}
	
	if (sel_type5==null) {
		alert("변경할 인터넷 사양을 입력하세요");
		return false;
	}
	
    alert('신청완료');
	document.specForm.submit();
}

function win_close(){
	self.close();
}