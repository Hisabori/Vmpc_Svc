<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 서비스 로그아웃 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%
      session.invalidate();
%>
<script>
   alert('이용해주셔서 감사합니다.');
   alert('메인 페이지로 이동합니다');
   location.href="VMPC-MemberLogin.jsp";
</script>

