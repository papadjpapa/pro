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
<div class="container">
    <div class="col-sm-12 pull-center well">
        <form class="form-inline" action="<%=request.getContextPath()%>/search/searchList.jsp" method="POST">
            <center>  
                        <select class="form-control" name = "classification">
                            <option></option>
                            <option value = "TotalList_code">전체리스트(code)_등록차량</option>
                            <option value = "loc_codeNum">위치_codeNum_등록차량</option>
                            <option value = "loc_name">위치_name_등록차량</option>
                            <option value = "loc_carNum">위치_carNum_일반차량</option>
                            <!-- <option value = "loc_carNum">위치_carNum</option>
                            <option value = "loc_phoneNum">위치_phoneNum</option> -->
                        </select>
                    
                    
                       <div class="input-group custom-search-form">
                            <input type="text" class="form-control" name="search" placeholder="Search...">
                                <span class="input-group-btn">
                                    <input class="btn btn-default" type="submit" value = "search">
                                      
                                    
                                </span>
                        </div>
                        
        </form>
    </div>
</div>
