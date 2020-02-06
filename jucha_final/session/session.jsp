<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String inLocNum=request.getParameter("inLocNum");
System.out.println(inLocNum+"ajax값 받기");
String arr[] = new String[20];
for(int i = 0 ; i < arr.length ; i++){
	arr[i]="A-"+(i+1);
	
	if(inLocNum.equals(arr[i])){
		session.setAttribute(arr[i], inLocNum);
		
	}
	System.out.println(arr[i]+" arr에 잘 들어가는지 확인");
}
System.out.println(session.getAttribute(arr[7])+"이게 되면 뭐 다 된거지");
//System.out.println(arr[1]);


%>