<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <style>
.well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #dfe0d9;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
}
</style> -->
   <script type="text/javascript" src="../jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$('[name=in]').click(function(){
			//console.log("나오나?") 오케이확인!
			var inLocNum= $('[name=inLocNum]').val();
			var inCarNum= $('[name=inCarNum]').val();
			$.ajax({
				  url: "../view/view.jsp",  	//호출할 주소(통신할 주소)
				  method: "POST",		//메서드 타입(get,post)
				  data: { inLocNum : inLocNum , inCarNum : inCarNum},	//전송할 데이터 
				  dataType: "json"		//통신할 데이터 타입
				  						/*
				  							통신할 데이터 타입으로 작성된 페이지에 접속하여 텍스트를 읽어 파싱한다.
				  							
				  							파싱 : 다른 포맷방식의 데이터를 사용할 수 있는 방식으로 바꾸는 작업
				  							파서 : 파싱하는데 사용되는 도구(Ajax 등)
					  					*/
				});
		})
		
		
		$('[name=out]').click(function(){
			//console.log("나오나?") 오케이확인!
			var outLocNum= $('[name=outLocNum]').val();
			$.ajax({
				  url: "../view/view.jsp",  	//호출할 주소(통신할 주소)
				  method: "POST",		//메서드 타입(get,post)
				  data: { outLocNum : outLocNum},	//전송할 데이터 
				  dataType: "json"		//통신할 데이터 타입
				  						/*
				  							통신할 데이터 타입으로 작성된 페이지에 접속하여 텍스트를 읽어 파싱한다.
				  							
				  							파싱 : 다른 포맷방식의 데이터를 사용할 수 있는 방식으로 바꾸는 작업
				  							파서 : 파싱하는데 사용되는 도구(Ajax 등)
					  					*/
				});
		})
		
		
	})
</script>


<div class="container">
    <div class="col-sm-12 pull-center well">
        <form class="form-inline" action="<%=request.getContextPath()%>/insert/insertInPro.jsp" method="POST">
           <!--  <center>  
                        <select class="form-control" name = "classification">
                            <option></option>
                            <option value = "TotalList_code">전체리스트(code)</option>
                            <option value = "loc_codeNum">위치_codeNum</option>
                            <option value = "loc_name">위치_name</option>
                            <option value = "loc_carNum">위치_carNum</option>
                            <option value = "loc_phoneNum">위치_phoneNum</option>
                        </select> -->
                    
                    <center>
                       <div class="input-group custom-search-form">
                            <input type="text" class="form-control" name="inCarNum" placeholder="차량번호">
                            <input type="text" class="form-control" name="inLocNum" placeholder="위치">
                        </div>
                             <span class="input-group-btn">
                                 <input class="btn btn-default" name="in" type="submit" value = "in">
                    
                             </span>
        </form>
        <form class="form-inline" action="<%=request.getContextPath()%>/insert/insertOutPro.jsp" method="POST">
        
                             <br><br>
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" name="outCarNum" placeholder="차량번호">
                            <input type="text" class="form-control" name="outLocNum" placeholder="위치">
                        </div>
                             <span class="input-group-btn">
                                 <input class="btn btn-default" name="out" type="submit" value = "out">
                    
                             </span>
         </form>
                        
    </div>