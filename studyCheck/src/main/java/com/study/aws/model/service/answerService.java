package com.study.aws.model.service;

import java.util.HashMap;
import java.util.List;

import com.study.aws.model.dto.answerDto;
import com.study.aws.model.dto.domainDto;

public interface answerService {
	
	public List<answerDto> selectUserAnswers(HashMap<String, String> map);
	public void register(answerDto answer);
	public List<answerDto> selectAll(domainDto domain);

}
