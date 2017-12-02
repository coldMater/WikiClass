package com.VO;

public class memberInfoVO {
int num;
String email;
String nickname;
String senddate;
String favorite;
int age;
int gender;

public memberInfoVO(int num, String email, String nickname, String senddate, String favorite, int age, int gender) {
	super();
	this.num = num;
	this.email = email;
	this.nickname = nickname;
	this.senddate = senddate;
	this.favorite = favorite;
	this.age = age;
	this.gender = gender;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getSenddate() {
	return senddate;
}
public void setSenddate(String senddate) {
	this.senddate = senddate;
}
public String getFavorite() {
	return favorite;
}
public void setFavorite(String favorite) {
	this.favorite = favorite;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public int getGender() {
	return gender;
}
public void setGender(int gender) {
	this.gender = gender;
}





}



