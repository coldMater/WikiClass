package com.VO;

public class classVO {
	private String group_name; //�׷� ��ȣ
	private String mem_name; //ȸ�� ��ȣ
	private int num; //Ŭ���� ��ȣ
	private String name; //Ŭ���� ��
	private String favorite; //�о�
	private String imgPath; //�̹��� ���
	private String classPath; //Ŭ���� ����-->��η� ����
	private String senddate; //�ۼ� ��¥
	
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
