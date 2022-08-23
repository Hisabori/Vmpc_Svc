<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 회원가입 결과 출력 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="source.MemberMgr"/>
<jsp:useBean id="bean" class="source.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%

		System.out.println(bean.getId());
		boolean result = mgr.insertMember(bean);
		String msg = "회원가입 실패.";
		String location = "VMPC-MemberLogin.jsp";
		if(result){
			msg = "회원가입 성공.";
			location = "VMPC-MemberLogin.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>
