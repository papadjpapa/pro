<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "my.pack.DriverDB" %>
<script type="text/javascript" src="../jquery-3.4.1.min.js"></script>
<%
String inCarNum = request.getParameter("inCarNum");
System.out.println(inCarNum + "incarNum");
String inLocNum = request.getParameter("inLocNum");
System.out.println(inLocNum+ "inLocNum");

String inLoc = null;
if("".equals(inCarNum) & "".equals(inLocNum)){
	 //response.sendRedirect(request.getContextPath()+"/insert/insert.jsp");
	
}else if(! "".equals(inLocNum)){
	inLoc= inLocNum.substring(0, 1);
	System.out.println(inLoc);
	
}

Connection conn = null;
PreparedStatement pstmt0 = null;

PreparedStatement pstmt = null;
PreparedStatement pstmt1 = null;
PreparedStatement pstmt2 = null;

ResultSet rs = null;
String code_num=null;
String count=null;

	Class.forName("com.mysql.jdbc.Driver");

try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/jucha?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "idjucha";
	String dbPass = "pwjucha";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	 System.out.println("db연결성공");
	/* if(conn != null){
		out.println("01 DB성공");
	}else{
		out.println("02 DB시류ㅐ");
	} */
	
	
		/****************************************************************** null처리 해야해 **************************************************/

			/****************************************************************** null처리 해야해 **************************************************/
	 if("".equals(inCarNum) & "".equals(inLocNum) & inLoc ==null){
		 System.out.println("01둘다 공백");
		// response.sendRedirect(request.getContextPath()+"/insert/insert.jsp");
	 }else if(! "".equals(inCarNum) & "".equals(inLocNum) & inLoc ==null){
		 System.out.println("02하나 공백");
		 response.sendRedirect(request.getContextPath()+"/insert/insert.jsp");
	 }else if(inLoc.equals("A") & ! "".equals(inLocNum)){
		 System.out.println("A_03둘다 값있음");
		 pstmt0=conn.prepareStatement("INSERT INTO commonpeople (car_num, location) VALUES (?, ?)");
		 pstmt0.setString(1, inCarNum);
		 pstmt0.setString(2, inLocNum);
		 pstmt0.executeUpdate();
	
		 pstmt=conn.prepareStatement("SELECT B.code_num,B.count from car_list AS CL INNER join a_section AS B ON B.code_num=CL.code_num WHERE CL.car_num1=? OR CL.car_num2=? OR CL.car_num3=? or CL.car_num4=?");
		 pstmt.setString(1, inCarNum);
		 pstmt.setString(2, inCarNum);
		 pstmt.setString(3, inCarNum);
		 pstmt.setString(4, inCarNum);
		 
		 rs=pstmt.executeQuery();
		// System.out.println( rs.next());
		 if(rs.next()){
			 code_num=rs.getString("code_num");
			 	System.out.println(code_num+"<<<<---code_num");
			 count=rs.getString("count");
				 System.out.println(count+"<<<<---count");
		 //else 로 등록되지 않은 차량 처리 해줘야겠지!!!!!!a,b섹션은 등록된 차량만 관리하는 테이블이다!!!!!!!!!!!!등록되지 않은 차량 테이블 만드러야지.a,b섹션 다 담을 수 있는!!!
		 
	
				if(count.equals("0")){
					  pstmt1=conn.prepareStatement("UPDATE a_section AS A SET A.A_car_num1=case when A.COUNT=0 then ? ELSE A.A_car_num1 end ,A.A_location1=case when A.COUNT=0 then ? ELSE A.A_location1 END ,A.COUNT=case when A.COUNT=0 then 1 ELSE A.COUNT END WHERE A.code_num =?");
					  pstmt1.setString(1, inCarNum);
					  pstmt1.setString(2, inLocNum);
					  pstmt1.setString(3, code_num);
					  pstmt1.executeUpdate();
				}else if(count.equals("1")){
					  pstmt1=conn.prepareStatement("UPDATE a_section AS A SET A.A_car_num2=case when A.COUNT=1 then ? ELSE A.A_car_num2 end ,A.A_location2=case when A.COUNT=1 then ? ELSE A.A_location2 END ,A.COUNT=case when A.COUNT=1 then 2 ELSE A.COUNT END WHERE A.code_num =?");
					  pstmt1.setString(1, inCarNum);
					  pstmt1.setString(2, inLocNum);
					  pstmt1.setString(3, code_num);
					  pstmt1.executeUpdate();
				}else if(count.equals("2")){
					  pstmt1=conn.prepareStatement("UPDATE a_section AS A SET A.A_car_num3=case when A.COUNT=2 then ? ELSE A.A_car_num3 end ,A.A_location3=case when A.COUNT=2 then ? ELSE A.A_location3 END ,A.COUNT=case when A.COUNT=2 then 3 ELSE A.COUNT END WHERE A.code_num =?");
					  pstmt1.setString(1, inCarNum);
					  pstmt1.setString(2, inLocNum);
					  pstmt1.setString(3, code_num);
					  pstmt1.executeUpdate();
				}else if(count.equals("3")){
					  pstmt1=conn.prepareStatement("UPDATE a_section AS A SET A.A_car_num4=case when A.COUNT=3 then ? ELSE A.A_car_num4 end ,A.A_location4=case when A.COUNT=3 then ? ELSE A.A_location4 END ,A.COUNT=case when A.COUNT=3 then 4 ELSE A.COUNT END WHERE A.code_num =?");
					  pstmt1.setString(1, inCarNum);
					  pstmt1.setString(2, inLocNum);
					  pstmt1.setString(3, code_num);
					  pstmt1.executeUpdate();
				}
		 }/* else{
			 System.out.println("A_04등록되지 않은 차량일때");
			 pstmt2=conn.prepareStatement("INSERT INTO commonpeople (car_num, location) VALUES (?, ?)");
			 pstmt2.setString(1, inCarNum);
			 pstmt2.setString(2, inLocNum);
			 pstmt2.executeUpdate();
			 
		 } */
	 }else if(inLoc.equals("B") & ! "".equals(inLocNum)){
		 System.out.println("B_03둘다 값있음");
		 
		 pstmt0=conn.prepareStatement("INSERT INTO commonpeople (car_num, location) VALUES (?, ?)");
		 pstmt0.setString(1, inCarNum);
		 pstmt0.setString(2, inLocNum);
		 pstmt0.executeUpdate();
		 
		 pstmt=conn.prepareStatement("SELECT B.code_num,B.count from car_list AS CL INNER join b_section AS B ON B.code_num=CL.code_num WHERE CL.car_num1=? OR CL.car_num2=? OR CL.car_num3=? or CL.car_num4=?");
		 pstmt.setString(1, inCarNum);
		 pstmt.setString(2, inCarNum);
		 pstmt.setString(3, inCarNum);
		 pstmt.setString(4, inCarNum);
		 
		 rs=pstmt.executeQuery();
		 //System.out.println(rs.next());
		 if(rs.next()){
			 code_num=rs.getString("code_num");
			 	System.out.println(code_num+"<<<<---code_num");
			 count=rs.getString("count");
				 System.out.println(count+"<<<<---count");
			 
		
	
				if(count.equals("0")){
				  pstmt1=conn.prepareStatement("UPDATE b_section AS A SET A.B_car_num1=case when A.COUNT=0 then ? ELSE A.B_car_num1 end ,A.B_location1=case when A.COUNT=0 then ? ELSE A.B_location1 END ,A.COUNT=case when A.COUNT=0 then 1 ELSE A.COUNT END WHERE A.code_num =?");
				  pstmt1.setString(1, inCarNum);
				  pstmt1.setString(2, inLocNum);
				  pstmt1.setString(3, code_num);
				  pstmt1.executeUpdate();
				}else if(count.equals("1")){
				  pstmt1=conn.prepareStatement("UPDATE b_section AS A SET A.B_car_num2=case when A.COUNT=1 then ? ELSE A.B_car_num2 end ,A.B_location2=case when A.COUNT=1 then ? ELSE A.B_location2 END ,A.COUNT=case when A.COUNT=1 then 2 ELSE A.COUNT END WHERE A.code_num =?");
				  pstmt1.setString(1, inCarNum);
				  pstmt1.setString(2, inLocNum);
				  pstmt1.setString(3, code_num);
				  pstmt1.executeUpdate();
				}else if(count.equals("2")){
					  pstmt1=conn.prepareStatement("UPDATE b_section AS A SET A.B_car_num3=case when A.COUNT=2 then ? ELSE A.B_car_num3 end ,A.B_location3=case when A.COUNT=2 then ? ELSE A.B_location3 END ,A.COUNT=case when A.COUNT=2 then 3 ELSE A.COUNT END WHERE A.code_num =?");
					  pstmt1.setString(1, inCarNum);
					  pstmt1.setString(2, inLocNum);
					  pstmt1.setString(3, code_num);
					  pstmt1.executeUpdate();
				}else if(count.equals("3")){
					  pstmt1=conn.prepareStatement("UPDATE b_section AS A SET A.B_car_num4=case when A.COUNT=3 then ? ELSE A.B_car_num4 end ,A.B_location4=case when A.COUNT=3 then ? ELSE A.B_location4 END ,A.COUNT=case when A.COUNT=3 then 4 ELSE A.COUNT END WHERE A.code_num =?");
					  pstmt1.setString(1, inCarNum);
					  pstmt1.setString(2, inLocNum);
					  pstmt1.setString(3, code_num);
					  pstmt1.executeUpdate();
				}
		 }/* else{
			 System.out.println("B_05등록되지 않은 차량일때");
			 pstmt2=conn.prepareStatement("INSERT INTO commonpeople (car_num, location) VALUES (?, ?)");
			 pstmt2.setString(1, inCarNum);
			 pstmt2.setString(2, inLocNum);
			 pstmt2.executeUpdate();
			 
		 } */
	 }
		 /* pstmt=conn.prepareStatement("UPDATE a_section AS A set A.A_car_num1=case when A.COUNT=0 then ? ELSE A.A_car_num1 end,A.A_location1=case when A.COUNT=0 then ? ELSE A.A_location1 END,A.COUNT=case when A.COUNT=0 then 1 ELSE A.COUNT END,A.A_car_num2=case when A.COUNT=1 then ? ELSE A.A_car_num2 end,A.A_location2=case when A.COUNT=1 then ? ELSE A.A_location2 END,A.COUNT=case when A.COUNT=1 then 2 ELSE A.COUNT END,A.A_car_num3=case when A.COUNT=2 then ? ELSE A.A_car_num3 end,A.A_location3=case when A.COUNT=2 then ? ELSE A.A_location3 END,A.COUNT=case when A.COUNT=2 then 3 ELSE A.COUNT END,A.A_car_num4=case when A.COUNT=3 then ? ELSE A.A_car_num4 end,A.A_location4=case when A.COUNT=3 then ? ELSE A.A_location4 END,A.COUNT=case when A.COUNT=3 then 4 ELSE A.COUNT END");
		pstmt.setString(1, inCarNum);
		pstmt.setString(2, inLocNum);
		pstmt.setString(3, inCarNum);
		pstmt.setString(4, inLocNum);
		pstmt.setString(5, inCarNum);
		pstmt.setString(6, inLocNum);
		pstmt.setString(7, inCarNum);
		pstmt.setString(8, inLocNum);
		
		pstmt.executeUpdate(); */
		
		 response.sendRedirect(request.getContextPath()+"/insert/insert.jsp");

	
 	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
 	
 	
	
	
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}


%>
