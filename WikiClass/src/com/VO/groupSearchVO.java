package com.VO;

public class groupSearchVO {

	int num;
	String name;
	String content;

	public groupSearchVO(int num, String name, String content) {
		super();
		this.num = num;
		this.name = name;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	

}
