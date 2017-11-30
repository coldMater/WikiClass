package com.VO;

public class ClassSearchVO {
	
	int group_num;
	int mem_num;
	int num;
	String name;
	String favorite;
	String imagepath;
	String classpath;
	String senddate;
	
	
	public ClassSearchVO(int group_num, int mem_num, int num, String name, String favorite, String imagepath,
			String classpath, String senddate) {
		super();
		this.group_num = group_num;
		this.mem_num = mem_num;
		this.num = num;
		this.name = name;
		this.favorite = favorite;
		this.imagepath = imagepath;
		this.classpath = classpath;
		this.senddate = senddate;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
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
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public String getClasspath() {
		return classpath;
	}
	public void setClasspath(String classpath) {
		this.classpath = classpath;
	}
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
	
	
	
	

}
