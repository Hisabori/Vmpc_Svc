<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%
  // ---------------------------------------------------------------
  // Program Name	: VPMC 회원정보수정 	
  // Program Design : Han, Jeong-Hun	
  // Program Update : 2021-12-12
// ---------------------------------------------------------------  
%>
<%
//비로그인중 접근시 로그인화면으로 이동
String id = (String)session.getAttribute("idKey");
String name = "";
String gender = "";
String birthday  = "";
String email  = "";
String address = "";
String job = "";
String hobby = "";

if(id == null) {
	response.sendRedirect(request.getContextPath() + "/VMPC-MemberLogin.jsp");
} else {
	//로그인중 접근시 수정화면 출력    
	//회원정보페이지에서 수정버튼 클릭시 보내진 id값 받기    
    request.setCharacterEncoding("euc-kr");
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
    pstmt = conn.prepareStatement("SELECT id,pwd,name,gender,birthday,email,address,hobby,job FROM tblmember WHERE id=?");
    pstmt.setString(1, id);
	//쿼리문 실행    
    rs = pstmt.executeQuery();
	//결과값 사용    
    
	if(rs!=null){
   		
		while(rs.next()){
   			id 			= rs.getString("id");
   			name 		= rs.getString("name");
   			gender 		= rs.getString("gender");
   			birthday	= rs.getString("birthday");
   			email 		= rs.getString("email");
   			address 	= rs.getString("address");
   			hobby 		= rs.getString("hobby");
   			job			= rs.getString("job");
		}
		
		System.out.println("VMPC-MemberInfoUpdate.jsp: [1] id=["+id+"]");
		System.out.println("VMPC-MemberInfoUpdate.jsp: [2] name=["+name+"]");
		System.out.println("VMPC-MemberInfoUpdate.jsp: [3] gender=["+gender+"]");
		System.out.println("VMPC-MemberInfoUpdate.jsp: [4] birthday=["+birthday+"]");
		System.out.println("VMPC-MemberInfoUpdate.jsp: [5] email=["+email+"]");
		System.out.println("VMPC-MemberInfoUpdate.jsp: [6] address=["+address+"]");
		System.out.println("VMPC-MemberInfoUpdate.jsp: [7] hobby=["+hobby+"]");
		System.out.println("VMPC-MemberInfoUpdate.jsp: [8] job=["+job+"]");
	}
	
	
%>
<html>
<head>
<meta charset="EUC-KR">
<title>회원수정 폼</title>
<header>
	<div class="wrapper">
   	<h1>주문형 클라우드 pc시스템</h1>
   	<nav>
   		<ul class="menu">
   			<li><a href="VMPC-MemberLogout.jsp"><%=id %>님 로그아웃</a>
   			<li><a href="VMPC-SpecApplyInfo.jsp">신청내역조회</a></li>
		</ul>
   	</nav>
   	</div>
	</header>
</head>
<link href="VMPC-UI.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="VMPC-MemberApplyCheck.js"></script>
<script>

function initBody() {
	
	var hobby = "<%=hobby%>";
	for (var i=0; i<5; i++) {
		var val = hobby.substr(i,1);
		if (val=='1') {
			document.getElementById("hobby"+i).checked = true;
		}
	}
	
	var job = "<%=job%>";
	for (var j=0; j < 12; j++) {
		if (job == document.getElementById("job").options[j].value) {
			document.getElementById("job").options[j].selected = true;			
		}
	}
	
}	


</script>
<body onload=javascript:initBody();>
<form name="RegFrm" action = "<%=request.getContextPath() %>/VMPC-MemberInfoUpdateProc.jsp" method="post">
<!-- 회원수정완료버튼 클릭시 입력된 데이터들이 post방식으로 memberUpdateAction.jsp로 이동 -->
<table class="simple_table2" border="0" cellspacing="0" cellpadding="0" width="auto" height="auto" align="center">	
	<thead>
		<tr>
			<th scope="cols"><strong><span style="color:black"><b>Sign up</b></span></font></strong></th>
			<th scope="cols"><strong><span style="color:black"><b>아래에 정보를 입력해 주세요.</b></span></strong></th>
			<th scope="cols"><strong><span style="color:black"><b>설명</span></strong></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td bgcolor="#ffffff" width="20%">id</td>
			<td width="50%" bgcolor=#ffffff><%=id%></td>
			<td width="30%" bgcolor=#ffffff></td>
		</tr>
		<tr>
			<td bgcolor=#ffffff>비밀번호</td>
			<td bgcolor=#ffffff><input type="password" name="pwd" size="15"></td>
			<td bgcolor=#ffffff>비밀번호를 입력해 주세요.</td>
		</tr>
		<tr>
			<td bgcolor=#ffffff>비밀번호 중복확인</td>
			<td bgcolor=#ffffff><input type="password" name="repwd" size="15"></td>
			<td bgcolor=#ffffff>입력한 비밀번호가 일치하는지 확인합니다.</td>
		</tr>
		<tr>
			<td bgcolor=#ffffff>성함</td>
			<td bgcolor=#ffffff><%=name%></td>
			<td bgcolor=#ffffff></td>
		</tr>
		<tr>
			<td bgcolor=#ffffff>성별</td>
			<td bgcolor=#ffffff>
				남성<input type="radio" name="gender" value="1" checked> 
				여성<input type="radio" name="gender" value="2">
			</td>
			<td bgcolor=#ffffff>성별을 수정해 주세요.</td>
		</tr>
		<tr>
			<td bgcolor=#ffffff>생년월일</td>
			<td bgcolor=#ffffff><input name="birthday" size="6" value=<%=birthday%>></td>
			<td bgcolor=#ffffff>생년월일을 수정해 주세요.</td>
		</tr>
		<tr>
			<td bgcolor=#ffffff>이메일</td>
			<td bgcolor=#ffffff><input name="email" size="30" value="<%=email%>"></td>
			<td bgcolor=#ffffff>이메일을 수정해 주세요.</td>
		</tr>
		<tr>
			<td bgcolor= #ffffff>주소</td>
			<td bgcolor= #ffffff><input name="address" size="45" value="<%=address%>"></td>
			<td bgcolor= #ffffff>주소를 수정해 주세요.</td>
		</tr>
		<tr>
			<td bgcolor=#ffffff>취미</td>
			<td bgcolor=#ffffff>인터넷<input type="checkbox" name="hobby" id="hobby1" value="internet">
								여행<input type="checkbox" name="hobby" id="hobby2" value="travel">
								게임<input type="checkbox" name="hobby" id="hobby3" value="game"> 
								영화 관람<input type="checkbox" name="hobby" id="hobby4" value="movie"> 
								운동<input type="checkbox" name="hobby" id="hobby5" value="Exercise">
			</td>
			<td bgcolor=#ffffff>취미를 수정해 주세요.</td>
		</tr>					
		<tr>
			<td bgcolor=#ffffff>직업</td>
			<td bgcolor=#ffffff>
				<select name=job id=job>
					<option value="0" selected>선택
					<option value="employee">직장인
					<option value="research profession">연구원
					<option value="student">학생
					<option value="self-employment">사장/1인기업/자영업
					<option value="Official">공인
					<option value="medical personnel">의료인
					<option value="lawyer">법 관련 종사자
					<option value="Religion, Media, Artist">예술가/아티스트
					<option value="Farmer">농부
					<option value="housewife">동거자
					<option value="None">기타
					<option value="Other">
				</select>
			</td>
			<td bgcolor=#ffffff>직업을 선택해 주세요.</td>
		</tr>
	</tbody>
   	</table>
   	<input type="button" value="회원수정완료" onClick="inputCheck('CHG');">  
    </form>
</body>
<%
}
%>
</html>

