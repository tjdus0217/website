<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/bssi.jsp"%>

<jsp:useBean id="dto" class="bbs.bbsDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
	Map map=new HashMap();

	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	
	dao.reply_ansnum(map);   //기존 답변에 대한 답변 순서의 변경
	
	flag=dao.reply_create(dto);  //답변처리
	
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
	<% if(flag){
		out.print("글 답변을 성공했습니다.");
	}else{
		out.print("글 답변을 실패했습니다.");
	}	
	%>
</div>
	
	<button class="btn btn-default" onclick="location.href='./createForm.jsp'">다시등록</button>
	<button class="btn btn-default" onclick="listb()">목록</button>
	
	
	
</div>

</body>
</html>