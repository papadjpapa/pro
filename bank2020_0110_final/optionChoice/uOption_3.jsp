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
double uMoney2= 0;
double uMoney3= 0;
String uHangmok1 = null;
String uHangmok2 = null;
String uHangmok3 = null;
double available = 0;

double newSecond = 0;
double newThird = 0;

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
		uMoney2 = Integer.parseInt(rs1.getString("u_money2"));
		uMoney3 = Integer.parseInt(rs1.getString("u_money3"));
		uHangmok1 = rs1.getString("u_hangmok1");
		uHangmok2 = rs1.getString("u_hangmok2");
		uHangmok3 = rs1.getString("u_hangmok3");
		
		
	}

} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs1 != null) try { rs1.close(); } catch(SQLException ex) {}
	if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException ex) {}
	if (conn1 != null) try { conn1.close(); } catch(SQLException ex) {}
}

available = uCurrent - uMoney1 - uMoney2 - uMoney3 ;
newSecond = uCurrent - uMoney1;
newThird =  uCurrent - uMoney1 - uMoney2;
/* double c1 = own1 - one1 - two1;
double b1 = own1 - one1 ;
double a1 = own1; */

if(available > 0){
	available = uCurrent - uMoney1 - uMoney2 - uMoney3 ;
}else if(available <= 0 && uCurrent>0 && newSecond > 0 && newThird > 0){
	available = 0;
	
	uMoney3 = uCurrent - uMoney1 - uMoney2;
}else if(available <= 0 && uCurrent>0 && newSecond > 0 && newThird <= 0){
	available = 0;
	uMoney3 = 0;
	uMoney2 = uCurrent - uMoney1;
}else if(available <= 0 && uCurrent>0 && newSecond <= 0 && newThird <= 0){
	available = 0;
	uMoney3 = 0;
	uMoney2 = 0;
	uMoney1 = uCurrent;
}else if(uCurrent == 0){
	available = 0;
	uMoney3 = 0;
	uMoney2 = 0;
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
                                <label for="question2"><%=uHangmok2 %></label>
                                <p class="plan-text">
                                   comment!</p>
                                <span class="plan-price"><%=uMoney2 %></span>
                            </div>
                        </div>
                        <div class="plan-selection">
                            <div class="plan-data">
                                <!-- <input id="question2" name="question" type="radio" class="with-font" value="sel" /> -->
                                <label for="question2"><%=uHangmok3 %></label>
                                <p class="plan-text">
                                   comment!</p>
                                <span class="plan-price"><%=uMoney3 %></span>
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