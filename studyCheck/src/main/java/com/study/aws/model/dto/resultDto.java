package com.study.aws.model.dto;

public class resultDto {

	private String answerNum;
	private String[] answers; // 1 - 재희, 2 - 홍균, 3 - 지환
	private String matched;

	public resultDto() {
		super();
	}

	public resultDto(String answerNum, String[] answers, String matched) {
		super();
		this.answerNum = answerNum;
		this.answers = answers;
		this.matched = matched;
	}

	public String getMatched() {
		return matched;
	}

	public void setMatched(String matched) {
		this.matched = matched;
	}

	public String getAnswerNum() {
		return answerNum;
	}

	public void setAnswerNum(String answerNum) {
		this.answerNum = answerNum;
	}

	public String[] getAnswers() {
		return answers;
	}

	public void setAnswers(String[] answers) {
		this.answers = answers;
	}

}
