package board;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class BoardCheck {

	public static void main(String[] args) {
		BoardDAO dao=new BoardDAO();
		update(dao);
		//create(dao);
		//list(dao);
		//read(dao);
		//upCount(dao);
		//total(dao);
	}

	private static void update(BoardDAO dao) {
		BoardDTO dto=dao.read(16);
		dto.setName("홍길동");
		dto.setSubject("제목수정");
		dto.setContent("내용수정");
		dto.setFilename("test2.txt");
		dto.setFilesize(150);
		
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void total(BoardDAO dao) {
		Map map=new HashMap();
		map.put("col", "name");
		map.put("word","" );
		
		p("total : "+dao.total(map));
		
	}
	
	private static void list(BoardDAO dao) {
			
			Map map=new HashMap();
			map.put("col", "name");
			map.put("word","" );
			map.put("sno", 1);
			map.put("eno", 5);
			
			List<BoardDTO> list=dao.list(map);
			
			Iterator<BoardDTO> iter=list.iterator();
			
			while(iter.hasNext()) {
				BoardDTO dto=iter.next();
				p(dto);
				p("======================");	
		}
	}

	private static void upCount(BoardDAO dao) {
		int num=2;
		dao.upCount(num);
		
	}

	private static void read(BoardDAO dao) {
		int num=2;
		BoardDTO dto=dao.read(num);
		p(dto);
		
	}

	private static void create(BoardDAO dao) {
		BoardDTO dto=new BoardDTO();
		
		 dto.setName("왕눈이");
		 dto.setSubject("mvc 게시판");
		 dto.setContent("mvc 게시판 실습");
		 dto.setPasswd("1234");
		 dto.setIp("127.0.0.1");
		 dto.setFilename("test.txt");
		 dto.setFilesize(100);
		
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	
	
	private static void p(String string) {
		System.out.println(string);
	}

	private static void p(BoardDTO dto) {
		p("번호: "+dto.getNum());
		p("글쓴이: "+dto.getName());
		p("제목: "+dto.getSubject());
		p("내용: "+dto.getContent());
		p("참조: "+dto.getRef());
		p("날찌: "+dto.getRegdate());
		p("IP: "+dto.getIp());
		p("파일명: "+dto.getFilename());
		p("파일크기: "+dto.getFilesize());
				
	}
	
	
	
}