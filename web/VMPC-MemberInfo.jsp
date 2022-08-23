<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 <%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 회원정보수정 프로세스 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>
 
 <%@ page import = "java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정처리</title>
</head>
<body>
<%
//비로그인중 접근시 로그인화면으로 이동
String id = (String)session.getAttribute("idKey");
if(id == null) {
    response.sendRedirect(request.getContextPath() + "/VMPC-MemberLogin.jsp");
} else {
	
	
	//로그인중 접근시 회원정보수정처리 진행    
//수정화면에 입력된 데이터 받기    
    request.setCharacterEncoding("euc-kr");
    String id1 = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birthday = request.getParameter("birthday");
    String email =  request.getParameter("email");
    String address = request.getParameter("address");
    String hobby = request.getParameter("hobby");
    String job = request.getParameter("job");
  
//객체참조변수 선언    
    Connection conn = null;
    PreparedStatement pstmt = null;
//DB 드라이버 로딩    
    Class.forName("com.mysql.jdbc.Driver");
//DB 연결, 객체 생성    
    conn = DriverManager.getConnection
	("jdbc:mysql://localhost:3306/shuwebpccom_?useUnicode=true&characterEncoding=euckr", "Hisabori", "!McpeMine1!");
//쿼리문 준비, 객체 생성    
    pstmt = conn.prepareStatement("UPDATE tblmember SET id=?,pwd=?,name=?,gender=?, birthday=?, email=?,address=?, hobby=?, job=? WHERE id=?");
    pstmt.setString(1, id);
    pstmt.setString(2, pwd);
    pstmt.setString(3, name);
    pstmt.setString(4, gender);
    pstmt.setString(5, birthday);
    pstmt.setString(6, email);
    pstmt.setString(7, address);
    pstmt.setString(8, id);
    pstmt.setString(9, hobby);
    pstmt.setString(10, job);
//쿼리문 실행    
    pstmt.executeUpdate();
//객체 종료    
    pstmt.close();
    conn.close();
//response    
    response.sendRedirect(request.getContextPath() + "/VMPC-MemberInfo.jsp");
}
%>
</body>
</html>
