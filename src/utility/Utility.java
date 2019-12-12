package utility;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

public class Utility {
	
	public static String getCodeValue(String code) {
		String jobname=null;
		
		Hashtable<String, String> codes=new Hashtable<String, String>();
		
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구전문직");
		codes.put("A04", "각종학교학생");
		codes.put("A05", "일반자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "기타");
		
		jobname=codes.get(code);		
		
		return jobname;
	}
	
	
	  
	public static List<String> getDay(){
		List<String> list=new ArrayList<String>();
		
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		
		for(int i=0;i<3;i++) {
		list.add(sd.format(cal.getTime()));  //형재 날짜를 해당 포맷으로 가져오겠다
		cal.add(Calendar.DATE, -1);
		}
		
		return list;
	}
	
	
	public static boolean compareDay(String wdate) {
		boolean flag=false;
		
		List<String> list=getDay();
		if(wdate.equals(list.get(0))         //오늘
				|| wdate.equals(list.get(1)) //어제
				|| wdate.equals(list.get(2))) //그제 날짜와 같다면 보여줌
		{ flag=true;}
		
		return flag;
	}
	
	

	public static String checkNull(String str) {
		if(str==null) {
			str="";
		}
		return str;		
	}	
	
	/** 
	  * @param totalRecord 전체 레코드수 
	  * @param nowPage     현재 페이지 
	  * @param recordPerPage 페이지당 레코드 수  
	  * @param col 검색 컬럼  
	  * @param word 검색어
	  * @return 페이징 생성 문자열
	  */ 
	
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
	   int pagePerBlock = 5; // 블럭당 페이지 수 
	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지   ceil은 올림! 3.3이 나오면 4페이지로
	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹  pagePerBlock으로 나눠지는 묶음이 한 그룹
	   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
	   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
	    
	   StringBuffer str = new StringBuffer(); 
	   str.append("<div style='text-align:center'>"); 
	   str.append("<ul class='pagination'> ");
	   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
	   if (nowGrp >= 2){ 
	     str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></li>"); 
	   } 
	 
	   for(int i=startPage; i<=endPage; i++){ 
	     if (i > totalPage){ 
	       break; 
	     } 
	 
	     if (nowPage == i){ 
	       str.append("<li class='active'><a href=#>"+i+"</a></li>"); 
	     }else{ 
	       str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></li>");   
	     } 
	   } 
	       
	   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
	   if (nowGrp < totalGrp){ 
	     str.append("<li><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A></li>"); 
	   } 
	   str.append("</ul>"); 
	   str.append("</div>"); 
	    
	   return str.toString(); 
	} 
	
	
}
