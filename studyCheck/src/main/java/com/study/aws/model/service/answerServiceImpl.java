package com.study.aws.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.aws.model.dao.answerDao;
import com.study.aws.model.dto.answerDto;
import com.study.aws.model.dto.domainDto;

@Service
public class answerServiceImpl implements answerService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<answerDto> selectAll(domainDto domain) {
		return sqlSession.getMapper(answerDao.class).selectAll(domain);
	}

	@Override
	public List<answerDto> selectUserAnswers(HashMap<String, String> map) {
		return sqlSession.getMapper(answerDao.class).selectUserAnswers(map);
	}

	@Override
	public void register(answerDto answer) {
		sqlSession.getMapper(answerDao.class).register(answer);
	}

}
