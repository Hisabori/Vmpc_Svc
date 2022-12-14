<%@ page contentType="text/html; charset=UTF-8" %>

<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 회원가입 페이지 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<html>
<head>
<title>회원 가입</title>
<!-- ID체크 -->
<link href="VMPC-UI.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="VMPC-MemberApplyCheck.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		Frm = document.RegFrm;
		if (id == "") {
			alert("Insert your id.");
			Frm.id.focus();
			return;
		}
		url = "VMPC-MemberIdCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}

	 
	
	
</script>
 <header>
	   	<div class="wrapper">
	   	<h1>주문형 클라우드 pc시스템</h1>
	   	<nav>
	   		<ul class="menu">
	   	   		<li><a href="VMPC-MemberLogin.jsp">고객정보수정</a></li>
	   		</ul>
	   	</nav>
	   	</div>
	   </header>
	    
</head>

<!-- ID 중복확인  -->
<body bgcolor="#FFFFCC" onLoad="RegFrm.id.focus()">
	<div align="center">
		<br /><br />
		<form name="RegFrm" method="post" action="VMPC-MemberApplyProc.jsp">
			<table class="simple_table2" cellpadding="5">
				<tr>
							<tr>
								<th colspan="3" ><font color="black"><b>회원 가입</b></font></th>
							</tr>
							<tr>
								<td bgcolor="#ffffff" width="20%">id</td>
								<td width="50%" bgcolor=#ffffff>
									<input name="id" size="15"> 
									<input type="button" value="여기를 눌러 id 중복확인 " onClick="idCheck(this.form.id.value)">
								</td>
								<td width="30%" bgcolor=#ffffff>id를 입력해 주세요</td>
							</tr>
							<tr>
								<td bgcolor=#ffffff>비밀번호</td>
								<td bgcolor=#ffffff><input type="password" name="pwd" size="20"></td>
								<td bgcolor=#ffffff>비밀번호를 입력합니다</td>
							</tr>
							<tr>
								<td bgcolor=#ffffff>비밀번호 재입력</td>
								<td bgcolor=#ffffff><input type="password" name="repwd" size="20"></td>
								<td bgcolor=#ffffff>비밀번호가 일치하는지 확인합니다</td>
							</tr>
							<tr>
								<td bgcolor=#ffffff>이름</td>
								<td bgcolor=#ffffff><input name="name" size="15">
								</td>
								<td bgcolor=#ffffff>고객님의 이름을 적어 주세요.</td>
							</tr>
							<tr>
								<td bgcolor=#ffffff>성별</td>
								<td bgcolor=#ffffff>
									M<input type="radio" name="gender" value="1" checked> 
									F<input type="radio" name="gender" value="2">
								</td>
								<td bgcolor=#ffffff>성별을 입력해 주세요.</td>
							</tr>
							<tr>
								<td bgcolor=#ffffff>생년월일</td>
								<td bgcolor=#ffffff><input name="birthday" size="6">
									ex)830815</td>
								<td bgcolor=#ffffff>생년월일을 입력해 주세요.</td>
							</tr>
							<tr>
								<td bgcolor=#ffffff>Email</td>
								<td bgcolor=#ffffff><input name="email" size="30">
								</td>
								<td bgcolor=#ffffff>이메일을 입력해 주세요</td>
							</tr>
							<tr>
								<td bgcolor= #ffffff>주소</td>
								<td bgcolor= #ffffff><input name="address" size="45"></td>
								<td bgcolor= #ffffff>주소를 입력해 주세요.</td>
							</tr>
							<tr>
								<td bgcolor=#ffffff>취미</td>
								<td bgcolor=#ffffff>인터넷<input type="checkbox" name="hobby" value="Internet">
									여행<input type="checkbox" name="hobby" value="travel"> 게임<input
									type="checkbox" name="hobby" value="game"> 영화 관람<input
									type="checkbox" name="hobby" value="movie"> 운동<input
									type="checkbox" name="hobby" value="Exercise">
								</td>
								<td bgcolor=#ffffff>취미를 입력해 주세요.</td>
							</tr>
							
							<tr>
								   <td bgcolor=#ffffff>직업</td>
								<td bgcolor=#ffffff><select name=job>
										<option value="0" selected>선택
										<option value="직장인">직장인
										<option value="연구원">연구원
										<option value="학생">학생
										<option value="사장/자영업자/1인기업">사장/자영업자/1인기업
										<option value="공인">공인
										<option value="의료계열 종사자">의료계열 종사자
										<option value="법계 종사자">법계 종사자
										<option value="아티스트">아티스트
										<option value="농부">농부
										<option value="배우자">배우자
										<option value="없음">없음
										<option value="기타">
								</select></td>
								<td bgcolor=#ffffff>직업을 선택해 주세요.</td>
							</tr>
							
							<!-- 신청 -->
							<tr bgcolor=#ffffff>
								<td colspan="3" align="center">
								   <input type="button" value="가입" onClick="inputCheck('REG');">
								    &nbsp; &nbsp; 
								    <input type="reset" value="다시 입력">
								    &nbsp; &nbsp; 
								    <input type="button" value="로그인" onClick="javascript:location.href='VMPC-MemberLogin.jsp'">
								 </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>