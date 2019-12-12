<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%> 
<%
	String col= Utility.checkNull(request.getParameter("col"));
	String word= Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")) word="";
	
	int nowPage=1;
	int recordPerPage=3;
	
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno=(nowPage-1)*recordPerPage+1;
	int eno=nowPage*recordPerPage;
	
	Map map=new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	list=dao.list(map);
	
	int total=dao.total(map); 
	String paging=Utility.paging(total, nowPage, recordPerPage, col, word);
%>

<!DOCTYPE html>
<html>
<head>
  <title>회원가입</title>
  <meta charset="utf-8">
 
 <script type="text/javascript">
 function read(id){
	 var url="<%=root%>/member/read.jsp";
	 url+="?id="+id;
	 
	 location.href=url;
 }
 
 
 </script>
 
</head>

<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">회원목록</h2><br>
<form class="form-inline" 
	  method="post" 
	  action="list.jsp">
<div class="form-group">
	<select name="col" class="form-control">
		<option value="mname" <%if(col.equals("mname")) out.print("selected");%>>성명</option>
		<option value="id" <%if(col.equals("id")) out.print("selected");%>>아이디</option>
		<option value="email" <%if(col.equals("email")) out.print("selected");%>>E-mail</option>
		<option value="total" <%if(col.equals("total")) out.print("selected");%>>전체출력</option>
	</select>
</div>

<div class="form-group">
	<input type="text" class="form-control" name="word" required="required" value=<%=word%>>
</div>

<button class="btn btn-default">검색</button>
<button class="btn btn-default" type="button" onclick="location.href='createForm.jsp'">등록</button>

</form> <br>


<%
	for(int i=0;i<list.size();i++){ 
	MemberDTO dto=list.get(i);
%>     

<table class="table table-bordered">
<tr>
	<td rowspan="5" class="col-sm-2">      <%// 이건 5줄 잡아서 앞으로 5줄에는 첫 열 안써도 됨 %>
	<img src="<%=root%>/member/storage/<%=dto.getFname() %>" class="img-rounded" width="200px" height="200px">
	</td>
	<th class="col-sm-2">아이디</th>
	<td class="col-sm-8"><a href="javascript:read('<%=dto.getId() %>')"><%=dto.getId() %></a></td>
</tr>

<tr>
	<th class="col-sm-2">이름</th>
	<td class="col-sm-8"><%=dto.getMname() %></td>
</tr>

<tr>
	<th class="col-sm-2">전화번호</th>
	<td class="col-sm-8"><%=dto.getTel() %></td>
</tr>

<tr>
	<th class="col-sm-2">이메일</th>
	<td class="col-sm-8"><%=dto.getEmail() %></td>
</tr>

<tr>
	<th class="col-sm-2">주소</th>
	<td class="col-sm-8">(<%=dto.getZipcode() %>)
						 <%=dto.getAddress1() %><%=dto.getAddress2() %>
	</td>
</tr>
</table>

<% } %> <br><br><br>

<%=paging %>



</div>

</body>
</html>