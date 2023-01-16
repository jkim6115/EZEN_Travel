package com.ezentravel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezentravel.DAO.BoardDAO;
import com.ezentravel.DTO.Cm_boardDTO;
import com.ezentravel.DTO.Cm_commentDTO;
import com.ezentravel.DTO.GeneralDTO;
import com.ezentravel.DTO.PageDTO;

@Service
public class BoardServiceImp implements BoardService {
	
	private BoardDAO dao;

	public BoardServiceImp() {

	}

	@Autowired
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}

	// 게시글 총 갯수
	@Override
	public int countProcess(PageDTO pv) {
		return dao.count(pv);
	}

	// 게시글 리스트
	@Override
	public List<GeneralDTO> listProcess(PageDTO pv) {
		return dao.list(pv);
	}

	// 게시글 뷰
	@Override
	public GeneralDTO contentProcess(int num) {
		dao.readCount(num);
		return dao.content(num);
	}
	
	
	// 게시글 작성
	@Override
	public void wirteProcess(Cm_boardDTO dto) {
		dao.write(dto);
	}

	// 게시글 수정 (받아오는)
	@Override
	public GeneralDTO updateSelectProcess(int num) {
		return dao.content(num);
	}
	
	// 게시글 수정
	@Override
	public void updateProcess(Cm_boardDTO dto) {
		dao.update(dto);
	}
	
	// 게시글 삭제
	@Override
	public void deleteProcess(int num) {
		dao.delete(num);
	}
	
	/* 아래 부터 댓글 관련 */
	
	// 댓글 개수
	@Override
	public int countCommentProcess(int num) {
		return dao.commentCount(num);
	}

	// 댓글 리스트
	@Override
	public List<Cm_commentDTO> commentProcess(int num) {
		return dao.comment(num);
	}
	
	// 댓글 작성
	@Override
	public void commentWriteProcess(Cm_commentDTO dto) {
		dao.writeComment(dto);	
	}
	
	// 댓글 수정
	@Override
	public Cm_commentDTO commentSelectUpdateProcess(int num) {
		return dao.commentOne(num);
	}
	
	// 댓글 수정
	@Override
	public void commentUpdateProcess(Cm_commentDTO dto) {
		dao.updateComment(dto);
	}
	
	// 댓글 삭제
	@Override
	public void commentDeleteProcess(int num) {
		dao.deleteComment(num);
	}

}
