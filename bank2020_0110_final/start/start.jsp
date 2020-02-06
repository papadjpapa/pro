<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
    
<!DOCTYPE html>


		
<%
String name = (String)session.getAttribute("NAME");
String getNum = (String)session.getAttribute("NUM");
String id = (String)session.getAttribute("ID");
//int num = Integer.parseInt(getNum);
System.out.println(name);
System.out.println(getNum);
String optionLength = null;

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/bank?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "idbank";
	String dbPass = "pwbank";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	//System.out.println(conn + "<-- conn m_search_list.jsp");
	if(conn != null){
		out.println("01 DB연결 성공");
	}else{
		out.println("02 DB연결 실패");
	}
	
	pstmt=conn.prepareStatement("select * from bank_table where u_id=?");
 	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
 	pstmt.setString(1, id);
 	
	rs = pstmt.executeQuery();
	//System.out.println(rs.next());
	if(rs.next()){
		optionLength = rs.getString("u_option");
	}

} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}




if(name == null){
%>		
<!-- 로그인전 화면 시작 -->
		<%@ include file = "/main.jsp" %>	
<!-- 로그인전 화면 End -->		
			
		
		 
<%}else if(name != null && optionLength.equals("0")){ System.out.println(optionLength+"sdfsdf");%>

		
		 <%@ include file = "/optionChoice/uOption_0.jsp" %>
			     <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				  <div class="widget">
		                        <h4 class="widget-title"><%= name %> welcome! </h4>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                                <div class="summary-head"><a href="<%= request.getContextPath() %>/logout/logout.jsp">LOGOUT</a></div>
		                               
		                            </div>
		                        </div>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                               <div class="summary-head"><a href="<%= request.getContextPath() %>/modifiForm/modifyForm_0.jsp?sendLength=<%=optionLength%>">UPDATE</a></div>
		                              
		                            </div>
		                        </div>
		                    
		                </div>
		            </div>

         </div>
	

</div>
</div>
	
		  
		 
	

<br/>
<%	

 }else if(name != null && optionLength.equals("1")){ System.out.println(optionLength+"sdfsdf");%>
		  <%@ include file = "/optionChoice/uOption_1.jsp" %>	
		     <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				  <div class="widget">
		                        <h4 class="widget-title"><%= name %> welcome! </h4>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                                <div class="summary-head"><a href="<%= request.getContextPath() %>/logout/logout.jsp">LOGOUT</a></div>
		                               
		                            </div>
		                        </div>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                               <div class="summary-head"><a href="<%= request.getContextPath() %>/modifiForm/modifyForm_1.jsp?sendLength=<%=optionLength%>">UPDATE</a></div>
		                              
		                            </div>
		                        </div>
		                    
		                </div>
		            </div>

         </div>
	

</div>
</div>
	
		
				 
		
	

<br/><%}else if(name != null && optionLength.equals("2")){ System.out.println(optionLength+"sdfsdf");%>
		 <%@ include file = "/optionChoice/uOption_2.jsp" %>	
		     <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				  <div class="widget">
		                        <h4 class="widget-title"><%= name %> welcome! </h4>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                                <div class="summary-head"><a href="<%= request.getContextPath() %>/logout/logout.jsp">LOGOUT</a></div>
		                               
		                            </div>
		                        </div>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                               <div class="summary-head"><a href="<%= request.getContextPath() %>/modifiForm/modifyForm_2.jsp?sendLength=<%=optionLength%>">UPDATE</a></div>
		                              
		                            </div>
		                        </div>
		                    
		                </div>
		            </div>

         </div>
	

</div>
</div>
	
		 
	

<br/><%}else if(name != null && optionLength.equals("3")){ System.out.println(optionLength+"sdfsdf");%>
		
	    <%@ include file = "/optionChoice/uOption_3.jsp" %>	
		
               <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				  <div class="widget">
		                        <h4 class="widget-title"><%= name %> welcome! </h4>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                                <div class="summary-head"><a href="<%= request.getContextPath() %>/logout/logout.jsp">LOGOUT</a></div>
		                               
		                            </div>
		                        </div>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                               <div class="summary-head"><a href="<%= request.getContextPath() %>/modifiForm/modifyForm_3.jsp?sendLength=<%=optionLength%>">UPDATE</a></div>
		                              
		                            </div>
		                        </div>
		                    
		                </div>
		            </div>

         </div>
	

</div>
</div>
	

<br/><%}else if(name != null && optionLength.equals("4")){ System.out.println(optionLength+"sdfsdf");%>
		  <%@ include file = "/optionChoice/uOption_4.jsp" %>	
		     <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				  <div class="widget">
		                        <h4 class="widget-title"><%= name %> welcome! </h4>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                                <div class="summary-head"><a href="<%= request.getContextPath() %>/logout/logout.jsp">LOGOUT</a></div>
		                               
		                            </div>
		                        </div>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                               <div class="summary-head"><a href="<%= request.getContextPath() %>/modifiForm/modifyForm_4.jsp?sendLength=<%=optionLength%>">UPDATE</a></div>
		                              
		                            </div>
		                        </div>
		                    
		                </div>
		            </div>

         </div>
	

</div>
</div>
	
		
		
		
				 
		 
	

<br/><%}%>


		       