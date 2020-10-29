package com.study.aws.model.dao;

import java.util.HashMap;
import java.util.List;

import com.study.aws.model.dto.answerDto;
import com.study.aws.model.dto.domainDto;

public interface answerDao {
	
	public List<answerDto> selectAll(domainDto domain);
	public List<answerDto> selectUserAnswers(HashMap<String, String> map);
	public void register(answerDto answer);
}
