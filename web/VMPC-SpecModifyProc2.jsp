<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");//object이기에 형변환필수
if(id == null){
	response.sendRedirect("loginForm.jsp");
} 
//2. 드라이브로드 & 디비연결 : 로그인한 사용자의 정보를 가져오기
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);

//3. 데이터처리 : 테이블형식으로 출력
//4. 비밀번호를 입력받은 뒤 수정하기 ->updatePro.jsp에서 진행
%>
<fieldset>
<legend>회원정보수정</legend>
	<form action="updatePro.jsp" method="post" name="fr">
		아이디 <input type="text" name="id" value="<%=mb.getId() %>" readonly><br>
		비밀번호 <input type="password" name="pw" placeholder="비밀번호를 입력하세요" required><br>
		이름 <input type="text" name="name" value="<%=mb.getName() %>"><br>
		나이 <input type="text" name="age" value="<%=mb.getAge() %>"><br>
		성별 
		<input type="radio" name="gender" value="여"
		<% if(mb.getGender().equals("여")){ %>
			checked
		<%}%>
		> 여성
		<input type="radio" name="gender" value="남"
		<% if(mb.getGender().equals("남")){ %>
			checked
		<%}%>
		> 남성<br>
		이메일 <input type="text" name="email" value="<%=mb.getEmail() %>"><br>
		<input type="submit" value="회원정보수정하기">
	</form>
</fieldset>

<button onclick="location.href='main.jsp'">뒤로가기</button>