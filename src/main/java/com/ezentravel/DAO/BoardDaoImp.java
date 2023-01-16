package com.ezentravel.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezentravel.DTO.Cm_boardDTO;
import com.ezentravel.DTO.Cm_commentDTO;
import com.ezentravel.DTO.GeneralDTO;
import com.ezentravel.DTO.PageDTO;

@Repository
public class BoardDaoImp implements BoardDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public BoardDaoImp() {
		
	}
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 게시글 총 개수
	@Override
	public int count(PageDTO pv) {
		return sqlSession.selectOne("board.count", pv);
	}
	
	// 게시글 리스트-페이지
	@Override
	public List<GeneralDTO> list(PageDTO pv) {
		return sqlSession.selectList("board.list", pv);
	}
	
	// 게시글 조회수
	@Override
	public void readCount(int num) {
		sqlSession.update("board.readCount", num);
	}
	
	// 게시글 뷰 페이지
	@Override
	public GeneralDTO content(int num) {
		return sqlSession.selectOne("board.board_view", num);
	}
	
	// 게시글 작성
	@Override
	public void write(Cm_boardDTO dto) {
		sqlSession.insert("board.write", dto);
	}
	
	// 게시글 수정
	@Override
	public void update(Cm_boardDTO dto) {
		sqlSession.update("board.update", dto);		
	}

	// 게시글 삭제
	@Override
	public void delete(int num) {
		sqlSession.delete("board.delete", num);
	}
	
	/* 아래부터 댓글 관련 문 */
	
	// 댓글 개수
	@Override
	public int commentCount(int num) {
		return sqlSession.selectOne("board.comment_count", num);
	}
	
	// 댓글 리스트 (뷰 페이지)
	@Override
	public List<Cm_commentDTO> comment(int num) {
		return sqlSession.selectList("board.comment_view", num);
	}
	
	// 댓글 한개 선택(댓글 수정용)
	@Override
	public Cm_commentDTO commentOne(int num) {
		return sqlSession.selectOne("board.comment_view_one", num);
	}
	
	// 댓글 작성
	@Override
	public void writeComment(Cm_commentDTO dto) {
		sqlSession.insert("board.comment_wr", dto);
	}
	
	// 댓글 수정
	@Override
	public void updateComment(Cm_commentDTO dto) {
		System.out.println(dto.getCno());
		System.out.println(sqlSession.update("board.comment_up", dto));
		sqlSession.update("board.comment_up", dto);
	}
	
	// 댓글 삭제
	@Override
	public void deleteComment(int num) {
		System.out.println(num);
		sqlSession.delete("board.comment_del", num);
	}
}
