<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%> 
<jsp:useBean id="dto" class="member.MemberDTO"/>
<% 
	UploadSave upload=(UploadSave)request.getAttribute("upload");

	dto.setId(upload.getParameter("id"));
	dto.setEmail(upload.getParameter("email"));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel")); 
	dto.setZipcode(upload.getParameter("zipcode"));
	//uploadsave.encode로 한글처리.
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setJob(UploadSave.encode(upload.getParameter("job")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));

	FileItem fileItem=upload.getFileItem("fname"); //file upload 되어진 것 참조
	int size=(int)fileItem.getSize(); //크기를 가져와야 진짜 올라갔는지 확인 가능
	
	String fname=UploadSave.saveFile(fileItem, upDir);

	if(size>0){
		dto.setFname(fname);
	}else{
		dto.setFname("member.jpg"); 
	}
	
	flag=dao.create(dto);
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
<div class="well well-lg">
<%
	if(flag){
		out.print("회원가입 성공");
	}else{
		out.print("회원가입 실패");
	}
%>
</div>

<button onclick="location.href='loginForm.jsp'" class="btn btn-default">Sign-In</button>
<button onclick="location.href='../index.jsp'" class="btn btn-default">Home</button>

</div>

</body>
</html>