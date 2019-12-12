package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import utility.DBClose;
import utility.DBOpen;

public class bbsDAO {
	
	
	public boolean checkRefnum(int bbsno) {
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(refnum) ");
		sql.append(" from bbs ");
		sql.append(" where refnum=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs=pstmt.executeQuery();
			
			rs.next();
			
			int cnt=rs.getInt(1);
			
			
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}		
		return flag;
	}
	
	
	
	public boolean reply_create(bbsDTO dto) {  //답변을 등록하면서 
		boolean flag=false;
	
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into bbs(bbsno, wname, title, content, passwd, wdate, ");  
		sql.append(" grpno, indent, ansnum, refnum) ");
		sql.append(" values((select nvl(max(bbsno),0)+1 as bbsno from bbs), ?, ?, ?, ?, sysdate, "); 			
		sql.append(" ?, ?, ?, ? ) ");	
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getWname());  
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			
			pstmt.setInt(5, dto.getGrpno()); //얘는 부모의 값과 동일해야 하고
			pstmt.setInt(6, dto.getIndent()+1); // 부모의 값보다 1이 커야 함
			pstmt.setInt(7, dto.getAnsnum()+1);
			
			pstmt.setInt(8, dto.getBbsno()); //부모의 글번호를 refnum 에 insert
			
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0) flag=true;			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	
	
