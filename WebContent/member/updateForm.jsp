<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>

 
<%
    String id = request.getParameter("id");
    
	if(id==null){
		id=(String)session.getAttribute("id");
	}

    MemberDTO dto = dao.read(id);
 %>
<!DOCTYPE html>
<html>
<head>
<title>Member</title>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                                 
                } 
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<style type="text/css">
#need {
color: red;
}
</style>

<script type="text/javascript">


	function emailMsg(){
      alert("이메을 수정을 원하시면 email 변경 버튼을 사용하세요");
    }

	function emailCheck(){
    var url = "email_form.jsp";
	wr = window.open(url,"이메일검색","width=500,height=500");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2); 
	 }
 

    function incheck(f){
	      if(f.tel.value.length==0){
	        alert("전화번호을 입력하세요");
	        f.tel.focus();
	        return false;
	      }
	      if(f.email.value.length==0){
	        alert("이메일을 입력하세요");
	        f.email.focus();
	        return false;
	      }
	      if(f.job.selectedIndex==0){
	        alert("직업을 선택하세요");
	        f.job.focus();
	        return false;
	      }
    }
  </script>
  
</head>
<body>
<jsp:include page="/menu/top.jsp" />
<div class="container">
<br><h2>Member Update</h2><br>
<label>(<span id="need">*</span>
필수입력사항)
</label>
<form class="form-horizontal" 
      action="updateProc.jsp" 
      method="post"
    name="frm"
    onsubmit="return incheck(this)"
    >
    
<input type="hidden" name="id" value="<%=id %>" />
<div class="form-group">
<label class="control-label col-sm-2">ID: </label>
<label class="col-sm-3">
  <%=dto.getId() %>
</label>
</div>

<div class="form-group">
<label class="control-label col-sm-2">Name: </label>
<div class="col-sm-4">
<%=dto.getMname() %>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="tel"><span
id="need">*</span>Phone: </label>
<div class="col-sm-4">
<input type="text" name="tel" id="tel" 
class="form-control" value="<%=dto.getTel()%>">
</div>
</div>
 
<div class="form-group">
<label class="control-label col-sm-2" for="email"><span
id="need">*</span>E-mail</label>
<div class="col-sm-3">
<input type="email" name="email" id="email" 
class="form-control" value="<%=dto.getEmail()%>" 
readonly="readonly" onclick="emailMsg()">
</div>

<button type="button" onclick="emailCheck()"
        class="btn col-sm-2"> Update Email</button>
</div>
 
<div class="form-group">
<label class="control-label col-sm-2" for="sample6_postcode">Zip-code</label>
<div class="col-sm-3">
<input type="text" name="zipcode" id="sample6_postcode" 
class="form-control" value="<%=dto.getZipcode()%>">
</div>
<button class="btn col-sm-2" type="button" 
onclick="sample6_execDaumPostcode()">Search</button>
</div>
<div class="form-group">
<label class="control-label col-sm-2" for="sample6_address">Address</label>
<div class="col-sm-6">
<input type="text" name="address1" id="sample6_address"
class="form-control" value="<%=dto.getAddress1() %>"> 
<input type="text" name="address2" value="<%=dto.getAddress2() %>"
id="sample6_detailAddress" class="form-control">
</div>
</div>
<div class="form-group">
<label class="control-label col-sm-2" for="job"><span
id="need">*</span>직업</label>
<div class="col-sm-2">
<select name="job" class="form-control">
<option value="0">Select</option>
<option value="A01"
<% if(dto.getJob().equals("A01")) out.print("selected"); %>
>회사원</option>
<option value="A02"
<% if(dto.getJob().equals("A02")) out.print("selected"); %>
>전산관련직</option>
<option value="A03"
<% if(dto.getJob().equals("A03")) out.print("selected"); %>
>연구전문직</option>
<option value="A04"
<% if(dto.getJob().equals("A04")) out.print("selected"); %>
>각종학교학생</option>
<option value="A05"
<% if(dto.getJob().equals("A05")) out.print("selected"); %>
>일반자영업</option>
<option value="A06"
<% if(dto.getJob().equals("A06")) out.print("selected"); %>
>공무원</option>
<option value="A07"
<% if(dto.getJob().equals("A07")) out.print("selected"); %>
>의료인</option>
<option value="A08"
<% if(dto.getJob().equals("A08")) out.print("selected"); %>
>법조인</option>
<option value="A09"
<% if(dto.getJob().equals("A09")) out.print("selected"); %>
>종교/언론/예술인</option>
<option value="A10"
<% if(dto.getJob().equals("A10")) out.print("selected"); %>
>기타</option>
</select>
</div>
</div>
<div class="form-group">
<div class="col-sm-offset-2 col-sm-5">
<button class="btn">Save</button>
<button type="reset" class="btn">Cancel</button>
 
</div>
</div>
</form>
</div>
</body>
</html>
 
 