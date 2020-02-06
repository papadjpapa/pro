<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/testThemaCSS.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
Connection conn1 = null;
PreparedStatement pstmt1 = null;
ResultSet rs1 = null;

double uCurrent= 0;
double uMoney1= 0;
String uHangmok1 = null;
double available = 0;

//double finalFirst = 0;

String id1 = (String)session.getAttribute("ID");

Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/bank?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "idbank";
	String dbPass = "pwbank";
	conn1 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	//System.out.println(conn + "<-- conn m_search_list.jsp");
	if(conn1 != null){
		out.println("01 DB연결 성공");
	}else{
		out.println("02 DB연결 실패");
	}
	
	pstmt1=conn1.prepareStatement("select * from bank_table where u_id=?");
 	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
 	pstmt1.setString(1, id1);
 	
	rs1 = pstmt1.executeQuery();
	//System.out.println(rs1.next());
	if(rs1.next()){
		uCurrent =Integer.parseInt(rs1.getString("u_current"));
		uMoney1 = Integer.parseInt(rs1.getString("u_money1"));
		uHangmok1 = rs1.getString("u_hangmok1");
		//finalFirst = Integer.parseInt(rs1.getString("u_first"));
	}

} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs1 != null) try { rs1.close(); } catch(SQLException ex) {}
	if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException ex) {}
	if (conn1 != null) try { conn1.close(); } catch(SQLException ex) {}
}

available = uCurrent - uMoney1;



if(available > 0){
	available = uCurrent - uMoney1;
}else if(available <= 0 &&  uCurrent>0){
	uMoney1 = uCurrent;
	available = 0;
}else if(uCurrent == 0){
	available = 0;
	uMoney1 = 0;
}


%>
</head>

<body>

<div class="content">
<div class="container">
	 <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
                    <div class="box">
                        <h3 class="box-title">스마트한 통장 관리</h3>
                        <div class="plan-selection">
                            <div class="plan-data">
                               <!--  <input id="question1" name="question" type="radio" class="with-font" value="sel" /> -->
                                <label for="question1">현재 금액</label>
                                <p class="plan-text">
                                   comment!</p>
                                <span class="plan-price"><%=uCurrent %></span>
                            </div>
                        </div>
                        <div class="plan-selection">
                            <div class="plan-data">
                                <!-- <input id="question2" name="question" type="radio" class="with-font" value="sel" /> -->
                                <label for="question2"><%=uHangmok1 %></label>
                                <p class="plan-text">
                                   comment!</p>
                                <span class="plan-price"><%=uMoney1 %></span>
                            </div>
                        </div>
                      
                      
                        <div class="plan-selection">
                            <div class="plan-data">
                                <!-- <input id="question2" name="question" type="radio" class="with-font" value="sel" /> -->
                                <label for="question2">이용 가능한 돈</label>
                                <p class="plan-text">
                                   comment!</p>
                                <span class="plan-price"><%=available %></span>
                            </div>
                        </div>
                        
                        
                        
                        </div>
                 </div>
                        
</body>
</html>