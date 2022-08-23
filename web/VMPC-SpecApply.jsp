	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 사양 신청 	
	  // Program Design : Han, Jeong-Hun

// Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	  <%%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
  <header>
   	<div class="wrapper">
   	<h1>주문형 클라우드 pc시스템 - ecit spring boot</h1>
   	<nav>
   		<ul class="menu">
   			<li><a href="VMPC-MemberLogout.jsp"><%=id %>님 로그아웃</a>
   			<li><a href="VMPC-SpecApplyInfo.jsp">신청내역조회</a></li>
   		</ul>
   	</nav>
   	</div>
   </header>
   
<title>Sign-in</title>
<link href="VMPC-UI.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="VMPC-SpecApplyValueCheck.js"></script>
<script type="text/javascript" src="script.js"></script>
<script>
	function select_spec(arg) {
		//alert(arg);
		if (arg=='1') {
			
		} 	
	}
</script>
</head>
<body>
	<form name="specForm" method="post" action="VMPC-SpecApplyProc.jsp">
	<table class="simple_table2" border="0" cellspacing="0" cellpadding="0" width="auto" height="auto" align="center">
	<thead>
	<tr>
		<th colspan="3" ><font color="black">사양 신청</font></th>
	</tr>
	<thead>
	<!-- Def_spec/ctm -->
	<tr>
		<td bgcolor="#ffffff"><span style="color:black">사양 신청</span></td>
		<td bgcolor="#ffffff"><span style="color:black">
			<input type="radio" name="def_spec" value="1" onClick="select_spec(1);">기본</span>
			<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="def_spec" value="2" onClick="select_spec(2);">공유</span><p>
			<span style="color:black">
			<input type="radio" name="def_spec" value="3"  onClick="select_spec(3);" >고급</span>
			<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="def_spec" value="4"  onClick="select_spec(4);">사용자 커스텀</span>
		</td>
		<td bgcolor="#ffffff"><span style="color:black">📦사양을 선택하는 옵션입니다.</span></td>
	</tr>
					
	<!-- SpcUp -->
	<tr>
		<td bgcolor="#ffffff"><span style="color:black">번경 사양 선택</span></td>
		<td bgcolor="#ffffff"><span style="color:black"><input type="radio" name="custom_info" value="1">번경안함</span>
							  <span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_info" value="2">cpu번경</span><p>
							  <span style="color:black"><input type="radio" name="custom_info" value="3">cpu+램 번경</span>
						   	  <span style="color:black"><input type="radio" name="custom_info" value="4">램+저장소 번경</span><p>
							  <span style="color:black"><input type="radio" name="custom_info" value="5">저장소 번경</span>
		</td>
		<td bgcolor="#ffffff"><span style="color:black">🔧사양을 변경합니다</span></td>
	</tr>						
					<!-- Cpu_Up -->	
	<tr>
		<td bgcolor="#ffffff"><span style="color:black">cpu번경</span></td>
		<td bgcolor="#ffffff"><span style="color:black"><input type="radio" name="custom_cpu_info" value="1">기본 옵션</span>
							  <span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_cpu_info" value="2">i3로 변경</span><p>
							  <span style="color:black"><input type="radio" name="custom_cpu_info" value="3">i5로 변경</span>
							  <span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_cpu_info" value="4">i7로 변경</span><p>
							  <span style="color:black"><input type="radio" name="custom_cpu_info" value="5">r3로 변경</span>
							  <span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_cpu_info" value="6">r5로 변경</span><p>
							  <span style="color:black"><Input type="radio" name="custom_cpu_info" value="7">r7로 변경</span>
		</td></span>
		<td bgcolor="#ffffff"><span style="color:black">🧮cpu 사양을 변경합니다.</span></td>
	</tr>
					
					<!-- Ram_Up -->
	<tr>
		<td bgcolor="#ffffff"><span style="color:black">램 번경</span></td>
		<td bgcolor="#ffffff"><span style="color:black">	<input type="radio" name="custom_ram_info" value="1">기본 옵션</span>
							  <span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_ram_info" value="2">램 4g로 변경</span><p>
							  <span style="color:black">	<input type="radio" name="custom_ram_info" value="3">램 8g로 변경</span>
							  <span style="color:black"> <input type="radio" name="custom_ram_info" value="4">램 16g로 변경</span><p>
							  <span style="color:black"><input type="radio" name="custom_ram_info" value="5">램 32g로 변경</span>
		</td>				
		<td bgcolor="#ffffff"><span style="color:black">📀램 사양을 변경합니다.</span></td><p><p>
	</tr>
					
		<!-- Net_Up -->
	<tr>
		<td bgcolor="#ffffff"><span style="color:black">인터넷 사양 번경</span></td>
		<td bgcolor="#ffffff"><span style="color:black"><input type="radio" name="custom_net_info" value="1">기본</span>
							  <span style="color:black"><input type="radio" name="custom_net_info" value="2">고속</span>
		</td>
		<td bgcolor="#ffffff"><span style="color:black">📡인터넷 연결 품질을 선택합니다.</span></td>
	</tr>
	<tr>
		<td colspan="3" bgcolor="#ffffff" align="center">
							 <input type="button"  value="신청사양 보기" onclick="javascript:location.href='VMPC-SpecApplyInfo.jsp'">&nbsp;
							 <input type="reset"   value="다시 신청하기">&nbsp;
							 <input type="button"  value="위 사양을 신청하려면 여기를 클릭하세요." onclick="SpecApplyCheck()"><p>
		</td>
	</tr>
	</table>
	</form>
</body>
</html>