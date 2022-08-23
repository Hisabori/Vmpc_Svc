<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, source.*"%>
<%
	// ---------------------------------------------------------------
	// Program Name		: VPMC 신청사양조회 	
	// Program Design 	: Han, Jeong-Hun	
	// Program Update 	: 2021-12-12
	// ---------------------------------------------------------------  
%>
<%
  	//파라미터
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
	String id_s = (String)session.getAttribute("idKey");
	
	
	//로그인 값을 불러옴
	//public boolean vmpc_apply_info(String id) {
	System.out.println("TEST_get_attribute:1["+id_s+"]");
	System.out.println("TEST_get_attribute:2["+id+"]");
	
	//String url = "login.jsp";
	
	//VM 신청사양 조회를 위한  DB연결 준비
    DBConnectionMgr pool = DBConnectionMgr.getInstance();

  	Connection conn1=null;
  	PreparedStatement pstmt1 = null;
    Statement stmt1 = null;
    ResultSet rs1=null;
	String sql1 = null;
  	Connection conn2=null;
  	PreparedStatement pstmt2 = null;
    Statement stmt2 = null;
    ResultSet rs2=null;
	String sql2 = null;

	boolean flag = false;
    String def_spec="";
    String custom_info="";
    String custom_cpu_info="";
    String custom_ram_info="";
    String custom_net_info="";
    String vmpc_link="";
    String apply_date = "";
    String seq_no = "";
    int return_count = 0;
    
    conn1 = pool.getConnection();
    conn2 = pool.getConnection();

    //DB연결, sql쿼리 실행
    int counter =0;
    try{

    	sql1="";
    	sql1=sql1+"SELECT count(*) as cnt FROM vmpc_seq_info where id=?";
    	
    	System.out.println("SQL1=["+sql1+"]");
    	pstmt1 = conn1.prepareStatement(sql1);
		pstmt1.setString(1, id_s);
		rs1 = pstmt1.executeQuery();
		if(rs1!=null){ 
			rs1.next();
			return_count = rs1.getInt(1);
		}
		
		System.out.println("return_count=["+return_count+"]");
		
		if (return_count > 0)
		{
			
    	sql2="";
    	sql2=sql2+"SELECT SEQ_NO, DATE_FORMAT(APPLY_DATE,'%Y-%m-%d') as apply_date,";
    	sql2=sql2+"(CASE def_spec when '1' then '기본/변경 안함' when '2' then 'cpu변경' when '3' then 'cpu/ram변경' when '4' then '램/저장소 변경' when '5' then '저장소 변경' when 'ERR_001' then 'vm pc가' ELSE '오류-사양 값 입력 오류'  END) def_spec,";
    	sql2=sql2+"(CASE custom_info when '1' then '기본' when '2' then '공유pc' when '4' then '사용자 정의 사양' when '5' then '오류: 본 계정은' ELSE '오류-사양 값 입력 오류' END ) custom_info,";
    	sql2=sql2+"(CASE custom_cpu_info when '1' then '기본' when '2' then 'i3' when '3' then 'i5' when '4' then 'i7' when '5' then 'r3'  when '6' then 'r5' when '7' then 'r7' when 'ERR_001' then '등록되어 있지 않은' ELSE '오류-사양 값 입력 오류' END) custom_cpu_info,";
    	sql2=sql2+"(CASE custom_ram_info  when '1' then '기본' when '2' then '+4g' when '3' then '+8g' when '4' then '+16g'  when '5' then '+32g' when 'ERR_001' then '계정입니다.'  ELSE '오류-사양 값 입력 오류' END) custom_ram_info,";
    	sql2=sql2+"(CASE custom_net_info  when '1' then '기본' when '2' then '고속' when 'ERR_001' then '(SQL ERROR_001: vm_not_found)'  ELSE '오류-사양 값 입력 오류' END) custom_net_info, IFNULL(vmpc_link,' ') as vmpc_link ";
    	sql2=sql2+"FROM vmpc_seq_info where id=?";
    	
    	System.out.println("SQL2=["+sql2+"]");
    	pstmt2 = conn2.prepareStatement(sql2);
		pstmt2.setString(1, id_s);
		rs2 = pstmt2.executeQuery();
		
		}
		
        
%>
<html>
	<header>
   		<div class="wrapper">
   		<h1>주문형 클라우드 pc시스템</h1>
   			<nav>
   				<ul class="menu">
   					<li><a href="VMPC-MemberLogout.jsp"><%=id_s %>님 로그아웃</a>
   					<li><a href="VMPC-MemberInfoUpdate.jsp">고객정보수정</a></li>
   				</ul>
   			</nav>
   		</div>
	</header>
	<head>
		<style>
   			@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville&display=swap');
   		</style>

	<!-- 신청사양 삭제 -->
	 <script>
		function fun_delete(seq_no) {
		//alert('delete!!:'+seq_no);
			if (confirm("신청하신 내역에 대하여 삭제하시겠습니다.\n삭제시 복구가 불가합니다.")) { 
				/// alert('yes'); 
				} else { alert('삭제요청이 취소되었습니다.'); };

					location.href='VMPC-SpecDelete.jsp?seq_no='+seq_no;
				}

		function fun_change(seq_no) {
			//alert('change!!:'+seq_no);
					location.href='VMPC-SpecModify.jsp?seq_no='+seq_no;
				}
	 </script>


	<!-- 신청사양을 테이블에 출력 -->
    <link href="VMPC-UI.css" rel="stylesheet" type="text/css">
</head>
   <body bgcolor="white">
   <table>
   	<tr>
   		<td>
     		<h2><span style="color:white">신청내역조회</span></h2>
   		</td>
   </tr>
   <tr>
   		<td>
   			<table class="simple_table2">
   			<thead>
   				<tr>
      				<th scope="cols"><strong><span style="color:black">신청일자</span></strong></th>
      				<th scope="cols"><strong><span style="color:black">신청용도</span></strong></th>
      				<th scope="cols"><strong><span style="color:black">CPU사양</span></strong></th>
      				<th scope="cols"><strong><span style="color:black">메모리사양</span></strong></th>
      				<th scope="cols"><strong><span style="color:black">네트워크사양</span></strong></th>
   				    <th scope="cols"><strong><span style="color:black">VM연결</span></strong></th>
      				<th scope="cols"><strong><span style="color:black">서비스</span></strong></th>
   				</tr>
 		    </thead>
   		<%
		   if (return_count > 0) {
			if(rs2!=null){
				while(rs2.next()){
					seq_no = rs2.getString("seq_no");
					apply_date = rs2.getString("apply_date");
  					def_spec = rs2.getString("def_spec");
  					custom_info = rs2.getString("custom_info");
  					custom_cpu_info = rs2.getString("custom_cpu_info");
  					custom_ram_info = rs2.getString("custom_ram_info");
  					custom_net_info = rs2.getString("custom_net_info");
  					vmpc_link=rs2.getString("vmpc_link");
    	%>
   			<tbody>
   				<tr>
   					<td><span style="color:black"><%=apply_date %></span></td>
   					<td><span style="color:black"><%=custom_info  %></span></td>
   					<td><span style="color:black"><%=custom_cpu_info %></span></td>
   					<td><span style="color:black"><%=custom_ram_info %></span></td>
   					<td><span style="color:black"><%=custom_net_info %></span></td>
<% 					if (vmpc_link.length() < 2) {   %>
   					<td>
      					<span style="color:black">준비중</span>
   					</td>
<% 					} else {  %>
  					<td>
    					<span style="color:black"><input type="button" value="다운받기" onclick="javascript:location.href='<%=vmpc_link%>'"></span>
					</td>
<% 					} %>
   					<td>
     					<span style="color:black"><input type="button" value="삭제하기" onclick="javascript:fun_delete(<%=seq_no%>);"></span>
     					<span style="color:black"><input type="button" value="수정하기" onclick="javascript:fun_change(<%=seq_no%>);"></span>
   					</td>
<%
						counter++;
   	  		  		}
    			}
%>
  				</tr>
 		 	</tbody>
<%	
   			} else {
 		    //신청내역이 없는 경우 화면 처리 시작
%>
   			<tbody>
   				<tr>
   					<td colspan=8 align=center>신청내역이 없음</td>
   				</tr>
   			</tbody>
<%
   			//신청내역이 없는 경우 화면 처리 종료
   			}   
%>
  	</table>
  			</td>
  			</tr>
  			 <tr>
  				<th><span style="color:white"><%=id_s %>님 신청건수: 총 <%=counter%> 개</span>
	  		 </tr>
	    	 <tr>
   				<th><span style="color:black"><input type="button" value="VM신청하기" onclick="javascript:location.href='VMPC-SpecApply.jsp'"></span></th>
 	   		 </tr>
    </table>
    
 	   <%
   	   	 }catch(SQLException sqlException){
    		System.out.println("sql exception_step2");
    			sqlException.printStackTrace();
    			}catch(Exception exception){
   				 	System.out.println("exception");
    					exception.printStackTrace();
    	  }finally{
    		if(rs1!=null)  	try{rs1.close();}	catch(SQLException ex){}
    		if(stmt1!=null) try{stmt1.close();}   catch(SQLException ex){}
    		if(conn1!=null) try{pool.freeConnection(conn1);} catch(Exception ex){}
    		if(rs2!=null)  	try{rs2.close();}	catch(SQLException ex){}
    		if(stmt2!=null) try{stmt2.close();}   catch(SQLException ex){}
    		if(conn2!=null) try{pool.freeConnection(conn2);} catch(Exception ex){}    	
          }    	
    
	    %>
  	</body>
  	</html>  	

  