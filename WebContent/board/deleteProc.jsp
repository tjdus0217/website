<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/board_ssi.jsp"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String passwd=request.getParameter("passwd");
	
	Map map=new HashMap();
	
	map.put("num", num);
	map.put("passwd", passwd);
	
	boolean pflag=dao.passCheck(map);
	
	if(pflag){
		flag=dao.delete(num);
	}



%>



<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
  
  	<script type="text/javascript">
 	function listB(){
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
    
<button class="btn btn-default" onclick="listB()">List</button>
<%if(!pflag){%>
<button class="btn btn-default" onclick="history.back()">Re-Try</button>
<%} %>



</body>
</html>