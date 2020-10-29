package com.study.aws.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("answer")
public class answerDto {
	private String name;
	private int answerNum;
	private String answer;
	
	public answerDto() {
		super();
	}

	public answerDto(String name, int answerNum, String answer) {
		super();
		this.name = name;
		this.answerNum = answerNum;
		this.answer = answer;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(int answerNum) {
		this.answerNum = answerNum;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "answerDto [name=" + name + ", answerNum=" + answerNum + ", answer=" + answer + "]";
	}
	
	
	
}
