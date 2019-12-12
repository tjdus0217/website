package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bbs.bbsDTO;
import utility.DBClose;
import utility.DBOpen;

public class BoardDAO {
	
	
	
//reply
	public boolean reply_create(BoardDTO dto) {  //답변을 등록하면서 
		boolean flag=false;
	
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into board(num, name, subject, content, ref,indent, ansnum, ");  
		sql.append(" regdate,passwd,ip, filename, filesize,refnum) ");
		sql.append(" values(board_seq.nextval, ?, ?,?,?, ?,?, ") ; 			
		sql.append(" sysdate, ?,?,?,?,?) ");	
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getRef()); 
			pstmt.setInt(5, dto.getIndent()+1); 
			pstmt.setInt(6, dto.getAnsnum()+1);
			
			
			pstmt.setString(7, dto.getPasswd());
			pstmt.setString(8, dto.getIp());
			pstmt.setString(9, dto.getFilename());
			pstmt.setInt(10, dto.getFilesize());
		
			pstmt.setInt(11, dto.getNum()); //부모의 글번호를 refnum 에 insert
			
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0) flag=true;			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	

public void upAnsnum(Map map) {
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		int ref=(Integer)map.get("ref");
		int ansnum=(Integer)map.get("ansnum");		
				
		StringBuffer sql=new StringBuffer();
		sql.append(" update board set ansnum = ansnum + 1 ");
		sql.append(" where ref =  ? ");
		sql.append(" and  ansnum >  ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, ref);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		
	}
	
	
	
	public void reply_ansnum(Map map) {
	
	Connection con=DBOpen.open();
	PreparedStatement pstmt=null;
		
	int ref=(Integer)map.get("ref");
	int ansnum=(Integer)map.get("ansnum");
	
	StringBuffer sql=new StringBuffer();
		sql.append(" update board ");
		sql.append(" set ansnum=ansnum+1 ");
		sql.append(" where ref=? and ansnum>? ");  
		
	try {
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, ref);		
		pstmt.setInt(2, ansnum);  // 둘 다 부모의 값
		
		pstmt.executeUpdate();
				
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		DBClose.close(con, pstmt);
	}

}
	
	
	public BoardDTO reply_read(int num) {
		BoardDTO dto=null;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
			sql.append(" select ref, indent, ansnum, subject "); 
			sql.append(" from board ");
			sql.append(" where num=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new BoardDTO();
				dto.setRef(rs.getInt("ref"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setSubject(rs.getString("subject"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}

		
		return dto;
	}	
	
	
//delete
	public boolean delete(int num) {
		boolean flag=false;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" delete from board ");
		sql.append(" where num=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());	
			pstmt.setInt(1, num);	
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
	

	public boolean checkRef(int num) {
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(ref) ");
		sql.append(" from board ");
		sql.append(" where ref=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
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
	
	

//update	
	public boolean update(BoardDTO dto) {
		boolean flag=false;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" update board set name=?, subject=?, ");
		sql.append(" content=? ");
		
		if(dto.getFilesize()>0) {
			sql.append(" , filename=? , filesize=? ");
		}
		
		sql.append(" where num=?");
		
		try {
			
			int i=0; 
			
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setString(++i, dto.getName());
			pstmt.setString(++i, dto.getSubject());
			pstmt.setString(++i, dto.getContent());
			if(dto.getFilesize()>0) {
				pstmt.setString(++i, dto.getFilename());
				pstmt.setInt(++i, dto.getFilesize());
			} 
			pstmt.setInt(++i, dto.getNum());
			
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
		
		int num=(Integer)map.get("num");
		String passwd=(String)map.get("passwd");
					
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(num) as cnt from board "); 
		sql.append(" where num=? and passwd=? "); //내 글번호와 PW가 맞아야 함.
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);

			rs=pstmt.executeQuery();  
			
			rs.next(); 
			int cnt=rs.getInt("cnt");
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}	
		return flag;
	}
	
	
	
	
	
//read
	public BoardDTO read(int num) {
	
		BoardDTO dto=null;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select num, name, subject, content, ref, count, regdate, ip, filename,filesize ");
		sql.append(" from board where num = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			 
			if(rs.next()) {
				dto=new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRef(rs.getInt("ref"));
				dto.setCount(rs.getInt("count"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setIp(rs.getString("ip"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}

	
	public void upCount(int num) {
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" update board set count=count+1 ");
		sql.append(" where num=?  ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num); 
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		DBClose.close(con, pstmt);
		}
	}

	
//list
	public List<BoardDTO> list(Map map){  
		List<BoardDTO> list=new ArrayList<BoardDTO>();
			
		Connection con=DBOpen.open();  
		PreparedStatement pstmt=null;   
		ResultSet rs=null;  
		
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		int sno= (Integer)map.get("sno");
		int eno=(Integer)map.get("eno");
		
		StringBuffer sql= new StringBuffer();
		
		sql.append(" SELECT num, name, subject, to_char(regdate, 'yyyy-mm-dd') regdate,count,filename, ref, indent, ansnum, r ");
		sql.append(" FROM ( ");
		sql.append("    SELECT num, name, subject, regdate,count,filename, ref, indent, ansnum, rownum r ");
		sql.append("    FROM( ");
		sql.append(" 		SELECT num, name, subject, regdate,count,filename, ref, indent, ansnum ");  
		sql.append(" 		FROM board ");
			if(word.length()>0 && col.equals("subject_content")) {     
				sql.append(" 		where subject like '%'||?||'%' ");
				sql.append("		or content like '%'||?||'%' ");                             
			}else if(word.length()>0) {
				sql.append(" 		where "+col+" like '%'||?||'%' ");
			}								
		sql.append(" 			order by ref desc, ansnum  asc ");
		sql.append(" ) ");
		sql.append(" ) where r>=? and r<=? ");

		
		try {
			int i=0;  
			
			pstmt=con.prepareStatement(sql.toString()); 
			if(word.length()>0 && col.equals("subject_content")) {     
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);
			
			}else if(word.length()>0) {
				pstmt.setString(++i, word);				
			
			}	
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs=pstmt.executeQuery(); 
			
			
			while(rs.next()) {    
				BoardDTO dto=new BoardDTO();
				
				dto.setNum(rs.getInt("num")); 
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
			
				dto.setRegdate(rs.getString("Regdate"));
				dto.setCount(rs.getInt("count"));
				dto.setFilename(rs.getString("filename"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);  //다 닫음 다음
		}
		return list;  //list 반환
	}
	

	public int total(Map map) {
		int total=0;
		
		Connection con=DBOpen.open();  
		PreparedStatement pstmt=null;   
		ResultSet rs=null;
		
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		
		StringBuffer sql= new StringBuffer();
		
		sql.append(" select count(*) as cnt from board ");
	
		if(word.length()>0 && col.equals("subject_content")) {     //total이 온 경우!
			sql.append(" 		where subject like '%'||?||'%' ");
			sql.append("		or content like '%'||?||'%' ");                             
		}else if(word.length()>0) {
			sql.append(" 		where "+col+" like '%'||?||'%' ");
		}
		
		try {
			pstmt=con.prepareStatement(sql.toString());
		
			if(word.length()>0 &&col.equals("subject_content")) {
				pstmt.setString(1, word);
				pstmt.setString(2, col);
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
	
	
	//create 	
	public boolean create(BoardDTO dto) {
		boolean flag=false;
		
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into board ");
		sql.append("     (num, name, subject,content,ref,regdate,passwd,ip,filename,filesize) ");
		sql.append(" values ");
		sql.append("     (board_seq.nextval, ?,?,?, ");
		sql.append("         (select nvl(max(ref),0) +1 from board), ");
		sql.append("         sysdate-5,?,?,?,?) ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setString(6, dto.getFilename());
			pstmt.setInt(7, dto.getFilesize());
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0) {
				flag=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
	
}
