<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id");
System.out.println(pw + "<- pw");
String dbid = "id001";
String dbpw = "pw001";
String dbname = "김동준";
String alert = null;
if(id.equals(dbid)){
	System.out.println("01아이디일치");
	if(pw.equals(dbpw)){
		System.out.println("03로그인성공");
		session.setAttribute("ID", id);
		session.setAttribute("NAME", dbname);
		//System.out.println(session.getAttribute("ID"));
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
		alert = "로그인성공";
	}else{
		System.out.println("04비번불치");
		alert = "비번불일치";
	}
}else{
	System.out.println("02아이디불일치");
	alert = "아이디불일치";
}
%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>
