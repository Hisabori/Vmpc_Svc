<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 신청사양수정 프로세스	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
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
    String def_spec = request.getParameter("def_spec");
    String custom_info = request.getParameter("custom_info");
    String custom_cpu_info = request.getParameter("custom_cpu_info");
    String custom_ram_info = request.getParameter("custom_ram_info");
    String custom_net_info = request.getParameter("custom_net_info");
  
  
//객체참조변수 선언    
    Connection conn = null;
    PreparedStatement pstmt = null;
//DB 드라이버 로딩    
    Class.forName("com.mysql.jdbc.Driver");
//DB 연결, 객체 생성    
    conn = DriverManager.getConnection
("jdbc:mysql://localhost:3306/shuwebpccom_?useUnicode=true&characterEncoding=euckr", "Hisabori", "!McpeMine1!");
//쿼리문 준비, 객체 생성    
    pstmt = conn.prepareStatement("UPDATE vmpc_seq_info SET def_spec=?,custom_info=?,custom_cpu_info=?,custom_ram_info=?, custom_net_info=? WHERE id=?");
    pstmt.setString(1, def_spec);
    pstmt.setString(2, custom_info);
    pstmt.setString(3, custom_cpu_info);
    pstmt.setString(4, custom_ram_info);
    pstmt.setString(5, custom_net_info);
    pstmt.setString(6, id);
   
//쿼리문 실행    
    pstmt.executeUpdate();
//객체 종료    
    pstmt.close();
    conn.close();
//response    
    response.sendRedirect(request.getContextPath() + "/VMPC-SpecApplyInfo.jsp");
}
%>
</body>
</html>
