
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 회원가입 입력값 체크 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  

function inputCheck(){
	
	//alert("test");
	
	
	if(document.RegFrm.id.value==""){
		alert("Error: 아이디를 입력하세요.");
		document.RegFrm.id.focus();
		return;
	}
	
	if(document.RegFrm.pwd.value==""){
		alert("Error: 비밀번호를 입력하세요.");
		document.RegFrm.pwd.focus();
		return;
	}
	if(document.RegFrm.repwd.value==""){
		alert("Error: 비밀번호를 다시 입력해 주세요");
		document.RegFrm.repwd.focus();
		return;
	}
	if(document.RegFrm.pwd.value != document.RegFrm.repwd.value){
		alert("Error: 비밀번호가 일치하지 않습니다.");
		document.RegFrm.repwd.value="";
		document.RegFrm.repwd.focus();
		return;
	}
	if(document.RegFrm.name.value==""){
		alert("Error: 이름을 입력해 주세요.");
		document.RegFrm.name.focus();
		return;
	}
	if(document.RegFrm.birthday.value==""){
		alert("Error: 생년월일을 입력해 주세요.");
		document.RegFrm.birthday.focus();
		return;
	}
	if(document.RegFrm.email.value==""){
		alert("Error: 이메일을 입력해 주세요.");
		document.RegFrm.email.focus();
		return;
	}
    var str=document.RegFrm.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    	else {
       	  	alert('Error: 이메일 형식이 일치하지 않습니다.\n');
	      	document.RegFrm.email.focus();
		  	return;
   		 }
			if(document.RegFrm.job.value=="0"){
			alert("Error: 직업을 선택하세요");
			document.RegFrm.job.focus();
			return;
	  	 }
			if(document.RegFrm.usr_type.value=='0'){
				alert("Error: 고객 유형을 선택하세요.");

			}

	document.RegFrm.submit();

	}


	function win_close(){
	self.close();
	}