<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE html>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/newMainThemeCSS.css" />

<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "my.pack.DriverDB" %>
<style>
.well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #dfe0d9;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
}
</style>

<%	
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

request.setCharacterEncoding("euc-kr"); 


String location = request.getParameter("location");
System.out.println(location);

/* String locNum = null;
locNum = location.substring(0, 1);
System.out.println(locNum); */

		if(! "".equals(location) & location !=null){
			try{
				
				Class.forName("com.mysql.jdbc.Driver");
				
				
				String jdbcDriver = "jdbc:mysql://localhost:3306/jucha?" +
						"useUnicode=true&characterEncoding=euckr";
				String dbUser = "idjucha";
				String dbPass = "pwjucha";
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				//System.out.println(conn + "<-- conn m_search_list.jsp");
				if(conn != null){
					out.println("01 DB성공");
				}else{
					out.println("02 DB시류ㅐ");
				}
				
				pstmt=conn.prepareStatement("SELECT * FROM commonpeople WHERE location=?");
			 	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
			 	pstmt.setString(1, location);
			 	
				rs = pstmt.executeQuery();
				//System.out.println(rs.next());
				%>
				
			<!-- Fixed navbar -->
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			  <div class="container">
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">SmartSystem</a>
			    </div>
			    <div id="navbar" class="navbar-collapse collapse">
			      <ul class="nav navbar-nav">
			        <li class="active"><a href="<%=request.getContextPath()%>/list/list.jsp">list</a></li>
			        <li><a href="<%=request.getContextPath()%>/insert/insert.jsp">insert</a></li>
			        <li><a href="<%=request.getContextPath()%>/view/view.jsp">view</a></li>
			        <li><a href="<%=request.getContextPath()%>/logout/logoutPro.jsp">logout</a></li>
			       
			      </ul>
			    </div><!--/.nav-collapse -->
			  </div>
			</nav>

			<div class="container" role="main">
			  

			  
			  <div class="page-header">
			 <!--  <h1 align="center">Test</h1> <br/> -->

				


			  
			    <h1>주차장 현황</h1>
			  </div>
			  <div class="row">
			    <div class="col-md-12">
			    
			    	 <table class="table">
			        <thead>
			          <tr>
			       
					    <th>car_num</th>
					    <th>location</th>
					
			          </tr>
			        </thead>
				<% while(rs.next()){
					
					String car=rs.getString("car_num");
					String loc=rs.getString("location");
					System.out.println(car);
				
				
					%>
			        <tbody>
			          <tr>
			            
			            <td><%=car %></td>
			            <td><%=loc %></td>
			       
			            
			          </tr>
			         
			        </tbody>
				<% }%> 
			      </table>
			    
			    
			    
			    </div>
			   
			  </div>
			  
			</div> <!-- /container -->



			<%} catch(SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
			} finally {
				
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}

		 }


%>
