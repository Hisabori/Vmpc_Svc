<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 가입시 중복아이디 체크 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="source.MemberMgr" />
<%

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<html>
<head>
<title>아이디 중복 확인</title>
<link href="VMPC-UI.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br/><b><%=id%></b>
		<%
			if (result) {
				out.println("입력하신 아이디는 사용할 수 없습니다.<p/>");
				} else {
				out.println("입력하신 아이디는 사용 가능한 아이디 입니다.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">확인</a>
	</div>
</body>
</html>