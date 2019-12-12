package bbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class bbsTest {
	
	
	public static void main(String[] args) {
		
		bbsDAO dao=new bbsDAO();
		
		//total(dao);
		
		list(dao);
		//create(dao);
		//upViewcnt(dao);
		//read(dao);
		//passCheck(dao);
		//update(dao);
		//delete(dao);
	}

	
	
	private static void total(bbsDAO dao) {
		Map map=new HashMap();
		map.put("col", "wname");
		map.put("word","눈" );
		
		p("레코드개수: "+dao.total(map));
		
	}



	private static void delete(bbsDAO dao) {
		int bbsno=2;
		if(dao.delete(bbsno)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}



	private static void update(bbsDAO dao) {
		bbsDTO dto=dao.read(2);
		dto.setWname("왕눈이");
		dto.setTitle("실습예제");
		dto.setContent("어렵습니다.");
		
		if(dao.update(dto)) {p("성공");}
		else { p("실패");}
	}



	private static void passCheck(bbsDAO dao) {
		Map map=new HashMap();
		map.put("bbsno", 5);
		map.put("passwd","1234");
		if(dao.passCheck(map)) {
			p("올바른 비번입니다.");
		}else {
			p("잘못된 비번입니다.");
		}
	}


	
	private static void read(bbsDAO dao) {
		int bbsno=2;
		bbsDTO dto=dao.read(bbsno);
		p(dto);
	}


	
	private static void upViewcnt(bbsDAO dao) {
		int bbsno=2;
		dao.upViewcnt(bbsno);
	}

	
	
	private static void create(bbsDAO dao) {
		bbsDTO dto=new bbsDTO();
		
		dto.setWname("박길동");
		dto.setTitle("제목이에요");
		dto.setContent("내용이에요");
		dto.setPasswd("1234");
				
		if(dao.create(dto)) {
			p("성동");
		} else {
			p("실패");
		}
	}

	
	
	private static void list(bbsDAO dao) {
		
		Map map=new HashMap();
		map.put("col", "wname");
		map.put("word","" );
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<bbsDTO> list=dao.list(map);
		
		Iterator<bbsDTO> iter=list.iterator();
		
		while(iter.hasNext()) {
			bbsDTO dto=iter.next();
			p(dto);
			p("======================");
		}	
	}
	
	
	
	
	
	
	
	
	
	private static void p(String string) {
		System.out.println(string);
	}

	private static void p(bbsDTO dto) {
		p("번호: "+dto.getBbsno());
		p("글쓴이: "+dto.getWname());
		p("제목: "+dto.getTitle());
		p("내용: "+dto.getContent());
		p("날찌: "+dto.getWdate());
		p("조회수: "+dto.getViewcnt());
	}

}
