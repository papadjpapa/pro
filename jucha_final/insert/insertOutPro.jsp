<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "my.pack.DriverDB" %>

<%
String outCarNum = request.getParameter("outCarNum");
System.out.println(outCarNum + "outCarNum");
String outLocNum = request.getParameter("outLocNum");
System.out.println(outLocNum+ "outLocNum");

String outLoc = null;
if(! "".equals(outLocNum)){
	outLoc= outLocNum.substring(0, 1);
	System.out.println(outLoc);
	
}

Connection conn = null;
PreparedStatement pstmt0 = null;

PreparedStatement pstmt = null;
PreparedStatement pstmt1 = null;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt3 = null;


ResultSet rs = null;
ResultSet rs1 = null;

String code_num=null;
String count=null;
String car_num = null;

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
	 if("".equals(outCarNum) & "".equals(outLocNum) & outLoc ==null){
		 System.out.println("01둘다 공백");
		 response.sendRedirect(request.getContextPath()+"/insert/insert.jsp");
	 }else if(! "".equals(outCarNum) & "".equals(outLocNum) & outLoc ==null){
		 System.out.println("02하나 공백");
		 response.sendRedirect(request.getContextPath()+"/insert/insert.jsp");
	 }else if(outLoc.equals("A") & ! "".equals(outLocNum)){
		 System.out.println("A_03둘다 값있음");
		 
		 pstmt=conn.prepareStatement("SELECT B.code_num,B.count from car_list AS CL INNER join a_section AS B ON B.code_num=CL.code_num WHERE CL.car_num1=? OR CL.car_num2=? OR CL.car_num3=? or CL.car_num4=?");
		 pstmt.setString(1, outCarNum);
		 pstmt.setString(2, outCarNum);
		 pstmt.setString(3, outCarNum);
		 pstmt.setString(4, outCarNum);
		 
		 rs=pstmt.executeQuery();
		 
		 //System.out.println(rs.next());
		 if(rs.next()){
			code_num=rs.getString("code_num");
			 	System.out.println(code_num+"<<<<---code_num");
			 count=rs.getString("count");
				 System.out.println(count+"<<<<---count");
					 
				 
			//2020-01-24-------이부분 수정해야함!!선택적으로 삭제업데이트해야지
				if(count.equals("1")){
				  pstmt1=conn.prepareStatement("UPDATE a_section AS A SET A.A_car_num1=case when A.A_car_num1=? then ? ELSE A.A_car_num1 end ,A.A_location1=case when A.A_location1=? then ? ELSE A.A_location1 END ,A.A_car_num2=case when A.A_car_num2=? then ? ELSE A.A_car_num2 end ,A.A_location2=case when A.A_location2=? then ? ELSE A.A_location2 END ,A.A_car_num3=case when A.A_car_num3=? then ? ELSE A.A_car_num3 end ,A.A_location3=case when A.A_location3=? then ? ELSE A.A_location3 END ,A.A_car_num4=case when A.A_car_num4=? then ? ELSE A.A_car_num4 end ,A.A_location4=case when A.A_location4=? then ? ELSE A.A_location4 END ,A.COUNT=case when A.COUNT=1 then 0 ELSE A.COUNT END WHERE A.code_num =?");
				  pstmt1.setString(1,outCarNum);
				  pstmt1.setString(2, "");
				  pstmt1.setString(3, outLocNum);
				  pstmt1.setString(4, "");
				  pstmt1.setString(5,outCarNum);
				  pstmt1.setString(6, "");
				  pstmt1.setString(7, outLocNum);
				  pstmt1.setString(8, "");
				  pstmt1.setString(9,outCarNum);
				  pstmt1.setString(10, "");
				  pstmt1.setString(11, outLocNum);
				  pstmt1.setString(12, "");
				  pstmt1.setString(13,outCarNum);
				  pstmt1.setString(14, "");
				  pstmt1.setString(15, outLocNum);
				  pstmt1.setString(16, "");
				  pstmt1.setString(17, code_num);
				  pstmt1.executeUpdate();
				}else if(count.equals("2")){
				  pstmt1=conn.prepareStatement("UPDATE a_section AS A SET A.A_car_num1=case when A.A_car_num1=? then ? ELSE A.A_car_num1 end ,A.A_location1=case when A.A_location1=? then ? ELSE A.A_location1 END ,A.A_car_num2=case when A.A_car_num2=? then ? ELSE A.A_car_num2 end ,A.A_location2=case when A.A_location2=? then ? ELSE A.A_location2 END ,A.A_car_num3=case when A.A_car_num3=? then ? ELSE A.A_car_num3 end ,A.A_location3=case when A.A_location3=? then ? ELSE A.A_location3 END ,A.A_car_num4=case when A.A_car_num4=? then ? ELSE A.A_car_num4 end ,A.A_location4=case when A.A_location4=? then ? ELSE A.A_location4 END ,A.COUNT=case when A.COUNT=2 then 1 ELSE A.COUNT END WHERE A.code_num =?");
				  pstmt1.setString(1,outCarNum);
				  pstmt1.setString(2, "");
				  pstmt1.setString(3, outLocNum);
				  pstmt1.setString(4, "");
				  pstmt1.setString(5,outCarNum);
				  pstmt1.setString(6, "");
				  pstmt1.setString(7, outLocNum);
				  pstmt1.setString(8, "");
				  pstmt1.setString(9,outCarNum);
				  pstmt1.setString(10, "");
				  pstmt1.setString(11, outLocNum);
				  pstmt1.setString(12, "");
				  pstmt1.setString(13,outCarNum);
				  pstmt1.setString(14, "");
				  pstmt1.setString(15, outLocNum);
				  pstmt1.setString(16, "");
				  pstmt1.setString(17, code_num);
				  pstmt1.executeUpdate();
				}else if(count.equals("3")){
					  pstmt1=conn.prepareStatement("UPDATE a_section AS A SET A.A_car_num1=case when A.A_car_num1=? then ? ELSE A.A_car_num1 end ,A.A_location1=case when A.A_location1=? then ? ELSE A.A_location1 END ,A.A_car_num2=case when A.A_car_num2=? then ? ELSE A.A_car_num2 end ,A.A_location2=case when A.A_location2=? then ? ELSE A.A_location2 END ,A.A_car_num3=case when A.A_car_num3=? then ? ELSE A.A_car_num3 end ,A.A_location3=case when A.A_location3=? then ? ELSE A.A_location3 END ,A.A_car_num4=case when A.A_car_num4=? then ? ELSE A.A_car_num4 end ,A.A_location4=case when A.A_location4=? then ? ELSE A.A_location4 END ,A.COUNT=case when A.COUNT=3 then 2 ELSE A.COUNT END WHERE A.code_num =?");
					  pstmt1.setString(1,outCarNum);
					  pstmt1.setString(2, "");
					  pstmt1.setString(3, outLocNum);
					  pstmt1.setString(4, "");
					  pstmt1.setString(5,outCarNum);
					  pstmt1.setString(6, "");
					  pstmt1.setString(7, outLocNum);
					  pstmt1.setString(8, "");
					  pstmt1.setString(9,outCarNum);
					  pstmt1.setString(10, "");
					  pstmt1.setString(11, outLocNum);
					  pstmt1.setString(12, "");
					  pstmt1.setString(13,outCarNum);
					  pstmt1.setString(14, "");
					  pstmt1.setString(15, outLocNum);
					  pstmt1.setString(16, "");
					  pstmt1.setString(17, code_num);
					  pstmt1.executeUpdate();
				}else if(count.equals("4")){
					  pstmt1=conn.prepareStatement("UPDATE a_section AS A SET A.A_car_num1=case when A.A_car_num1=? then ? ELSE A.A_car_num1 end ,A.A_location1=case when A.A_location1=? then ? ELSE A.A_location1 END ,A.A_car_num2=case when A.A_car_num2=? then ? ELSE A.A_car_num2 end ,A.A_location2=case when A.A_location2=? then ? ELSE A.A_location2 END ,A.A_car_num3=case when A.A_car_num3=? then ? ELSE A.A_car_num3 end ,A.A_location3=case when A.A_location3=? then ? ELSE A.A_location3 END ,A.A_car_num4=case when A.A_car_num4=? then ? ELSE A.A_car_num4 end ,A.A_location4=case when A.A_location4=? then ? ELSE A.A_location4 END ,A.COUNT=case when A.COUNT=4 then 3 ELSE A.COUNT END WHERE A.code_num =?");
					  pstmt1.setString(1,outCarNum);
					  pstmt1.setString(2, "");
					  pstmt1.setString(3, outLocNum);
					  pstmt1.setString(4, "");
					  pstmt1.setString(5,outCarNum);
					  pstmt1.setString(6, "");
					  pstmt1.setString(7, outLocNum);
					  pstmt1.setString(8, "");
					  pstmt1.setString(9,outCarNum);
					  pstmt1.setString(10, "");
					  pstmt1.setString(11, outLocNum);
					  pstmt1.setString(12, "");
					  pstmt1.setString(13,outCarNum);
					  pstmt1.setString(14, "");
					  pstmt1.setString(15, outLocNum);
					  pstmt1.setString(16, "");
					  pstmt1.setString(17, code_num);
					  pstmt1.executeUpdate();
				}
		 }else{
			 pstmt2=conn.prepareStatement("SELECT * FROM commonpeople WHERE car_num=?");
			 pstmt2.setString(1, outCarNum);
			 rs1= pstmt2.executeQuery();
			 //System.out.println(rs1.next()+"와와와와 되나보자!!!!!");
			 
			 if(rs1.next()){
				 car_num=rs1.getString("car_num"); 
				 System.out.println(car_num+"이것도 되나보자");
				 pstmt3=conn.prepareStatement("DELETE FROM commonpeople WHERE car_num=?");
				 pstmt3.setString(1, outCarNum);
				 pstmt3.executeUpdate();
			 }
			 
		 }
		 
		
		 pstmt0=conn.prepareStatement("DELETE FROM commonpeople WHERE car_num=?");
		 pstmt0.setString(1, outCarNum);
		 pstmt0.executeUpdate();
		 response.sendRedirect(request.getContextPath()+"/insert/insert.jsp");
		 
	 }else if(outLoc.equals("B") & ! "".equals(outLocNum)){
		 System.out.println("B_03둘다 값있음");
		 pstmt=conn.prepareStatement("SELECT B.code_num,B.count from car_list AS CL INNER join b_section AS B ON B.code_num=CL.code_num WHERE CL.car_num1=? OR CL.car_num2=? OR CL.car_num3=? or CL.car_num4=?");
		 pstmt.setString(1, outCarNum);
		 pstmt.setString(2, outCarNum);
		 pstmt.setString(3, outCarNum);
		 pstmt.setString(4, outCarNum);
		 
		 rs=pstmt.executeQuery();
		 //System.out.println(rs.next());
				 if(rs.next()){
					 code_num=rs.getString("code_num");
					 	System.out.println(code_num+"<<<<---code_num");
					 count=rs.getString("count");
						 System.out.println(count+"<<<<---count");
					 
				 
			
					if(count.equals("1")){
					  pstmt1=conn.prepareStatement("UPDATE b_section AS B SET B.B_car_num1=case when B.B_car_num1=? then ? ELSE B.B_car_num1 end ,B.B_location1=case when B.B_location1=? then ? ELSE B.B_location1 END ,B.B_car_num2=case when B.B_car_num2=? then ? ELSE B.B_car_num2 end ,B.B_location2=case when B.B_location2=? then ? ELSE B.B_location2 END ,B.B_car_num3=case when B.B_car_num3=? then ? ELSE B.B_car_num3 end ,B.B_location3=case when B.B_location3=? then ? ELSE B.B_location3 END ,B.B_car_num4=case when B.B_car_num4=? then ? ELSE B.B_car_num4 end ,B.B_location4=case when B.B_location4=? then ? ELSE B.B_location4 END ,B.COUNT=case when B.COUNT=1 then 0 ELSE B.COUNT END WHERE B.code_num =?");
					  pstmt1.setString(1,outCarNum);
					  pstmt1.setString(2, "");
					  pstmt1.setString(3, outLocNum);
					  pstmt1.setString(4, "");
					  pstmt1.setString(5,outCarNum);
					  pstmt1.setString(6, "");
					  pstmt1.setString(7, outLocNum);
					  pstmt1.setString(8, "");
					  pstmt1.setString(9,outCarNum);
					  pstmt1.setString(10, "");
					  pstmt1.setString(11, outLocNum);
					  pstmt1.setString(12, "");
					  pstmt1.setString(13,outCarNum);
					  pstmt1.setString(14, "");
					  pstmt1.setString(15, outLocNum);
					  pstmt1.setString(16, "");
					  pstmt1.setString(17, code_num);
					  pstmt1.executeUpdate();
					}else if(count.equals("2")){
					  pstmt1=conn.prepareStatement("UPDATE b_section AS B SET B.B_car_num1=case when B.B_car_num1=? then ? ELSE B.B_car_num1 end ,B.B_location1=case when B.B_location1=? then ? ELSE B.B_location1 END ,B.B_car_num2=case when B.B_car_num2=? then ? ELSE B.B_car_num2 end ,B.B_location2=case when B.B_location2=? then ? ELSE B.B_location2 END ,B.B_car_num3=case when B.B_car_num3=? then ? ELSE B.B_car_num3 end ,B.B_location3=case when B.B_location3=? then ? ELSE B.B_location3 END ,B.B_car_num4=case when B.B_car_num4=? then ? ELSE B.B_car_num4 end ,B.B_location4=case when B.B_location4=? then ? ELSE B.B_location4 END ,B.COUNT=case when B.COUNT=2 then 1 ELSE B.COUNT END WHERE B.code_num =?");
					  pstmt1.setString(1,outCarNum);
					  pstmt1.setString(2, "");
					  pstmt1.setString(3, outLocNum);
					  pstmt1.setString(4, "");
					  pstmt1.setString(5,outCarNum);
					  pstmt1.setString(6, "");
					  pstmt1.setString(7, outLocNum);
					  pstmt1.setString(8, "");
					  pstmt1.setString(9,outCarNum);
					  pstmt1.setString(10, "");
					  pstmt1.setString(11, outLocNum);
					  pstmt1.setString(12, "");
					  pstmt1.setString(13,outCarNum);
					  pstmt1.setString(14, "");
					  pstmt1.setString(15, outLocNum);
					  pstmt1.setString(16, "");
					  pstmt1.setString(17, code_num);
					  pstmt1.executeUpdate();
					}else if(count.equals("3")){
						  pstmt1=conn.prepareStatement("UPDATE b_section AS B SET B.B_car_num1=case when B.B_car_num1=? then ? ELSE B.B_car_num1 end ,B.B_location1=case when B.B_location1=? then ? ELSE B.B_location1 END ,B.B_car_num2=case when B.B_car_num2=? then ? ELSE B.B_car_num2 end ,B.B_location2=case when B.B_location2=? then ? ELSE B.B_location2 END ,B.B_car_num3=case when B.B_car_num3=? then ? ELSE B.B_car_num3 end ,B.B_location3=case when B.B_location3=? then ? ELSE B.B_location3 END ,B.B_car_num4=case when B.B_car_num4=? then ? ELSE B.B_car_num4 end ,B.B_location4=case when B.B_location4=? then ? ELSE B.B_location4 END ,B.COUNT=case when B.COUNT=3 then 2 ELSE B.COUNT END WHERE B.code_num =?");
						  pstmt1.setString(1,outCarNum);
						  pstmt1.setString(2, "");
						  pstmt1.setString(3, outLocNum);
						  pstmt1.setString(4, "");
						  pstmt1.setString(5,outCarNum);
						  pstmt1.setString(6, "");
						  pstmt1.setString(7, outLocNum);
						  pstmt1.setString(8, "");
						  pstmt1.setString(9,outCarNum);
						  pstmt1.setString(10, "");
						  pstmt1.setString(11, outLocNum);
						  pstmt1.setString(12, "");
						  pstmt1.setString(13,outCarNum);
						  pstmt1.setString(14, "");
						  pstmt1.setString(15, outLocNum);
						  pstmt1.setString(16, "");
						  pstmt1.setString(17, code_num);
						  pstmt1.executeUpdate();
					}else if(count.equals("4")){
						  pstmt1=conn.prepareStatement("UPDATE b_section AS B SET B.B_car_num1=case when B.B_car_num1=? then ? ELSE B.B_car_num1 end ,B.B_location1=case when B.B_location1=? then ? ELSE B.B_location1 END ,B.B_car_num2=case when B.B_car_num2=? then ? ELSE B.B_car_num2 end ,B.B_location2=case when B.B_location2=? then ? ELSE B.B_location2 END ,B.B_car_num3=case when B.B_car_num3=? then ? ELSE B.B_car_num3 end ,B.B_location3=case when B.B_location3=? then ? ELSE B.B_location3 END ,B.B_car_num4=case when B.B_car_num4=? then ? ELSE B.B_car_num4 end ,B.B_location4=case when B.B_location4=? then ? ELSE B.B_location4 END ,B.COUNT=case when B.COUNT=4 then 3 ELSE B.COUNT END WHERE B.code_num =?");
						  pstmt1.setString(1,outCarNum);
						  pstmt1.setString(2, "");
						  pstmt1.setString(3, outLocNum);
						  pstmt1.setString(4, "");
						  pstmt1.setString(5,outCarNum);
						  pstmt1.setString(6, "");
						  pstmt1.setString(7, outLocNum);
						  pstmt1.setString(8, "");
						  pstmt1.setString(9,outCarNum);
						  pstmt1.setString(10, "");
						  pstmt1.setString(11, outLocNum);
						  pstmt1.setString(12, "");
						  pstmt1.setString(13,outCarNum);
						  pstmt1.setString(14, "");
						  pstmt1.setString(15, outLocNum);
						  pstmt1.setString(16, "");
						  pstmt1.setString(17, code_num);
						  pstmt1.executeUpdate();
					}
	 
			 }else{
				 pstmt2=conn.prepareStatement("SELECT * FROM commonpeople WHERE car_num=?");
				 pstmt2.setString(1, outCarNum);
				 rs1= pstmt2.executeQuery();
				 //System.out.println(rs1.next()+"와와와와 되나보자!!!!!");
				 
				 if(rs1.next()){
					 car_num=rs1.getString("car_num");
					 System.out.println(car_num+"이것도 되나보자");
					 pstmt3=conn.prepareStatement("DELETE FROM commonpeople WHERE car_num=?");
					 pstmt3.setString(1, outCarNum);
					 pstmt3.executeUpdate();
				 }
				 
			 }
				 
				 pstmt0=conn.prepareStatement("DELETE FROM commonpeople WHERE car_num=?");
				 pstmt0.setString(1, outCarNum);
				 pstmt0.executeUpdate();
				 
				 response.sendRedirect(request.getContextPath()+"/insert/insert.jsp");
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
