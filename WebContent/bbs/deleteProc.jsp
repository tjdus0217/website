<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/bssi.jsp"%>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String passwd=request.getParameter("passwd");
	
	Map map=new HashMap();
	
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);
	
	boolean pflag=dao.passCheck(map);
	
	if(pflag){
		flag=dao.delete(bbsno);
	}



%>




<!DOCTYPE html>
<html>
<head>
  <title>Bbs</title>
  <meta charset="utf-8">
  
  	<script type="text/javascript">
 	function listb(){
 		var url="list.jsp";
 		url+="?col=<%=request.getParameter("col")%>";
 		url+="&word=<%=request.getParameter("word")%>";
 		url+="&nowPage=<%=request.getParameter("nowPage")%>";
 		
 		location.href=url;
 	}
 	
 	</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg">

	<% if(!pflag){
		out.print("잘못된 비밀번호 입니다.");
	} else if(flag){
		out.print("글 삭제를 성공했습니다.");
	}else{
		out.print("글 삭제를 실패했습니다.");
	}
	
	%>
    </div>
    
    
<%if(!pflag){%>
<button class="btn btn-default" onclick="history.back()">다시시도</button>
<%} %>

<button  class="btn btn-default" onclick="location.href='createForm.jsp'">다시등록</button>
<button class="btn btn-default" onclick="listb()">목록</button>

</body>
</html>