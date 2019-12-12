<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	String c_id="";
	String c_id_val="";
	
	Cookie[] cookies=request.getCookies();
	Cookie cookie=null;
	
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			cookie=cookies[i];
			
			if(cookie.getName().equals("c_id")){
				c_id=cookie.getValue();
			 }else if(cookie.getName().equals("c_id_val")){ 
				c_id_val=cookie.getValue();
			}
		}
	}



%>


<!DOCTYPE html>
<html>
<head>
  <title>Member</title>
  <meta charset="utf-8">
 
 <script type="text/javascript">
 function idFind(){
	 var url="idFind_Form.jsp";
	 
	 var wr= window.open(url,"아이디찾기","width=400, height=350");
		wr.moveTo((window.screen.width-400)/2, (window.screen.height-350)/2); 	 
 }
 
 function passwdFind(){
	 var url="passwdFind_Form.jsp";
	 
	 var wr= window.open(url,"비밀번호찾기","width=400, height=450");
		wr.moveTo((window.screen.width-400)/2, (window.screen.height-450)/2); 	 
 }
 
 </script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h2>Sign-In</h2><br>

<form class="form-horizontal" 
		action="<%=request.getContextPath() %>/member/loginProc.jsp"
		method="post">
		
<div class="form-group">
<label class="control-label col-sm-2" for="id">ID:</label>
<div class="col-sm-4">
<input type="text" class="form-control" id="id" placeholder="Enter id" name="id" 
				   required="required" value='<%=c_id_val %>'>				   
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="passwd">Password:</label>
<div class="col-sm-4">
<input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd" required="required">
</div>
</div>

<div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <div class="checkbox">
          <label>
          <% 
		   if(c_id.equals("Y")){
		%>          
          <input type="checkbox" name="c_id" value="Y" checked="checked"> Remember ID
       <%
			} else{ 
		%>
			<input type='checkbox' name='c_id' value='Y'> Remember ID
		<%
			}
		%>	
       
       </label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">Sign in</button>
        
         <button type="button" class="btn btn-default"
         		 onclick="location.href='agreement.jsp'">Join</button>
         <button type="button" class="btn btn-default" 
         		 onclick="idFind()">Find ID</button>
         <button type="button" class="btn btn-default"
                 onclick="passwdFind()">Find Password</button>
      </div>
    </div>
</form>
</div>

</body>
</html>