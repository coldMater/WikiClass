package com.VO;

public class NoteVO {
String num;
String title;
String path;
String date;
String author;
String content;

public NoteVO(String num, String title, String path, String date, String author, String content) {
	super();
	this.num = num;
	this.title = title;
	this.path = path;
	this.date = date;
	this.author = author;
	this.content = content;
}
public String getNum() {
	return num;
}
public void setNum(String num) {
	this.num = num;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}



}
