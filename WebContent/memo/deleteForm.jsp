<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Memo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<form method ="post" class="form-horizantal"
	action="deleteProc.jsp">
	<input type="hidden" name="memono" value="<%=request.getParameter("memono") %>">
	  <input type="hidden" name="col" value="<%=request.getParameter("col") %>">  
  <input type="hidden" name="word" value="<%=request.getParameter("word") %>">
   <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
   
	<div class="jumbotron">
	<h3>삭제 확인</h3>
	  <p>삭제를 하면 복구 될 수 없습니다.<br><br>
		삭제하시려면 삭제버튼을 클릭하세요<br><br>
		취소는 '목록'버튼을 누르세요</p>
	
	</div>
	<button class="btn">삭제</button>
	<button type="button" class="btn" onclick="listM()'">목록</button>
	
	</form>



</div>
</body> 
</html> 