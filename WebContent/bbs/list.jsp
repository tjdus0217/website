<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/bssi.jsp"%>
<% 
	//검색 관련 
	String word=Utility.checkNull(request.getParameter("word"));
	String col=Utility.checkNull(request.getParameter("col"));
	
	if(col.equals("total")) word="";
	
	//페이징 관련
	int nowPage=1;
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage=5;   //한 페이지당 보여줄 레코드 개수
	
	int sno=((nowPage-1)*recordPerPage) +1;
	int eno=nowPage*recordPerPage;
	
	
	
	Map map=new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	list=dao.list(map); 
    iter=list.iterator();
    
    int total=dao.total(map);
%>  

<!DOCTYPE html>
<html>
<head>
  <title>Bbs</title>
  <meta charset="utf-8">
  
  <script type="text/javascript">
  function read(bbsno){
	  var url="read.jsp";
	  url+="?bbsno="+bbsno;
	  url+= "&col=<%=col%>";
	  url+= "&word=<%=word%>";
	  url+= "&nowPage=<%=nowPage%>";
	  location.href=url;   
  }
  
  </script>
  
</head>


<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h2>Bbs List</h2>

<form class="form-inline" action="./list.jsp">
    <div class="form-group">
      <select class="form-control" name="col">
      	<option value="wname" 
		<%if(col.equals("wname")) out.print("selected"); %>
		>Writer</option>
      	<option value="title"
      	<%if(col.equals("title")) out.print("selected"); %>
      	>Title</option>
      	<option value="content"
      	<%if(col.equals("content")) out.print("selected"); %>
      	>Content</option>
      	<option value="title_content"
      	<%if(col.equals("title_content")) out.print("selected"); %>
      	>Title+Content</option>
      	<option value="total"
      	<%if(col.equals("total")) out.print("selected"); %>
      	>All</option>
      </select>
     </div>
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="<%=word %>">     <%//word의 값을 받을 수 있도록 위에 변수 선언함 %>
    </div>
	<button type="submit" class="btn btn-default">Search</button>
    <button type="button" class="btn btn-default" 
   				 onclick="location.href='./createForm.jsp'">Write</button>
  </form>


<table class="table table-striped">
<thead>
  <tr>
	<th>No.</th>
	<th>Title</th>
	<th>Writer</th>
	<th>grpno</th>
	<th>indent</th>
	<th>ansnum</th>
  </tr>
</thead>
<tbody>
<% 
	if(list.size()==0){
%>		
	<tr><td colspan="6">등록된 글이 없습니다.</td>
<%		
	}else{
	
	while(iter.hasNext()) {
	bbsDTO dto=iter.next();
	
	%>
	<tr>
  	  <td><%=dto.getBbsno()%></td>
	  <td>  <%// %>
	  <% for(int r=0; r<dto.getIndent();r++){
		  out.print("&nbsp;&nbsp;");}
	  		if(dto.getIndent()>0){
	  			out.print("<img src='../images/re.jpg'>");
	  		}
		  %>
	  
	  <a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle()%></a>
	
	  <% if(Utility.compareDay(dto.getWdate())){%>
	  <img src="<%=root %>/images/new.gif">
	  <% } %>
	  </td>
	  <td><%=dto.getWname()%></td>
	  <td><%=dto.getGrpno()%></td>
	  <td><%=dto.getIndent()%></td>
	  <td><%=dto.getAnsnum()%></td>
    </tr>
  <%} 
}%>

</tbody>
</table>
<div>

<%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
</div>

</div>

</body>
</html>