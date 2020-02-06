<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
    
<!DOCTYPE html>


		
<%
String NAME = (String)session.getAttribute("NAME");

String id = (String)session.getAttribute("ID");

//System.out.println(name);


if(NAME == null){
%>		
<!-- 로그인전 화면 시작 -->
		<%@ include file = "/login/login.jsp" %>	
<!-- 로그인전 화면 End -->		
			
		
		 
<%}else if(NAME != null ){%>

<%	request.setCharacterEncoding("utf-8"); %>		
<%@ include file = "/main.jsp" %>	
 
		 
	

<br/><%}%>


		       