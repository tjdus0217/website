package board;

public class BoardDTO {
 private int num                ;
 private String name            ;
 private  String subject        ;
 private  String content        ;
 private int ref                ;
 private int indent             ;
 private int ansnum             ;
 private String regdate         ;
 private String passwd          ;
 private int count              ;
 private String ip              ;
 private String filename        ;
 private int filesize           ;
 private int refnum             ;
 
public BoardDTO() {
	super();
	// TODO Auto-generated constructor stub
}

public BoardDTO(int num, String name, String subject, String content, int ref, int indent, int ansnum, String regdate,
		String passwd, int count, String ip, String filename, int filesize, int refnum) {
	super();
	this.num = num;
	this.name = name;
	this.subject = subject;
	this.content = content;
	this.ref = ref;
	this.indent = indent;
	this.ansnum = ansnum;
	this.regdate = regdate;
	this.passwd = passwd;
	this.count = count;
	this.ip = ip;
	this.filename = filename;
	this.filesize = filesize;
	this.refnum = refnum;
}

@Override
public String toString() {
	return "BoardDTO [num=" + num + ", name=" + name + ", subject=" + subject + ", content=" + content + ", ref=" + ref
			+ ", indent=" + indent + ", ansnum=" + ansnum + ", regdate=" + regdate + ", passwd=" + passwd + ", count="
			+ count + ", ip=" + ip + ", filename=" + filename + ", filesize=" + filesize + ", refnum=" + refnum + "]";
}

public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getRef() {
	return ref;
}
public void setRef(int ref) {
	this.ref = ref;
}
public int getIndent() {
	return indent;
}
public void setIndent(int indent) {
	this.indent = indent;
}
public int getAnsnum() {
	return ansnum;
}
public void setAnsnum(int ansnum) {
	this.ansnum = ansnum;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public String getIp() {
	return ip;
}
public void setIp(String ip) {
	this.ip = ip;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
public int getFilesize() {
	return filesize;
}
public void setFilesize(int filesize) {
	this.filesize = filesize;
}
public int getRefnum() {
	return refnum;
}
public void setRefnum(int refnum) {
	this.refnum = refnum;
}
	
}
