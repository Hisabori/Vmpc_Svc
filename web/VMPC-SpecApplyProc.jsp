<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 사양신청 프로세스	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="InsertSpec" class="source.SpecMgr"/>
<jsp:useBean id="bean" class="source.SpecBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
	String id = (String)session.getAttribute("idKey");
	System.out.println("SpecProc.jsp>id:["+id+"]");
	boolean result = InsertSpec.InsertSpec(bean, id);
	System.out.println("test11111:["+session.getAttribute("idKey")+"]");
		
	//boolean result = false;
	String SpecApplyMsg = "사양 신청 실패";
	String location = "VMPC-MemberLogin.jsp";
	if(result){	
		SpecApplyMsg="사양 신청 성공";
		location="VMPC-SpecApplyInfo.jsp";	
	}
	
%>
alert("<%=SpecApplyMsg%>");
location.href="<%=location%>";
</script>
