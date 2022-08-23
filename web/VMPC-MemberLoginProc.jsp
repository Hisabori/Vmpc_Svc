<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 회원로그인 프로세스 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="source.MemberMgr"/>
<jsp:useBean id="SpecInfo" class="source.SpecMgr"/>
<%
	  request.setCharacterEncoding("UTF-8");
	  String id = request.getParameter("id");
	  String pwd = request.getParameter("pwd");
	 // String def_spec=request.getParameter("def_spec");
	  //String custom_info=request.getParameter("custom_info");
	  //String custom_cpu_info=request.getParameter("custom_cpu_info");
	  //String custom_ram_info=request.getParameter("custom_ram_info");
	  //String custom_net_info=requ
	  request.getParameter("custom_net_info");  
	  String url ="";
	  boolean result = mMgr.loginMember(id,pwd);
	  //boolean resultSpecInfo = SpecInfo.applySpec(def_spec,custom_info,custom_cpu_info,custom_ram_info,custom_net_info);
	  System.out.println("result:["+result+"]");
	  if(result){
		  
	    session.setAttribute("idKey",id);
	    String testid = (String)session.getAttribute("idKey");
	    
	    String id1 = (String)session.getAttribute("idKey");
		System.out.println("TEST_get_attribute["+session.getAttribute("idKey")+"]");
	    System.out.println("SESSION VALUE:["+testid+"]");
	   // if(resultSpecInfo){
	    //session.setAttribute("def_speckey",def_spec);
	  }
	   
      	  
 
	  //}
%>
<script>
    var result = "<%=result%>";
    var url = "";
    //alert('result:['+result+']');
	if (result=="true") {
		//alert('1');
		url = "VMPC-SpecApplyInfo.jsp";
		msg = "<%=id%>님 환영합니다.";
	} else {
		//alert('2');
		url = "VMPC-MemberLogin.jsp";
		msg = "입력하신 ID 또는 비밀번호를 확인하세요";
	}

		
	alert(msg);
	//alert(url);
	location.href=url;

</script>