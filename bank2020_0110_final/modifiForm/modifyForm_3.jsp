<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/testThemaCSS.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<script type="text/javascript" src="../jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var len = 0;
	$(document).on('click','.addBtn',function(){
		var sum = $(this).parents().find('.option:first').clone();
		if($('.option').length <4){
			sum.find('[name=hangmok]').val('');
			sum.find('[name=money]').val('');
			$(this).parents().find('.plan-selection').eq(1).append(sum);
			
		}
		len = $('.option').length
		console.log(len);
		
		
	})
	
	$(document).on('click','.delBtn',function(){
		 if($('.option').length >1 ){
			 $(this).parents().find('.option:last').remove(); 
		 }
			
		
	})
	
	 $(document).on('click','.modify',function(){
			for(var i = 0 ; i < $('.option').length ; i++){
				if(
				   $('[name=hangmok]').eq(i).val() == null || $('[name=hangmok]').eq(i).val() =="" 
				   || 
				   $('[name=money]').eq(i).val() == null || $('[name=money]').eq(i).val() == ""){
					alert('�׸� �Ǵ� �ݾ��� �Է��ϼ���');
					return false;
					
				
				}
			}		
	
			var len2=0;
			
			len2 = $('.option').length;
			console.log(len2+"�������");
			var request = $.ajax({
				  url: "modifyForm_3.jsp",  	//ȣ���� �ּ�(����� �ּ�)
				  method: "POST",		//�޼��� Ÿ��(get,post)
				  data: { sendLength : len2},	//������ ������ 
				  dataType: "json"		//����� ������ Ÿ��
				  						/*
				  							����� ������ Ÿ������ �ۼ��� �������� �����Ͽ� �ؽ�Ʈ�� �о� �Ľ��Ѵ�.
				  							
				  							�Ľ� : �ٸ� ���˹���� �����͸� ����� �� �ִ� ������� �ٲٴ� �۾�
				  							�ļ� : �Ľ��ϴµ� ���Ǵ� ����(Ajax ��)
					  					*/
				});
			//$('.myForm').submit();
			var uCurrent = $('[name=current]').val();
			var hangmok=[];
			var money=[];
			for(var i = 0 ; i < $('.option').length ; i++){
				hangmok[i] = $('[name=hangmok]').eq(i).val();
				money[i] = $('[name=money]').eq(i).val();
						
			}		
			//console.log(hangmok+"ŰŰ����");
			$.ajax({
				  url: "modifyPro.jsp",  	//ȣ���� �ּ�(����� �ּ�)
				  method: "POST",		//�޼��� Ÿ��(get,post)
				  data: { 'hangmok[]' : hangmok, 'money[]' : money, uCurrent : uCurrent },	//������ ������ 
				  dataType: "json"		//����� ������ Ÿ��
				  						/*
				  							����� ������ Ÿ������ �ۼ��� �������� �����Ͽ� �ؽ�Ʈ�� �о� �Ľ��Ѵ�.
				  							
				  							�Ľ� : �ٸ� ���˹���� �����͸� ����� �� �ִ� ������� �ٲٴ� �۾�
				  							�ļ� : �Ľ��ϴµ� ���Ǵ� ����(Ajax ��)
					  					*/
				});
			
	}) 
		
	
	$(document).on('click','.release',function(){
		 var len3=0;
		 $.ajax({
			  url: "modifyForm_3.jsp",  	//ȣ���� �ּ�(����� �ּ�)
			  method: "POST",		//�޼��� Ÿ��(get,post)
			  data: { sendLength : len3},	//������ ������ 
			  dataType: "json"		//����� ������ Ÿ��
			  						/*
			  							����� ������ Ÿ������ �ۼ��� �������� �����Ͽ� �ؽ�Ʈ�� �о� �Ľ��Ѵ�.
			  							
			  							�Ľ� : �ٸ� ���˹���� �����͸� ����� �� �ִ� ������� �ٲٴ� �۾�
			  							�ļ� : �Ľ��ϴµ� ���Ǵ� ����(Ajax ��)
				  					*/
			});
	 })
	
		
	
	
	
	 
	
</script>

<%

String sendLength= request.getParameter("sendLength");
System.out.println(sendLength+"�޾ƿ� ������ ����������������");

String name = (String)session.getAttribute("NAME");
String id2 = (String)session.getAttribute("ID");

Connection conn2 = null;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt3 = null;
ResultSet rs = null;

String uCurrent = null;
String hangmok1 = null;
String hangmok2 = null;
String hangmok3 = null;
String hangmok4 = null;
String money1 = null;
String money2 = null;
String money3 = null;
String money4 = null;

String optionLength = sendLength;



Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/bank?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "idbank";
	String dbPass = "pwbank";
	conn2 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	//System.out.println(conn + "<-- conn m_search_list.jsp");
	if(conn2 != null){
		out.println("01 DB���� ����");
	}else{
		out.println("02 DB���� ����");
	}
	
	pstmt2=conn2.prepareStatement("update bank_table set u_option=? where u_id=?");
 	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
 	pstmt2.setString(1, sendLength);
 	pstmt2.setString(2, id2);
 	
	 pstmt2.executeUpdate();
	// System.out.println("���� ������");
	 //System.out.println(hangmok[1] + "���� ������");
	 pstmt3=conn2.prepareStatement("select * from bank_table where u_id=?");
	 pstmt3.setString(1, id2);
	 
	 rs = pstmt3.executeQuery();
	 if(rs.next()){
		 uCurrent = rs.getString("u_current");
		 hangmok1 = rs.getString("u_hangmok1");
		 hangmok2 = rs.getString("u_hangmok2");
		 hangmok3 = rs.getString("u_hangmok3");
		 hangmok4 = rs.getString("u_hangmok4");
		 money1 = rs.getString("u_money1");
		 money2 = rs.getString("u_money2");
		 money3 = rs.getString("u_money3");
		 money4 = rs.getString("u_money4");
		 
		 
	 }
	// System.out.println(hangmok1 + "�� �޾�����?");
	 
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}
	if (pstmt3 != null) try { pstmt3.close(); } catch(SQLException ex) {}
	if (conn2 != null) try { conn2.close(); } catch(SQLException ex) {}
}


%>




</head>
<body> 

 	<%@ include file = "/modifyModule/modify_3.jsp" %>



	 
</body> 
</html>