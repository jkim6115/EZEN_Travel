package com.ezentravel.DAO;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezentravel.DTO.MapDTO;
import com.ezentravel.DTO.UsDTO;

@Repository
public class MapDaoImp implements MapDao{
	
	@Autowired
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
	
	@Override
	public List<MapDTO> map_rank() {
		return sqlSession.selectList("map.map_rank");
	}
	
	@Override
	public MapDTO map_detail(int area_num) {
		return sqlSession.selectOne("map.map_detail", area_num);
	}
	
	@Override
	public int map_readcount(int area_num) {
		return sqlSession.update("map.map_readcount", area_num);
	}
	
	@Override
	public List<MapDTO> tag_list(int tag_num) {
		return sqlSession.selectList("map.map_tagList", tag_num);
	}
	
	public int user_insert(UsDTO usDTO) {
		return sqlSession.insert("user.user_insert", usDTO);
	}
	
	@Override
	public int user_select(UsDTO usDTO) {
		int result = sqlSession.selectOne("user.user_select", usDTO);
		return result;
	}
	
	public int user_delete(UsDTO usDTO) {
		return sqlSession.delete("user.user_delete", usDTO);
	}
}
