<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "my.pack.DriverDB" %>
<script type="text/javascript" src="../jquery-3.4.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/domyeon.css" />
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>  -->
<%
String inLocNum=request.getParameter("inLocNum");
System.out.println(inLocNum+"ajax값 받기");

Connection conn1 = null;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt3 = null;
ResultSet rs1 = null;

String domyeonLoc = null;
String domyeonState = null;
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
	
	pstmt2=conn1.prepareStatement("UPDATE domyeon SET state=case when state='Y' then 'N' ELSE 'Y' END WHERE location=?; ");
 	pstmt2.setString(1, inLocNum);
	
	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
 	
 	
	pstmt2.executeUpdate();
	
	
	pstmt3=conn1.prepareStatement("SELECT * FROM domyeon WHERE location=?");
 	pstmt3.setString(1, inLocNum);
 	rs1=pstmt3.executeQuery();
 	
 	if(rs1.next()){
 		domyeonLoc = rs1.getString("location");
 		domyeonState = rs1.getString("state");

 		System.out.println(domyeonLoc+ "==========domyeonLoc");
 		System.out.println(domyeonState+ "==========domyeonState");

 	}
	
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs1 != null) try { rs1.close(); } catch(SQLException ex) {}
	if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}

	if (pstmt3 != null) try { pstmt3.close(); } catch(SQLException ex) {}
	if (conn1 != null) try { conn1.close(); } catch(SQLException ex) {}
}


%>

<script>


var domyeonLoc = '<%=domyeonLoc%>';
var domyeonState = '<%=domyeonState%>';

//console.log(inLocNum+"gogogo");
var index = domyeonLoc.substring(2)
var strA = "A-";
var name="[name=A-" + index +"]"
$('[name=A-1]').attr('class');

$(function(){
	
	if(domyeonState =="Y" ){
		$(name).attr('class','btn btn-success');	
	}
	
}) 
</script>
<div class="container demoPadder" >
	<div class="row">
	
    <div class="col-md-12">
        
        
        
         <div class="btn-toolbar demoPadder" role="toolbar">
      
       
	       <div class="btn-toolbar demoPadder" role="toolbar" aria-label="Toolbar with button groups">
			      <div class="btn-group" role="group" aria-label="First group">
				      <button type="button" name="A-1" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-1" %>">A-1</a></button>
	   			      <button type="button" name="A-2" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-2" %>">A-2</a></button>
				      <button type="button" name="A-3" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-3" %>">A-3</a></button>
				      <button type="button" name="A-4" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-4" %>">A-4</a></button>  
			      </div>
			      <div class="btn-group" role="group" aria-label="Second group">
				      <button type="button" name="A-5" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-5" %>">A-5</a></button>
	   			      <button type="button" name="A-6" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-6" %>">A-6</a></button>
				      <button type="button" name="A-7" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-7" %>">A-7</a></button>
				      <button type="button" name="A-8" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-8" %>">A-8</a></button>
			        
			      </div>
			      <div class="btn-group" role="group" aria-label="Third group">
			          <button type="button" name="A-9" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-9" %>">A-9</a></button>
				      <button type="button" name="A-10" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="A-10" %>">A-10</a></button>
			        
			      </div>
		    </div>
       
      
    
  		</div>
  		<br><br>
  		<br><br>
  		<br>
  		<br>
  		 <div class="btn-toolbar demoPadder" role="toolbar" aria-label="Toolbar with button groups">
			      <div class="btn-group" role="group" aria-label="First group">
				      <button type="button" name="B-1" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-1" %>">B-1</a></button>
	   			      <button type="button" name="B-2" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-2" %>">B-2</a></button>
				      <button type="button" name="B-3" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-3" %>">B-3</a></button>
				      <button type="button" name="B-4" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-4" %>">B-4</a></button>  
			      </div>
			      <div class="btn-group" role="group" aria-label="Second group">
				      <button type="button" name="B-5" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-5" %>">B-5</a></button>
	   			      <button type="button" name="B-6" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-6" %>">B-6</a></button>
				      <button type="button" name="B-7" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-7" %>">B-7</a></button>
				      <button type="button" name="B-8" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-8" %>">B-8</a></button>
			        
			      </div>
			      <div class="btn-group" role="group" aria-label="Third group">
			          <button type="button" name="B-9" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-9" %>">B-9</a></button>
				      <button type="button" name="B-10" class="btn btn-default"><a href="<%= request.getContextPath() %>/view/viewList.jsp?location=<%="B-10" %>">B-10</a></button>
			        
			      </div>
		    </div>
       
      
    
  		</div>
    
    
    
   <!--  
    <div class="demoPadder"></div>
    
    </div>
    
    -->
    
	</div>
</div>
</div>