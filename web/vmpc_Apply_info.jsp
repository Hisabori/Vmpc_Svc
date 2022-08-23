<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, source.*"%>
<%
  
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
	String id_s = (String)session.getAttribute("idKey");

	
	//public boolean vmpc_apply_info(String id) {
	System.out.println("TEST_get_attribute:1["+id_s+"]");
	System.out.println("TEST_get_attribute:2["+id+"]");
	
	//String url = "login.jsp";

    DBConnectionMgr pool = DBConnectionMgr.getInstance();

  	Connection conn=null;
  	PreparedStatement pstmt = null;
    Statement stmt = null;
    ResultSet rs=null;
	String sql = null;
	boolean flag = false;
    String def_spec="";
    String custom_info="";
    String custom_cpu_info="";
    String custom_ram_info="";
    String custom_net_info="";
    String vmpc_link="";
    
    conn = pool.getConnection();

    
    int counter =0;
    try{

    	sql="";
    	sql=sql+"SELECT (CASE custom_info when '1' then '기본' when '2' then '공유pc' when '3' then '사용자 정의 사양' ELSE '오류-사양 값 입력 오류' END ) custom_info,";
    	sql=sql+"(CASE def_spec when '1' then '기본/번경 안함' when '2' then 'cpu번경' when '3' then 'cpu/ram번경' when '4' then '램/저장소 번경' when '5' then '저장소 번경' ELSE '오류-사양 값 입력 오류'  END) def_spec,";
    	sql=sql+"(CASE custom_cpu_info when '1' then '기본' when '2' then 'i3' when '3' then 'i5' when '4' then 'i7' when '5' then 'r3'  when '6' then 'r5' when '7' then 'r7' ELSE '오류-사양 값 입력 오류' END) custom_cpu_info,";
    	sql=sql+"(CASE custom_ram_info  when '1' then '기본' when '2' then '+4g' when '3' then '+8g' when '4' then '+16g'  when '5' then '+32g'  ELSE '오류-사양 값 입력 오류' END) custom_ram_info,";
    	sql=sql+"(CASE custom_net_info  when '1' then '기본' when '2' then '고속' ELSE '오류-사양 값 입력 오류' END) custom_net_info, IFNULL(vmpc_link,' ') as vmpc_link ";
    	sql=sql+"FROM vmpc_seq_info where id=?";
		
		System.out.println("vm_link_value=["+vmpc_link+"]");
    	
    	System.out.println("SQL=["+sql+"]");
    	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id_s);
		rs = pstmt.executeQuery();
		
        
 %>
  <html>
  <head>
  
  <link href="mat.css" rel="stylesheet" type="text/css">
  </head>
  <body bgcolor="FFFFCC">
  <h2>db테스트</h2>
  <table bordercolor="#0000ff" border="1">
    <tr>
      <td><strong>def_spec</strong></td>
  <td><strong>custom_info</strong></td>
  <td><strong>custom_cpu_info</strong></td>
  <td><strong>custom_ram_info</strong></td>
  <td><strong>custom_net_info</strong></td>
  <td><strong>vmpc_link</strong></td>
  </tr>
<%
	if(rs!=null){
  		
		while(rs.next()){
  			
  			def_spec = rs.getString("def_spec");
  			custom_info = rs.getString("custom_info");
  			custom_cpu_info = rs.getString("custom_cpu_info");
  			custom_ram_info = rs.getString("custom_ram_info");
  			custom_net_info = rs.getString("custom_net_info");
  			vmpc_link=rs.getString("vmpc_link");
  %>
  <tr>
  <td><%= def_spec %></td>
  <td><%= custom_info  %></td>
  <td><%=custom_cpu_info %></td>
  <td><%=custom_ram_info %></td>
  <td><%=custom_net_info %></td>
 <% if (vmpc_link.equals(" ")) {   %>
   <td>
      <span>준비중</span>
   </td>
 <% } else {  %>
   <td>
      <input type="button" value="다운받기" onclick="javascript:location.href='<%=vmpc_link%>'">
   </td>
 
<%     	
			}
			counter++;
   	    }
    }
%>
 
 <!-- Spec_Edit_Form -->
 <form name="SpecEditForm" method="post" action = "SpecEdit.jsp">
 <table border="1" cellspacing="0" cellpadding="2" width="400">
 <tr bgcolor = "FFFFFF">
 <td colspan="3"> <font color ="Ffffff"
 
 
 
 </div>
 </form>
 
  </tr>  
  </table>
  
  total records: <%=counter%>
  <%
    }catch(SQLException sqlException){
    	System.out.println("sql exception");
    }catch(Exception exception){
    	System.out.println("exception");
    	exception.printStackTrace();
    }finally{
    	if(rs!=null)
    		try{rs.close();}
    catch(SQLException ex){}
    	if(stmt!=null)
    		try{stmt.close();}
    	catch(SQLException ex){}
    	if(conn!=null)
    		try{pool.freeConnection(conn);}
    	catch(Exception ex){}
    }
%>
</body>
</html>  	

  