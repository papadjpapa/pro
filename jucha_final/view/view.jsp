<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "my.pack.DriverDB" %>
   <!DOCTYPE html>
<script type="text/javascript" src="../jquery-3.4.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/newMainThemeCSS.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/domyeon.css" />

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

<%

String inCarNum=request.getParameter("inCarNum");
System.out.println(inCarNum+"ajax값 받기");
String inLocNum=request.getParameter("inLocNum");
System.out.println(inLocNum+"ajax값 받기");
String subInLocNum = null;
if(! "".equals(inLocNum) & inLocNum != null ){
	subInLocNum = inLocNum.substring(0, 2);
		
	System.out.println(subInLocNum+"<---------subInLocNum");
}
String outLocNum=request.getParameter("outLocNum");
System.out.println(outLocNum+"outLocNum <-----view.jsp");
String subOutLocNum = null;
if(! "".equals(outLocNum) & outLocNum != null ){
	subOutLocNum = outLocNum.substring(0, 2);
		
	System.out.println(subOutLocNum+"<---------subOutLocNum<-----view.jsp");
}


Connection conn1 = null;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt_a = null;
PreparedStatement pstmt_b = null;
PreparedStatement pstmt_inCarNum = null;

ResultSet rs_a = null;
ResultSet rs_b = null;
ResultSet rs_inCarNum = null;
String domyeonLoc = null;
String domyeonState = null;
request.setCharacterEncoding("UTF-8");
//String index = null;


