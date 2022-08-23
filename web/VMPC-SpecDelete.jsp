<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, source.*"%>
<%@ page import="DBConnectionMgr" %>
<%
  
    String id = request.getParameter("id");
    //String pwd = request.getParameter("pwd");
    String seq_no = request.getParameter("seq_no");
	String id_s = (String)session.getAttribute("idKey");

	
	//public boolean vmpc_apply_info(String id) {
	System.out.println("PAGE:-----------------: vmpc_delete.jsp]");
	System.out.println("TEST_get_attribute:1["+id_s+"]");
	System.out.println("TEST_get_attribute:2["+id+"]");
	System.out.println("seq_no ["+seq_no+"]");
	
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
    conn = pool.getConnection();

    
    int counter =0;
    int return_code = 0;
    try{
		
    	sql="";
    	sql=sql+"delete FROM vmpc_seq_info where id = ? AND seq_no = ?";    
    	System.out.println("SQL=["+sql+"]");
    	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id_s);
		pstmt.setString(2, seq_no);
		return_code = pstmt.executeUpdate();
		System.out.println("return_code=["+return_code+"]");
        
  
  	if(rs!=null){
  		
  		while(rs.next()){
  			
  			def_spec = rs.getString("def_spec");
  			custom_info = rs.getString("custom_info");
  			custom_cpu_info = rs.getString("custom_cpu_info");
  			custom_ram_info = rs.getString("custom_ram_info");
  			custom_net_info = rs.getString("custom_net_info");
    	counter++;
   		}
  	}
  	
    }catch(SQLException sqlException){
    	System.out.println("sql exception555");
    	sqlException.printStackTrace();
    }catch(Exception exception){
    	System.out.println("exception");
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
<html>
<head>
<script>
 function landing() {
	 location.href= 'VMPC-SpecApplyInfo.jsp';
 }
</script>
</head>
<body onload="landing()">
</body>
</html>
  