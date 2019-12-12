<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
   
<jsp:setProperty name="dto" property="title"/>
<jsp:setProperty property="content" name="dto"/>  


<% 
	flag=dao.create(dto);
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Memo</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
  <div class="container">

    <div class="well well-lg">
    
      <%if(flag){
	    out.print("Success");
        }else{ 
	    out.print("It is failed. Please Try again.");
		}	
      %>
     </div>
     
  <button class="btn" type="button" onclick="location.href='./createForm.jsp'">Re-Try</button>
  <button class="btn" type="button" onclick="location.href='./list.jsp'">List</button>

</div>
</body> 
</html> 

	
 