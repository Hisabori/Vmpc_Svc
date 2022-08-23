<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 신청사양 수정 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<%
String def_spec="";
String custom_info="";
String custom_cpu_info="";
String custom_ram_info="";
String custom_net_info="";

String id = (String)session.getAttribute("idKey");
if(id == null) {
	response.sendRedirect(request.getContextPath() + "/VMPC-MemberLogin.jsp");
} else {
	
	
	
//로그인중 접근시 수정화면 출력    
//회원정보페이지에서 수정버튼 클릭시 보내진 id값 받기    
    request.setCharacterEncoding("utf-8");
    String id1 = request.getParameter("id");
//객체참조변수 선언    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
//DB 드라이버 로딩    
    Class.forName("com.mysql.jdbc.Driver");
//DB 연결, 객체생성    
    conn = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/shuwebpccom_?useUnicode=true&characterEncoding=euckr", "Hisabori", "!McpeMine1!");
//쿼리문 준비    
    pstmt = conn.prepareStatement("select def_spec,custom_info,custom_cpu_info,custom_ram_info,custom_net_info FROM vmpc_seq_info WHERE id=?");
    pstmt.setString(1, id);
//쿼리문 실행    
    rs = pstmt.executeQuery();
//결과값 사용    

   
	if(rs!=null){
   		
		while(rs.next()){
   			def_spec 		= rs.getString("def_spec");
   			custom_info 	= rs.getString("custom_info");
   			custom_cpu_info = rs.getString("custom_cpu_info");
   			custom_ram_info = rs.getString("custom_ram_info");
   			custom_net_info = rs.getString("custom_net_info");
		}
		
		System.out.println("VMPC-SpecModify.jsp: [1] def_spec=["+def_spec+"]");
		System.out.println("VMPC-SpecModify.jsp: [2] custom_info=["+custom_info+"]");
		System.out.println("VMPC-SpecModify.jsp: [3] custom_cpu_info=["+custom_cpu_info+"]");
		System.out.println("VMPC-SpecModify.jsp: [4] custom_ram_info=["+custom_ram_info+"]");
		System.out.println("VMPC-SpecModify.jsp: [5] custom_net_info=["+custom_net_info+"]");
	}
%>
<html>
<head>
<meta charset="utf-8">
<title>회원수정 폼</title>
<link href="VMPC-UI.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="VMPC-SpecApplyValueCheck.js"></script>
<script type="text/javascript">

	function initBody() {
		document.getElementById("def_spec<%=def_spec%>").checked = true;
		document.getElementById("custom_info<%=custom_info%>").checked = true;
		document.getElementById("custom_cpu_info<%=custom_cpu_info%>").checked = true;
		document.getElementById("custom_ram_info<%=custom_ram_info%>").checked = true;
		document.getElementById("custom_net_info<%=custom_net_info%>").checked = true;	
	}
</script>
<header>
	<div class="wrapper">
	<h1>주문형 클라우드 pc시스템</h1>
	<nav>
   		<ul class="menu">
   			<li><a href="VMPC-MemberLogout.jsp"><%=id %>님 로그아웃</a>
   			<li><a href="VMPC-MemberInfoUpdate.jsp">고객정보수정</a></li>
   		</ul>
   	</nav>
   	</div>
</header>
</head>
<body onload=javascript:initBody();>
<form name='specForm' action = "<%=request.getContextPath() %>/VMPC-SpecModifyProc.jsp" method="post">
<!-- 회원수정완료버튼 클릭시 입력된 데이터들이 post방식으로 memberUpdateAction.jsp로 이동 -->
	<table class="simple_table2" border="0" cellspacing="0" cellpadding="0" width="flex" height="flex">
		<thead>
		<tr>
			<th><font color="#FFFFFF">사양 신청</font></th>
		</tr>
		</thead>
		<tbody>
					
		<!-- Def_spec/ctm -->
		<tr>
			<td><span style="color:black">사양 신청</span></td>
			<td>
				<span style="color:black">
					<input type="radio" name="def_spec" id='def_spec1' value="1">기본</span>
					<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="def_spec" id='def_spec2' value="2">공유</span><p>
				<span style="color:black">
					<input type="radio" name="def_spec" id='def_spec3' value="3">고급</span>
				<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="def_spec" id='def_spec4' value="4">사용자 커스텀</span>
			</td>
			<td><span style="color:white">📦사양을 선택하는 옵션입니다.</span></td>
		</tr>			
		<!-- SpcUp -->
		<tr>
			<td><span style="color:black">변경 사양 선택</span></td>
			<td>
				<span style="color:black">
					<input type="radio" name="custom_info" id='custom_info1' value="1">변경안함</span>
				<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="custom_info" id='custom_info2' value="2">cpu변경</span><p>
				<span style="color:black">
					<input type="radio" name="custom_info" id='custom_info3' value="3">cpu+램 번경</span>
				<span style="color:black">
					<input type="radio" name="custom_info" id='custom_info4' value="4">램+저장소 번경</span><p>
				<span style="color:black">
					<input type="radio" name="custom_info" id='custom_info5' value="5">저장소 번경</span>
			</td>
			<td><span style="color:black">🔧사양을 변경합니다</span></td>
		</tr>
		<!-- Cpu_Up -->	
		<tr>
			<td><span style="color:black">cpu번경</span></td>
			<td>
  				<span style="color:black"><input type="radio" name="custom_cpu_info" id='custom_cpu_info1' value="1">기본 옵션</span>
				<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_cpu_info" id='custom_cpu_info2' value="2">i3로 변경</span><p>
				<span style="color:black"><input type="radio" name="custom_cpu_info" id='custom_cpu_info3' value="3">i5로 변경</span>
				<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_cpu_info" id='custom_cpu_info4' value="4">i7로 변경</span><p>
				<span style="color:black"><input type="radio" name="custom_cpu_info" id='custom_cpu_info5' value="5">r3로 변경</span>
				<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_cpu_info" id='custom_cpu_info6' value="6">r5로 변경</span><p>
				<span style="color:black"><Input type="radio" name="custom_cpu_info" id= custom_cpu_info7 value="7">r7로 변경</span>
			</td>
			<td><span style="color:black">🧮cpu 사양을 변경합니다.</span></td>
		</tr>
		<!-- Ram_Up -->
		<tr>
			<td><span style="color:black">램 번경</span></td>
			<td><span style="color:black">	<input type="radio" name="custom_ram_info" id='custom_ram_info1' value="1">기본 옵션</span>
				<span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custom_ram_info" id='custom_ram_info2' value="2">램 4g로 변경</span><p>
				<span style="color:black">	<input type="radio" name="custom_ram_info" id=custom_ram_info3 value="3">램 8g로 변경</span>
				<span style="color:black"> <input type="radio" name="custom_ram_info" id=custom_ram_info4 value="4">램 16g로 변경</span><p>
				<span style="color:black"><input type="radio" name="custom_ram_info" id=custom_ram_info5 value="5">램 32g로 변경</span>
			</td>
			<td><span style="color:black">📀램 사양을 변경합니다.</span></td>
		</tr>
		<!-- Net_Up -->
		<tr>
			<td><span style="color:black">인터넷 사양 번경</span></td>
			<td><span style="color:black"><input type="radio" name="custom_net_info" id='custom_net_info1' value="1">기본</span>
				<span style="color:black"><input type="radio" name="custom_net_info" id='custom_net_info2' value="2">고속</span>
			</td>
			<td><span style="color:black">📡인터넷 연결 품질을 선택합니다.</span></td>
		</tr>
		</tbody>
	</table>
	<table >
		<tr>
			<td>
				<input type="reset" value="신청한 사양 초기화">&nbsp;
				<input type="button"  value="사양수정완료" onclick="SpecApplyCheck()"><p>			
			</td>
		</tr>
	</table>
	</form>
<%
}
%>
</body>
</html>
