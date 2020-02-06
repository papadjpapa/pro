<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE html>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/newMainThemeCSS.css" />

<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
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
<!------ Include the above in your HEAD tag ---------->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "my.pack.DriverDB" %>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

request.setCharacterEncoding("UTF-8");
String index = null;
String code = null;
String name = null;
String dong = null;
String ho = null;
String count = null;
String car_num1 = null;
String phone_num1 = null;
String car_num2 = null;
String phone_num2 = null;
String car_num3 = null;
String phone_num3 = null;
String car_num4 = null;
String phone_num4 = null;

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
	
	pstmt=conn.prepareStatement("select * from car_list");
 	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
 	
 	
	rs = pstmt.executeQuery();%>
	
	
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

	 <%@ include file = "/search/searchForm.jsp" %>	


  
    <h1>Tables</h1>
  </div>
  <div class="row">
    <div class="col-md-12">
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>codeNum</th>
		    <th>name</th>
		    <th>dong</th>
		    <th>ho</th>
		    <!-- <th>count</th> -->
		    <th>carNum1</th>
		    <th>phoneNum1</th>
		    <th>carNum2</th>
		    <th>phoneNum2</th>
		    <th>carNum3</th>
		    <th>phoneNum3</th>
		    <th>carNum4</th>
		    <th>phoneNum4</th>
          </tr>
        </thead>
	<% while(rs.next()){
		index=rs.getString("index");
		code=rs.getString("code_num");
		name=rs.getString("name");
		dong=rs.getString("dong");
		ho=rs.getString("ho");
		/* count=rs.getString("count"); */
		car_num1=rs.getString("car_num1");
		phone_num1=rs.getString("phone_num1");
		car_num2=rs.getString("car_num2");
		phone_num2=rs.getString("phone_num2");
		car_num3=rs.getString("car_num3");
		phone_num3=rs.getString("phone_num3");
		car_num4=rs.getString("car_num4");
		phone_num4=rs.getString("phone_num4");%>
        <tbody>
          <tr>
            <td><%=index %></td>
            <td><%=code %></td>
            <td><%=name %></td>
            <td><%=dong %></td>
            <td><%=ho %></td>
           <%--  <td><%=count %></td> --%>
            <td><%=car_num1 %></td>
            <td><%=phone_num1 %></td>
            <td><%=car_num2 %></td>
            <td><%=phone_num2 %></td>
            <td><%=car_num3 %></td>
            <td><%=phone_num3 %></td>
            <td><%=car_num4 %></td>
            <td><%=phone_num4 %></td>
            
          </tr>
         
        </tbody>
	<% }
	%>
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



%>