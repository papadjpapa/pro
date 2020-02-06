<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	request.setCharacterEncoding("euc-kr"); %>
<%

String classification = request.getParameter("classification");
System.out.println(classification);
String search = request.getParameter("search");
System.out.println(search);

	if(classification.equals("") & search.equals("")){%>
	 <%@ include file = "/searchPro/searchPro1.jsp" %>	
<% }else if(! classification.equals("") & search.equals("")){%>
	 <%@ include file = "/searchPro/searchPro1.jsp" %>	
<% }else if(classification.equals("TotalList_code") & ! search.equals("")){ %>
	 <%@ include file = "/searchPro/searchPro2.jsp" %>	
<% }else if(classification.equals("loc_codeNum") & ! search.equals("")){  %>
	 <%@ include file = "/searchPro/searchPro3.jsp" %>	
<% }else if(classification.equals("loc_name") & ! search.equals("")){ %>
	 <%@ include file = "/searchPro/searchPro4.jsp" %>
<% }else if(classification.equals("loc_carNum") & ! search.equals("")){ %>	
 	 <%@ include file = "/searchPro/searchPro5.jsp" %>
<% } %> 


