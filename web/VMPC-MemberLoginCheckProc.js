
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 회원로그인 입력값 체크 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  


/**
 * 
 */
function loginCheck(){
	if(document.loginFrm.id.value==""){
		alert("Error: 아이디를 입력하세요.");
		document.loginFrm.id.focus();
		return;
	}
	if(document.loginFrm.pwd.value==""){
		alert("Error: 비밀번호를 입력하세요.")
		return;
		document.loginFrm.pwd.focus();
	}
	if(document.loginFrm.usr_type.value==""){
		alert("Error: 고객 유형을 선택하세요.")
		return;
	}

	
	document.loginFrm.submit();
}
function win_close(){
	self.close();
}