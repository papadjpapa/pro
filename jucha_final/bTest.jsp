<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
String inLocNum = "A-1";
System.out.println(inLocNum);
session.setAttribute("name", inLocNum);
%>
<script>
var sen='<%=session.getAttribute("name")%>';
//console.log(sen)
var index = sen.substring(2)
console.log(index+"iindex값 받기");
var name="[name=A-" + index +"]"
console.log(name+"이거 되나");

var strA = "A-";

console.log(strA+"1");
</script>

<body>

</body>
</html>