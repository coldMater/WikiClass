package com.VO;

public class classVO {
	private String group_name; //그룹 번호
	private String mem_name; //회원 번호
	private int num; //클래스 번호
	private String name; //클래스 명
	private String favorite; //분야
	private String imgPath; //이미지 경로
	private String classPath; //클래스 내용-->경로로 수정
	private String senddate; //작성 날짜
	
	public classVO(String group_name, String mem_name, int num, String name, String favorite, String imgPath,
			String classPath, String senddate) {
		super();
		this.group_name = group_name;
		this.mem_name = mem_name;
		this.num = num;
		this.name = name;
		this.favorite = favorite;
		this.imgPath = imgPath;
		this.classPath = classPath;
		this.senddate = senddate;
	}
	public String getGroup_name() {
		return group_name;
	}
	public String getMem_name() {
		return mem_name;
	}
	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public String getFavorite() {
		return favorite;
	}
	public String getImgPath() {
		return imgPath;
	}
	public String getClassPath() {
		return classPath;
	}
	public String getSenddate() {
		
		return senddate.substring(0,10);
	}
	
	
	
	
	
}
