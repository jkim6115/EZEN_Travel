package com.ezentravel.DAO;

import java.util.List;

import com.ezentravel.DTO.Cm_boardDTO;
import com.ezentravel.DTO.Cm_commentDTO;
import com.ezentravel.DTO.GeneralDTO;
import com.ezentravel.DTO.PageDTO;

public interface BoardDAO {
	// 게시글 총 개수
	public int count(PageDTO pv);

	// 게시글 리스트-페이지
	public List<GeneralDTO> list(PageDTO pv);

	// 게시글 조회수
	public void readCount(int num);

	// 게시글 본문
	public GeneralDTO content(int num);

	// 게시글 작성
	public void write(Cm_boardDTO dto);

	// 게시글 수정
	public void update(Cm_boardDTO dto);

	// 게시글 삭제
	public void delete(int num);
	
	/* 아래부터 댓글 관련 문 */
	
	// 댓글 카운트
	public int commentCount(int num);
	
	// 댓글 리스트
	public List<Cm_commentDTO> comment(int num);
	
	// 댓글 한개 
	public Cm_commentDTO commentOne(int num);
	
	// 댓글 작성
	public void writeComment(Cm_commentDTO dto);
	
	// 댓글 수정
	public void updateComment(Cm_commentDTO dto);
	
	// 댓글 삭제
	public void deleteComment(int num);
}
