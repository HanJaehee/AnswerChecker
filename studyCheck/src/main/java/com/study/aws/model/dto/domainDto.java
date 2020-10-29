package com.study.aws.model.dto;

public class domainDto {
	private String name;
	private String startNum;
	private String endNum;
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStartNum() {
		return startNum;
	}

	public void setStartNum(String startNum) {
		this.startNum = startNum;
	}

	public String getEndNum() {
		return endNum;
	}

	public void setEndNum(String endNum) {
		this.endNum = endNum;
	}

	public domainDto() {
		super();
	}

	public domainDto(String name, String startNum, String endNum) {
		super();
		this.name = name;
		this.startNum = startNum;
		this.endNum = endNum;
	}

	@Override
	public String toString() {
		return "domainDto [name=" + name + ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
	
}
