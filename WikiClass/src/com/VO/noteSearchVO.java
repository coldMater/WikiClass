package com.VO;

public class noteSearchVO {
	int classnum;
    String notename;
    String author;
    String senddate;
    String path;
    
	public noteSearchVO(int classnum, String notename, String author, String senddate, String path) {
		super();
		this.classnum = classnum;
		this.notename = notename;
		this.author = author;
		this.senddate = senddate;
		this.path = path;
	}
	public int getClassnum() {
		return classnum;
	}
	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}
	public String getNotename() {
		return notename;
	}
	public void setNotename(String notename) {
		this.notename = notename;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
    
    
}
