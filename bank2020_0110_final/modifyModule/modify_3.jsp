<div class="content">
<div class="container">
	 <div class="row">
					
                <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
                    <div class="box">
                        <h3 class="box-title">Select Your Hosting Plan</h3>
                       <div class="plan-selection">
                            <div class="plan-data">
                                <button type="button" class="delBtn">DELETE</button>
								<button type="button" class="addBtn">ADD</button>
                            </div>
                            current    <input type="text" name="current" value=<%=uCurrent %> placeholder="current">
                        </div>
                        <div class="plan-selection">
                           <div class="option">
								<input type="text" name="hangmok" value=<%=hangmok1 %> placeholder="hangmok">
								<input type="text" name="money" value=<%=money1 %> placeholder="money">
						   </div>		
						   <div class="option">
								<input type="text" name="hangmok" value=<%=hangmok2 %> placeholder="hangmok">
								<input type="text" name="money" value=<%=money2 %> placeholder="money">
						   </div>
						   <div class="option">
								<input type="text" name="hangmok" value=<%=hangmok3 %> placeholder="hangmok">
								<input type="text" name="money" value=<%=money3 %> placeholder="money">
						   </div>		
                        </div>
                        <form class = "myForm" action="<%=request.getContextPath() %>/index.jsp">
								<input type="submit" class="modify" value="modify">
								<input type="submit" class="cancel" value="cancel">
								<input type="submit" class="release" value="release">
						</form>
						
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				  <div class="widget">
		                        <h4 class="widget-title"><%= name %> welcome! </h4>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                                <div class="summary-head"><a href="<%= request.getContextPath() %>/logout/logout.jsp">LOGOUT</a></div>
		                               
		                            </div>
		                        </div>
		                        <div class="summary-block">
		                            <div class="summary-content">
		                               <div class="summary-head"><a href="<%= request.getContextPath() %>/modifiForm/modifyForm_3.jsp?sendLength=<%=optionLength%>">UPDATE</a></div>
		                              
		                            </div>
		                        </div>
		                    
		                </div>
		            </div>
	</div>
</div>
</div> 