<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 회원로그인 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>

<html>
<head>
 
 <header>
   	<div class="wrapper">
   	<h1>주문형 클라우드 pc시스템</h1>
   	</div>
   </header>
 
<title>로그인</title>
<link href="VMPC-UI.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="SpecSummit.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("ID를 입력하세요");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			alert("비밀번호를 입력하세요");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
</head>
<body>
	<div>
		<form name="loginFrm" method="post" action="VMPC-MemberLoginProc.jsp">
			<table>
				<tr>
					<td><span style="color:black"> <h4>로그인</h4></span></td>
				</tr>
			</table>
			<table>
				<tr>
					<td><span style="color:black">ID</span></td>
					<td><input name="id"></td>
				</tr>
				<tr>
					<td><span style="color:black">비밀번호</span></td>
					<td><input type="password" name="pwd"></td>
				</tr>
			</table>
			<table>
			 <tr>
					<td colspan="2">
						<div align="right">
							<input type="button"  value="🔒로그인" onClick="loginCheck()
							"></button>&nbsp;
							<input type="button"  value="🛠회원가입" onClick="javascript:location.href='VMPC-MemberApply.jsp'"></button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>