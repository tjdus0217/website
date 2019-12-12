<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp"%>
<% 
   
	String word=Utility.checkNull(request.getParameter("word"));
	String col=Utility.checkNull(request.getParameter("col"));

	   
   int nowPage=1;
   if(request.getParameter("nowPage")!=null){
	   	nowPage=Integer.parseInt(request.getParameter("nowPage"));
   }
   int recordPerPage=5;
   
	int sno=((nowPage-1)*recordPerPage) +1;
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
  <title>Memo</title>
  <meta charset="utf-8">
  
	<script type="text/javascript">
	function read(memono){
		var url="read.jsp";
		url+="?memono="+memono;
		url+="&col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href=url;
	}
	</script>

</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
 <br><h2>Memo List</h2>
 
 <form class="form-inline" action="list.jsp">
 	<div class="form-group">
 		<select class="form-control" name="col">
 			<option value="title" <% if(col.equals("title")) out.print("selected"); %>>Title</option>
 			
 			<option value="content" <% if(col.equals("content")) out.print("selected"); %>>Content</option>
 			 			
 			<option value="title_content" <% if(col.equals("title_content")) out.print("selected"); %>>Title+Content</option>
 			 			
 			<option value="total" 	<% if(col.equals("total")) out.print("selected"); %>>All</option>
 			 		
 		</select>
 	</div>
	<div class="form-group">
		<input type="text" name="word" class="form-control" placeholder="검색어 입력" value="<%=word%>">
	</div>
	<button class="btn btn-defalut">Search</button>
	<button class="btn btn-defalut" type="button" onclick="location.href='createForm.jsp'">Write</button>	
 </form>

  <table class="table table-striped">
   <thead>
    <tr>
    <th>No.</th>
    <th>Title</th>
    <th>Date</th>
    <th>ViewCount</th>
    </tr>
   </thead>
   <tbody>
<% if(list.size()==0){ %> 
   <tr><td colspan="4">등록된 방명록이 없습니다.</td>
 
<% }else{
  
	iter=list.iterator();
	while(iter.hasNext()){
		MemoDTO dto=iter.next();
	
	%> 
   <tr>
    <td><%=dto.getMemono()%></td>
    <td><a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a>
  	
  	 <% if(Utility.compareDay(dto.getWdate())){%>
	  <img src="<%=root %>/images/new.gif">
	  <% } %>
    
    
    </td>
    	    
    <td><%=dto.getWdate() %></td>
    <td><%=dto.getViewcnt() %></td>
    </tr>
<%  
   }}
%>  
   </tbody>
  
  </table>
  <div>
   <%=paging %>
  </div>
</div>
</body> 
</html> 
 
 
 
 