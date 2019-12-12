<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html> 
<html>
<head>
  <title>업로드</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg">

<%
	String upDir="/test2/storage";
	String tempDir="test2/temp";
	
	upDir=application.getRealPath(upDir);
	tempDir=application.getRealPath(tempDir);
	
	DiskFileItemFactory diskFileUpload=new DiskFileItemFactory();
	
	diskFileUpload.setRepository(new File(tempDir)); //서버에 어떤 경로로 올 것인지 메소드로 사용
	
	ServletFileUpload upload=new ServletFileUpload(diskFileUpload);
	
	upload.setHeaderEncoding("utf-8");
	
	List<FileItem> items=upload.parseRequest(request);//전체폼의 파라미터 요청을 가져오는 것
	Iterator<FileItem> params=items.iterator();
	
	while(params.hasNext()){ 
		FileItem item=params.next();
		
		if(item.isFormField()){  //일반 파라메터
			String name=item.getFieldName();    //이름
			String value=item.getString("utf-8");  //값
			
			out.println(name+"="+value+"<br>");
		}else{ //일반 파라메터가 아님(파일임)
			String fileFieldName=item.getFieldName(); //이름
			String fileName=item.getName(); //전체령로
			String contentType=item.getContentType(); //타입
			
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1); //마지막 경로위치 찾아서 순수파일명
		
			long fileSize=item.getSize(); //파일크기
			
			File file=new File(upDir+"/"+fileName);
			item.write(file); //파일 객체를 write(보냄)함
			
			  out.println("-----------------------------------<br>");
		        out.println("요청 파라미터 이름 : " + fileFieldName  + "<br>");
		        out.println("저장 파일 이름 : " + fileName + "<br>");
		        out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
		        out.println("파일 크기 : " + fileSize+"<br>");
			
		}
	}

%>




</div>
 
</div>
</body>
</html>
 