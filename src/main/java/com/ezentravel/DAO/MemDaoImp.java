package com.ezentravel.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezentravel.DTO.MemDTO;

@Repository
public class MemDaoImp implements MemDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemDaoImp() {
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MemDTO> list() {
		
		return sqlSession.selectList("mem.all");
	}

}