	public void reply_ansnum(Map map) {
	
	Connection con=DBOpen.open();
	PreparedStatement pstmt=null;
		
	int grpno=(Integer)map.get("grpno");
	int ansnum=(Integer)map.get("ansnum");
	
	StringBuffer sql=new StringBuffer();
		sql.append(" update bbs ");
		sql.append(" set ansnum=ansnum+1 ");
		sql.append(" where grpno=? and ansnum>? ");  // 부모의 grpno와 같고, ansnum보다 큰 것에 대하여 
	                     // 기존 답변의 순서를 변경하고 있는 것
	try {
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, grpno);		
		pstmt.setInt(2, ansnum);  // 둘 다 부모의 값
		
		pstmt.executeUpdate();
				
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		DBClose.close(con, pstmt);
	}

}
	
	
	public bbsDTO reply_read(int bbsno) {
		bbsDTO dto=null;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
			sql.append(" select bbsno, grpno, indent, ansnum, title ");
			           //bbsno, grpno, indent, ansnum를 읽어오는 것이 중요
			sql.append(" from bbs ");
			sql.append(" where bbsno=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new bbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setTitle(rs.getString("title"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}

		
		return dto;
	}
	
	

	public boolean delete(int bbsno) {
		boolean flag=false;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" delete from bbs ");
		sql.append(" where bbsno=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());	
			pstmt.setInt(1, bbsno);	
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
	
	
	
	public boolean update(bbsDTO dto) {
		boolean flag=false;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" update bbs set wname=?,title=?, ");
		sql.append(" content=? where bbsno=?");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getBbsno());
			
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}		
		return flag;
	}
	
	

		public boolean passCheck(Map map) {  //수정, 삭제시 본인이 쓴 글만 가능하도록 PW체크 해야 함.
							// 각 값을 저장하기 위해 MAP에 글번홓와 PW 저장해두고 필요할 때 꺼내옴.(data가 들어와 있다고 볼 것->)
			boolean flag=false;
			
			Connection con=DBOpen.open();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			int bbsno=(Integer)map.get("bbsno");
			String passwd=(String)map.get("passwd");
						
			StringBuffer sql=new StringBuffer();
			sql.append(" select count(bbsno) as cnt from bbs "); 
			sql.append(" where bbsno=? and passwd=? "); //내 글번호와 PW가 맞아야 함.
			
			
			try {
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, bbsno);
				pstmt.setString(2, passwd);

				rs=pstmt.executeQuery();  //전송할 쿼리문응ㄹ select 하려고
				
				rs.next(); //그동안 if나 while을 쓴 경우는 data가 있을수도 있고 없을수도 있어서였는데, 얘는 값이 없어도 count가 0이라는 값을 리턴하므로
				           //rs는 무조건 결과값이 있으므로 읽어올 수 있음
				int cnt=rs.getInt("cnt");
				if(cnt>0) flag=true;
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBClose.close(con, pstmt, rs);
			}	
			return flag;
		}
		
		
	
	public bbsDTO read(int bbsno) {
		bbsDTO dto=null;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;  //data를 읽어와서 사용자에게 보여줄 것이므로 rs 필요
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select bbsno, wname, title, content, viewcnt, wdate ");
		sql.append(" from bbs where bbsno=?  ");	//where조건을 이용해서 한 건을 레코드를 읽어옴
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {  //true 인 경우
				dto=new bbsDTO(); //dto 객체를 생성 후 아래의 값들 넣음
				dto.setBbsno(bbsno);
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} DBClose.close(con, pstmt, rs);
		return dto;  //dto 경과 리턴
	}
	
	
	
	public void upViewcnt(int bbsno) {   //조회수 증가. 결과는 필요 없어서 void. 보고 있는 글에 대해서만! bbsno를 가져와야 함.
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		//update는 dml이므로 결과 받을 필요 없음
		StringBuffer sql=new StringBuffer();
		sql.append(" update bbs set viewcnt=viewcnt+1 ");
		sql.append(" where bbsno=?  ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);  //bbsno의 값을 받을 것
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		DBClose.close(con, pstmt);
		}
	}
	
	

	public boolean create(bbsDTO dto) {  //새 글을 저장. 매개변수가 dto인 것은 DB에 저장할 새로운 내용이라는 뜻
		boolean flag=false;             //insert한 값이 성공인지 실패인지를 쉽게 알기 위해 boolean 선언
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		
		sql.append(" insert into bbs(bbsno, wname, title, content, passwd, wdate, grpno) ");  //bbsno라는 일련번호가 연속되기 위해
		sql.append(" values((select nvl(max(bbsno),0)+1 as bbsno from bbs), ?, ?,?,?,sysdate, "); //max 에서 1씩 증가. 
						//근데 최초의 값이 null인 경우 값을 넣을 수 없기 때문에 nvl을 사용하여 null값을 0으로 변환시켜서 최초의 값 1회 넣어줌
		sql.append(" (select nvl(max(grpno),0)+1 from bbs)) ");	
		
		try {
			pstmt=con.prepareStatement(sql.toString());  //전송객체 획득 후 ? 해결.
			pstmt.setString(1, dto.getWname());  //dto값을 읽어와서 각각 담을 것. set은 연결이야
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			
			int cnt=pstmt.executeUpdate();  //쿼리분 DB서버에 보내서 insert해서 컴파일해서 int그릇(cnt)에 받음
				if(cnt>0) {  //0보다 크다는 것은 1이 나온 것
					flag=true;
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
		}
	

	public int total(Map map) {
		int total=0;
		
		Connection con=DBOpen.open();  
		PreparedStatement pstmt=null;  
		ResultSet rs=null;
		
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(*) from bbs ");
		if(word.length()>0 && col.equals("title_content")) {     //total이 온 경우!
			sql.append(" 		where title like '%'||?||'%' ");
			sql.append("		or content like '%'||?||'%' ");                             
		}else if(word.length()>0) {
			sql.append(" 		where "+col+" like '%'||?||'%' ");
		}		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			if(word.length()>0 && col.equals("title_content")) {     //total이 온 경우!
				pstmt.setString(1, word);
				pstmt.setString(2, word);
			}else if(word.length()>0) {
				pstmt.setString(1, word);				
			}
			
			rs=pstmt.executeQuery();
			rs.next();
			
			total=rs.getInt(1);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return total;
	}
	
	
	
	
	
	
	public List<bbsDTO> list(Map map){  //여러개의 레코드를 가져오는 것
		List<bbsDTO> list=new ArrayList<bbsDTO>();
			
		Connection con=DBOpen.open();  //DB랑 연결
		PreparedStatement pstmt=null;   //쿼리문 보내고(전송객체)
		ResultSet rs=null;  //그 결과를 받아야 함
		
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		int sno= (Integer)map.get("sno");
		int eno=(Integer)map.get("eno");
		
		StringBuffer sql= new StringBuffer();
		
		sql.append(" SELECT bbsno, wname, title, viewcnt, to_char(wdate, 'yyyy-mm-dd') wdate, grpno, indent, ansnum, r ");
		sql.append(" FROM ( ");
		sql.append("    SELECT bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum, rownum r ");
		sql.append("    FROM( ");
		sql.append(" 		select bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum ");  //이 쿼리를 검색하라고
		sql.append(" 			from bbs ");
			if(word.length()>0 && col.equals("title_content")) {     //total이 온 경우!
				sql.append(" 		where title like '%'||?||'%' ");
				sql.append("		or content like '%'||?||'%' ");                             
			}else if(word.length()>0) {
				sql.append(" 		where "+col+" like '%'||?||'%' ");
			}									//연결기호
		sql.append(" 			order by grpno desc, ansnum ");
		sql.append(" ) ");
		sql.append(" ) where r>=? and r<=? ");

		
		try {
			int i=0;  //이렇게 넣으면 1개씩 증가가 되어 순번이 어떤 형태로 오든 숫자가 제대로 들어감
			
			pstmt=con.prepareStatement(sql.toString()); //전송객체를 획득, 만약?가 있다면 값을 세팅해야 함
			if(word.length()>0 && col.equals("title_content")) {     //total이 온 경우!
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);
			
			}else if(word.length()>0) {
				pstmt.setString(++i, word);				
			
			}	
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs=pstmt.executeQuery();  //DB에 결과를 전송하라고. 그럼 한 번에 결과를 컴파일해서 rs로 받음
			
			//rs는 처음에 컬럼을 가리키는데 자체로는 get을 못해서 next사용하여 값이 true인 경우 다음 값을 get으로 받음
			while(rs.next()) {    //rs가 true일 때
				bbsDTO dto=new bbsDTO();//dto 생성하여 영역을 잡음
				
				dto.setBbsno(rs.getInt("bbsno"));  //rs에서 bbsno를 꺼내서(get) dto의 bbsno에 저장(set)
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
				list.add(dto);//앞에서 잡은 list의 영역에 dto의 해시코드에 저장한 다음 다시 앞으로 돌아감(flase)가 될 때까지
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);  //다 닫음 다음
		}
		return list;  //list 반환
	}
}
