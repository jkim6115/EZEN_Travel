package com.ezentravel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezentravel.DTO.Cm_boardDTO;
import com.ezentravel.DTO.Cm_commentDTO;
import com.ezentravel.DTO.GeneralDTO;
import com.ezentravel.DTO.PageDTO;
import com.ezentravel.service.BoardService;

// http://localhost:8090/controller/board.do

@Controller
public class BoardController {
	private BoardService service;
	private PageDTO pdto;
	private int currentPage;

	public BoardController() {

	}

	@Autowired
	public void setService(BoardService service) {
		this.service = service;
	}

	// 페이지 리스트 메서드
	@RequestMapping("/board.do")
	public ModelAndView list(PageDTO pv, ModelAndView mav) {
		// 페이지 카운트 및 현재 페이지 확인
		int totalRecord = service.countProcess(pv);
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				this.currentPage = 1;
			else
				this.currentPage = pv.getCurrentPage();

			this.pdto = new PageDTO(this.currentPage, totalRecord, pv.getSearchKey(), pv.getSearchWord());
			// 리스트로 게시글 받아와서 게시판 리스트로 보여준다.
			List<GeneralDTO> gList = service.listProcess(this.pdto);
			mav.addObject("gList", gList);
			mav.addObject("pv", this.pdto);
			
			// 검색 기능때문에 view에 초기값 null로 인해 예외 발생하여 예외 처리
			try {
				pdto.setSearchInfo(pv.getSearchKey(), pv.getSearchWord());
			} catch (NullPointerException e) {
				mav.setViewName("board/board");
			}

		}
		
		// borad로 뷰 설정
		mav.setViewName("board/board");
		return mav;
	} // end list()

	// 게시글 작성 메서드
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView write(Cm_boardDTO dto, PageDTO pv, ModelAndView mav) {
		
		// 현재 페이지 값 설정
		mav.addObject("currentPage", pv.getCurrentPage()); 
		
		mav.addObject("dto", dto);
		
		 // write로 뷰 설정 
		mav.setViewName("board/write");
		
		return mav;
	} // end write()

	// 게시글 작성 메서드
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String writePro(Cm_boardDTO dto) {
		
		service.wirteProcess(dto);
		
		// 작성 후 다시 board로 돌아오게끔 설정
		return "redirect:/board.do"; 
	}

	// 게시글 뷰 페이지 메서드
	@RequestMapping("/view.do")
	public ModelAndView view(int currentPage, int num, ModelAndView mav) {
		
		// 게시글 뷰를 위한 설정
		mav.addObject("cdto", service.contentProcess(num));
		
		// 댓글 카운트를 위한 설정
		mav.addObject("commentCount", service.countCommentProcess(num));
		
		// 댓글 뷰를 위한 설정
		/* 댓글은 리스트로 받게끔 설정하고 리스트로 뿌려주면서 순서대로 쌓이게 된다. */
		mav.addObject("cList", service.commentProcess(num));
		
		mav.addObject("currentPage", currentPage);
		
		// view로 뷰 설정
		mav.setViewName("board/view");
		
		return mav;
	} // end view()

	// 게시글 수정 메서드(수정 할 값 넘기는 메서드)
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public ModelAndView update(Cm_boardDTO dto, int currentPage, ModelAndView mav) {
		
		// 게시글 수정시 게시글 번호로 값을 넘겨 처리한다.
		mav.addObject("dto", service.updateSelectProcess(dto.getBno()));
		
		// 수정 후 현재 페이지로 바로 보여지게끔 하기 위한 용도로 넘기는 값
		mav.addObject("currentPage", currentPage);
		
		// update로 뷰 설정
		mav.setViewName("board/update"); 
		
		return mav;
	} // end update()

	// 게시글 수정 메서드
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updatePro(Cm_boardDTO dto, int currentPage) {
		
		service.updateProcess(dto);
		
		// 게시글 번호를 이용하여 수정 후 바로 그 게시글이 보여지도록 설정
		int num = dto.getBno();
		
		// 수정 후 현재 게시글로 뷰 설정
		return "redirect:/view.do?currentPage=" + currentPage + "&num=" + num; 
	} // end updatePro()

	// 게시글 삭제 메서드
	@RequestMapping("/delete.do")
	public ModelAndView delete(Cm_boardDTO dto, int currentPage, PageDTO pv, ModelAndView mav) {
		
		// 페이지 수에 맞춰서 삭제 후 현재 페이지로 이동하게 끔 설정
		service.deleteProcess(dto.getBno());
		
		// 새롭게 PageDTO 설정 후 다시 값을 넣어준다.
		PageDTO pdto = new PageDTO(pv.getCurrentPage(), service.countProcess(pv));
		
		if (pdto.getTotalCount() < pv.getCurrentPage())
			mav.addObject("currentPage", pdto.getTotalPage());
		else
			mav.addObject("currentPage", pv.getCurrentPage());

		// 게시글 경로 뷰 재설정
		mav.setViewName("redirect:/board.do?currentPage=" + this.pdto.getCurrentPage());
		
		return mav;
	} // end delete()

	// 댓글 작성
	@RequestMapping(value = "/comment_wr.do", method = RequestMethod.POST)
	public String commentWrite(Cm_commentDTO dto, int currentPage) {
		
		// 댓글 작성 프로세스
		service.commentWriteProcess(dto);
		
		// 댓글 작성 시 댓글 리스트에서 어떠한 값을 받아오는지 처리하기 위한 댓글 번호 넘기는 값 설정
		service.commentSelectUpdateProcess(dto.getCno());
		
		int num = dto.getBno();
		
		// 댓글을 작성한 게시글로 뷰 설정
		return "redirect:/view.do?currentPage=" + currentPage + "&num=" + num;
	} // end commentWrite()

	// 댓글 수정(수정할 값 넘기는 메서드)
	@RequestMapping(value="/comment_up.do", method=RequestMethod.GET)
	public ModelAndView commentUpdate(Cm_commentDTO dto, int currentPage, ModelAndView mav) {
		
		// 수정 할 댓글 선택을 위한 댓글 번호 설정
		mav.addObject("dto", service.commentSelectUpdateProcess(dto.getCno()));
		
		mav.addObject("currentPage", currentPage);
		
		// 댓글 수정 페이지로 뷰 설정
		mav.setViewName("board/cmupdate");
		
		return mav;		
	} // end commentUpdate()

	// 댓글 수정
	@RequestMapping(value = "/comment_up.do", method = RequestMethod.POST)
	public String commentUpdatePro(Cm_commentDTO dto, int currentPage) {
		
		service.commentUpdateProcess(dto);
		
		int num = dto.getBno();
		
		// 수정 후 수정한 게시글로 뷰 설정
		return "redirect:/view.do?currentPage=" + currentPage + "&num=" + num;
	} // end commentUpdatePro()

	// 댓글 삭제
	@RequestMapping("/comment_del.do")
	public String commentDelete(Cm_commentDTO dto, int currentPage) {
		
		// 게시글 번호로 삭제 설정
		service.commentDeleteProcess(dto.getCno());

		int num = dto.getBno();
		
		// 삭제 후 게시글로 뷰 설정
		return "redirect:/view.do?currentPage=" + currentPage + "&num=" + num;
	} // end commentDelete

} // end class
