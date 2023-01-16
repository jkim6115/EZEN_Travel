package com.ezentravel.service;

import java.util.List;

import com.ezentravel.DTO.Cm_boardDTO;
import com.ezentravel.DTO.Cm_commentDTO;
import com.ezentravel.DTO.GeneralDTO;
import com.ezentravel.DTO.PageDTO;

public interface BoardService {
	// 게시글 총 개수
	public int countProcess(PageDTO pv);

	// 게시글 리스트-페이지
	public List<GeneralDTO> listProcess(PageDTO pv);

	// 게시글 본문
	public GeneralDTO contentProcess(int num);

	// 게시글 작성
	public void wirteProcess(Cm_boardDTO dto);

	// 게시글 수정
	public GeneralDTO updateSelectProcess(int num);

	// 게시글 수정
	public void updateProcess(Cm_boardDTO dto);

	// 게시글 삭제
	public void deleteProcess(int num);
	
	/* 아래부터 댓글 관련 문 */
	
	// 댓글 카운트
	public int countCommentProcess(int num);
	
	// 댓글 리스트
	public List<Cm_commentDTO> commentProcess(int num);
	
	// 댓글 작성
	public void commentWriteProcess(Cm_commentDTO dto);
	
	// 댓글 수정
	public Cm_commentDTO commentSelectUpdateProcess(int num);
	
	// 댓글 수정
	public void commentUpdateProcess(Cm_commentDTO dto);
	
	// 댓글 삭제
	public void commentDeleteProcess(int num);
}