try{
	Class.forName("com.mysql.jdbc.Driver");
	
	
	String jdbcDriver1 = "jdbc:mysql://localhost:3306/jucha?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser1 = "idjucha";
	String dbPass1 = "pwjucha";
	conn1 = DriverManager.getConnection(jdbcDriver1, dbUser1, dbPass1);
	//System.out.println(conn + "<-- conn m_search_list.jsp");
	if(conn1 != null){
		System.out.println("01 DB성공");
	}else{
		System.out.println("02 DB시류ㅐ");
	}
	
	if(! "".equals(inCarNum) & inCarNum != null & "A-".equals(subInLocNum)){
		pstmt_inCarNum=conn1.prepareStatement("SELECT A.count from car_list AS CL INNER join a_section AS A ON A.code_num=CL.code_num WHERE CL.car_num1=? OR CL.car_num2=? OR CL.car_num3=? OR CL.car_num4=? ");
		pstmt_inCarNum.setString(1, inCarNum);
		pstmt_inCarNum.setString(2, inCarNum);
		pstmt_inCarNum.setString(3, inCarNum);
		pstmt_inCarNum.setString(4, inCarNum);
		
		rs_inCarNum = pstmt_inCarNum.executeQuery();
		System.out.println("여기까지 이상없음");
		//System.out.println(rs_inCarNum.next());
		//System.out.println(rs_inCarNum.getString("count")+"rs_inCarNum.getString(11count)");
		if(rs_inCarNum.next()){
			if(Integer.parseInt(rs_inCarNum.getString("count")) > 0){
				pstmt2=conn1.prepareStatement("UPDATE domyeon_a SET state=case when state='N' then 'Y' ELSE state END ,pof='F' WHERE location=?");
			 	pstmt2.setString(1, inLocNum);
			 	pstmt2.executeUpdate();
				
			}else{
				pstmt2=conn1.prepareStatement("UPDATE domyeon_a SET state=case when state='N' then 'Y' ELSE state END ,pof='P' WHERE location=?");
			 	pstmt2.setString(1, inLocNum);
			 	pstmt2.executeUpdate();
			}
		}else{//이건 등록되지 않은 차량 의미이다!!
			pstmt2=conn1.prepareStatement("UPDATE domyeon_a SET state=case when state='N' then 'Y' ELSE state END ,pof='R' WHERE location=?");
		 	pstmt2.setString(1, inLocNum);
		 	pstmt2.executeUpdate();
		}
	}else if(! "".equals(inCarNum) & inCarNum != null & "B-".equals(subInLocNum)){//B구역에 주차한 차량 일때
		pstmt_inCarNum=conn1.prepareStatement("SELECT A.count from car_list AS CL INNER join a_section AS A ON A.code_num=CL.code_num WHERE CL.car_num1=? OR CL.car_num2=? OR CL.car_num3=? OR CL.car_num4=? ");
		pstmt_inCarNum.setString(1, inCarNum);
		pstmt_inCarNum.setString(2, inCarNum);
		pstmt_inCarNum.setString(3, inCarNum);
		pstmt_inCarNum.setString(4, inCarNum);
		
		rs_inCarNum = pstmt_inCarNum.executeQuery();
		if(rs_inCarNum.next()){//등록된 차량일때
				pstmt2=conn1.prepareStatement("UPDATE domyeon_b SET state=case when state='N' then 'Y' ELSE state END ,pof='P' WHERE location=?");
			 	pstmt2.setString(1, inLocNum);
			 	pstmt2.executeUpdate();
				
			
		}else{//이건 등록되지 않은 차량 의미이다!!
			pstmt2=conn1.prepareStatement("UPDATE domyeon_b SET state=case when state='N' then 'Y' ELSE state END ,pof='R' WHERE location=?");
		 	pstmt2.setString(1, inLocNum);
		 	pstmt2.executeUpdate();
		}
		
	}else if(! "".equals(outLocNum) & outLocNum != null & "A-".equals(subOutLocNum)){//A구역에 주차한 차량이 나갈때
		System.out.println("out까지 넘어옴");
		pstmt2=conn1.prepareStatement("UPDATE domyeon_a SET state=case when state='Y' then 'N' ELSE state END ,pof='' WHERE location=? ");
	 	pstmt2.setString(1, outLocNum);
		
		pstmt2.executeUpdate();
	} else if(! "".equals(outLocNum) & outLocNum != null & "B-".equals(subOutLocNum)){//B구역에 주차한 차량이 나갈때
		System.out.println("out까지 넘어옴");
		pstmt2=conn1.prepareStatement("UPDATE domyeon_b SET state=case when state='Y' then 'N' ELSE state END ,pof='' WHERE location=? ");
	 	pstmt2.setString(1, outLocNum);
		
		pstmt2.executeUpdate();
	}
	//등록된 차량 중 A구역 조사하여 카운트가 0보다 크면 domyeon에 F로 저장
	
	
	
	
	
	
	
	/* if(! "".equals(inLocNum) & inLocNum != null){
		
		pstmt2=conn1.prepareStatement("UPDATE domyeon SET state=case when state='N' then 'Y' ELSE state END WHERE location=?; ");
	 	pstmt2.setString(1, inLocNum);
		
		pstmt2.executeUpdate();
	}else if(! "".equals(outLocNum) & outLocNum != null){
		pstmt2=conn1.prepareStatement("UPDATE domyeon SET state=case when state='Y' then 'N' ELSE state END WHERE location=?; ");
	 	pstmt2.setString(1, outLocNum);
		
		pstmt2.executeUpdate();
	} */
	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
 	
 	
	
	
	pstmt_a=conn1.prepareStatement("SELECT * FROM domyeon_a ORDER BY CAST(REPLACE(location, 'A-', '') AS signed)");
 	//pstmt3.setString(1, inLocNum);
 	rs_a=pstmt_a.executeQuery();
 	
 	
 	pstmt_b=conn1.prepareStatement("SELECT * FROM domyeon_b ORDER BY CAST(REPLACE(location, 'B-', '') AS signed)");
 	//pstmt3.setString(1, inLocNum);
 	rs_b=pstmt_b.executeQuery();
 	
 
	
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

	
<br><br>

  
    <h1>주차장 현황</h1>
  </div>
  <div class="row">
    <div class="col-md-12">
    
    <!-- 이자리에 도면 넣자 -->   
    <div class="container demoPadder" >
	<div class="row">
	
    <div class="col-md-12">
        
        
        
<div class="btn-toolbar demoPadder" role="toolbar">


		<div class="btn-toolbar demoPadder" role="toolbar" aria-label="Toolbar with button groups">
			<%
				
				int i=1;
				while(rs_a.next()){
					
					String location = rs_a.getString("location");
					String state = rs_a.getString("state");
					String pof = rs_a.getString("pof");
					String addClass = "";
					
					if("Y".equals(state) & "P".equals(pof)){
						addClass = "btn-success";
					}else if("Y".equals(state) & "F".equals(pof)){
						addClass = "btn-warning";
					}else if("Y".equals(state) & "R".equals(pof)){
						addClass = "btn-danger";
					}else{
						addClass = "btn-default";						
						
					}
					
					if(i == 1){
						%>							
							<div class="btn-group" role="group">
						<%
					}
					%>	
										
						<a class="btn <%=addClass %>" href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%=location%>">
							<%= location %>
						</a>
						
					<%
					if(i % 4 == 0){
						%>
							</div>
							<div class="btn-group" role="group">
						<%
					}
					
					if(i  == 10){
						%>
						</div>
						<%
					}
					
					i++;
				}			
				
			
			%>
			
			
		</div>
       
      
    
  		</div>
  		<br><br>
  		<br><br>
  		<br>
  		<br>
  		 <div class="btn-toolbar demoPadder" role="toolbar" aria-label="Toolbar with button groups">
			     <%
				
				int j=1;
				while(rs_b.next()){
					
					String location = rs_b.getString("location");
					String state = rs_b.getString("state");
					String pof = rs_b.getString("pof");
					String addClass = "";
					
					if("Y".equals(state) & "P".equals(pof)){
						addClass = "btn-success";
					}else if("Y".equals(state) & "R".equals(pof)){
						addClass = "btn-danger";
					}else{
						addClass = "btn-default";						
						
					}
					
					if(j == 1){
						%>							
							<div class="btn-group" role="group">
						<%
					}
					%>	
										
						<a class="btn <%=addClass %>" href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%=location%>">
							<%= location %>
						</a>
						
					<%
					if(j % 4 == 0){
						%>
							</div>
							<div class="btn-group" role="group">
						<%
					}
					
					if(j  == 10){
						%>
						</div>
						<%
					}
					
					j++;
				}			
				
			
			%>
		    </div>
       
      
    
  		</div>
    
    
    
   <!--  
    <div class="demoPadder"></div>
    
    </div>
    
    -->
    
	</div>
</div>
</div>
    
    
    
    </div>
   
  </div>
  
</div> <!-- /container -->



<%} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs_inCarNum != null) try { rs_inCarNum.close(); } catch(SQLException ex) {}

	if (rs_a != null) try { rs_a.close(); } catch(SQLException ex) {}
	if (rs_b != null) try { rs_b.close(); } catch(SQLException ex) {}

	if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}

	if (pstmt_a != null) try { pstmt_a.close(); } catch(SQLException ex) {}
	if (pstmt_b != null) try { pstmt_b.close(); } catch(SQLException ex) {}

	if (conn1 != null) try { conn1.close(); } catch(SQLException ex) {}
}



%>