package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MapDTO;

public class MapDaoImp implements MapDao{

private SqlSessionTemplate sqlSession;
	
	public MapDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MapDTO> map_list(String data) {
		return sqlSession.selectList("map.map_list", data);
	}
}
