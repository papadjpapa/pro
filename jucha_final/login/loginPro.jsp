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
String dbname = "�赿��";
String alert = null;
if(id.equals(dbid)){
	System.out.println("01���̵���ġ");
	if(pw.equals(dbpw)){
		System.out.println("03�α��μ���");
		session.setAttribute("ID", id);
		session.setAttribute("NAME", dbname);
		//System.out.println(session.getAttribute("ID"));
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
		alert = "�α��μ���";
	}else{
		System.out.println("04�����ġ");
		alert = "�������ġ";
	}
}else{
	System.out.println("02���̵����ġ");
	alert = "���̵����ġ";
}
%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>
