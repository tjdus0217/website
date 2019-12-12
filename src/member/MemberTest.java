package member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import member.MemberDTO;

public class MemberTest {

	public static void main(String[] args) {

		MemberDAO dao=new MemberDAO();
		
		//idCheck(dao);
		//emailCheck(dao);
		//create(dao);
		//list(dao);
		//total(dao);
		read(dao);
	}
	
	
	private static void read(MemberDAO dao) {
		MemberDTO dto=dao.read("key");
		p(dto);
		
	}


	private static void total(MemberDAO dao) {
		Map map=new HashMap();
		
		map.put("col", "id");
		map.put("word", "");
		
		p("레코드 개수: "+dao.total(map));
		
	}


	private static void list(MemberDAO dao) {
		
		Map map=new HashMap();
		
		map.put("col", "id");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<MemberDTO> list=dao.list(map);
		Iterator<MemberDTO> iter=list.iterator();
		
		while(iter.hasNext()) {
			MemberDTO dto=iter.next();
			p(dto);
			p("---------------");
		}
		
	}


	private static void p(MemberDTO dto) {
		p("id: "+dto.getId());
		p("이름: "+dto.getMname());
		p("이메일: "+dto.getEmail());
		p("전화번호: "+dto.getTel());
		p("우편번호: "+dto.getZipcode());
		p("주소: "+dto.getAddress1());
		p("상세주소: "+dto.getAddress2());
		p("직업: "+dto.getJob());
		p("등록날짜: "+dto.getMdate());
		p("사진: "+dto.getFname());
		
		
	}


	private static void create(MemberDAO dao) {
		MemberDTO dto=new MemberDTO();
		
		dto.setId("test");
		dto.setEmail("test@mail.com");
		dto.setMname("홍길동");
		dto.setPasswd("1234");
		dto.setTel("010-000-0000");
		dto.setZipcode("1235");
		dto.setAddress1("ddd");
		dto.setAddress2("222");
		dto.setJob("A01");
		dto.setFname("member.jpg");
		
		
	if(dao.create(dto)) {
		p("성공");
	} else {
		p("실패");
	}
		
	}


	private static void emailCheck(MemberDAO dao) {
		if(dao.duplicatedEmail("email2@mail.com")) {
		p("중복된 이메일");
		} else {
		p("사용가능항 이메일");
		}
	}
	
	
	private static void idCheck(MemberDAO dao) {
		if(dao.duplicatedId("user4")) {
		p("중복된 아이디");
		} else {
		p("사용가능항 아이디");
		}
	}
	

	
	private static void p(String string) {
		System.out.println(string);
	}

	

}


