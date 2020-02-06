<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<%
String[] hangmok = request.getParameterValues("hangmok[]");
String[] money = request.getParameterValues("money[]");
String uCurrent = request.getParameter("uCurrent");
System.out.println(uCurrent+"와우 와우ㅏ와와와와");

//System.out.println(hangmok[0] + "대체 뭘까22222");

Connection conn2 = null;
PreparedStatement pstmt2 = null;



Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/bank?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "idbank";
	String dbPass = "pwbank";
	conn2 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	//System.out.println(conn + "<-- conn m_search_list.jsp");
	if(conn2 != null){
		out.println("01 DB연결 성공");
	}else{
		out.println("02 DB연결 실패");
	}
	
	if(hangmok.length == 1 && money.length == 1){
		pstmt2=conn2.prepareStatement("update bank_table set u_current=?,u_hangmok1=?,u_money1=?");
		pstmt2.setString(1, uCurrent);
		pstmt2.setString(2, hangmok[0]);
		pstmt2.setString(3, money[0]);
	}else if(hangmok.length == 2){
		pstmt2=conn2.prepareStatement("update bank_table set u_current=?,u_hangmok1=?,u_hangmok2=?,u_money1=?,u_money2=?");
		pstmt2.setString(1, uCurrent);
		pstmt2.setString(2, hangmok[0]);
		pstmt2.setString(3, hangmok[1]);
		pstmt2.setString(4, money[0]);
		pstmt2.setString(5, money[1]);
	}else if(hangmok.length == 3){
		pstmt2=conn2.prepareStatement("update bank_table set u_current=?,u_hangmok1=?,u_hangmok2=?,u_hangmok3=?,u_money1=?,u_money2=?,u_money3=?");
		pstmt2.setString(1, uCurrent);
		pstmt2.setString(2, hangmok[0]);
		pstmt2.setString(3, hangmok[1]);
		pstmt2.setString(4, hangmok[2]);
		pstmt2.setString(5, money[0]);
		pstmt2.setString(6, money[1]);
		pstmt2.setString(7, money[2]);
	}else if(hangmok.length == 4){
		pstmt2=conn2.prepareStatement("update bank_table set u_current=?,u_hangmok1=?,u_hangmok2=?,u_hangmok3=?,u_hangmok4=?,u_money1=?,u_money2=?,u_money3=?,u_money4=?");
		pstmt2.setString(1, uCurrent);
		pstmt2.setString(2, hangmok[0]);
		pstmt2.setString(3, hangmok[1]);
		pstmt2.setString(4, hangmok[2]);
		pstmt2.setString(5, hangmok[3]);
		pstmt2.setString(6, money[0]);
		pstmt2.setString(7, money[1]);
		pstmt2.setString(8, money[2]);
		pstmt2.setString(9, money[3]);
	}	
		 pstmt2.executeUpdate();
	
	
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	
	if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}
	if (conn2 != null) try { conn2.close(); } catch(SQLException ex) {}
}


%>
<body>

</body>
</html>