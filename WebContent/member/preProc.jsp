<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
 	
	String id = upload.getParameter("id");
	String email = upload.getParameter("email");

	String str="";
	
	if(dao.duplicatedId(id)){
		str="중복된 아이디입니다. 아이디를 다시 입력해주세요";
	}else if(dao.duplicatedEmail(email)){
		str="중복된 이메일입니다. 이메일을 다시 입력해주세요";
	}else{      //보낸 파일과 파라메터를 받아서 dto에 저장하고 db에 저장해야 하는데 여기에 나머지 부분을 다 넣기는 너무 많아. 
		
		request.setAttribute("upload", upload);
		
%>		        <%//그래서 forward라는 액션태그를 해서 다른 페이지로 넘길거야 %>
		<jsp:forward page="/member/createProc.jsp"/>      <%//여기서 가져갈 코드는 없지만, upload를 가져다 쓸 수 있기 위해 forward로 호출. 이거  이해 안되면 A, B 확인하기 %>
<%
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
  <title>Member</title>
  <meta charset="utf-8">
 
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg"><br>
<%=str %>
</div>

<button onclick="history.back()" class="btn btn-default">Re-Try</button>
      
</div>

</body>
</html>