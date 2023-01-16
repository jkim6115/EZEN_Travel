package com.ezentravel.DTO;

import java.sql.Date;

// 종합 DTO
public class GeneralDTO {
	private int user_num; // 유저 번호
	private int bno; // 게시판 번호
	private String title; // 게시글 제목
	private String content; // 게시글 본문
	private Date create_date; // 게시글 작성 날짜
	private int readcount; // 조회수
	private int cno; // 댓글 번호
	private String board_comment; // 댓글
	private int comment_group; // 댓글 그룹 (부모)
	private int comment_step; // 댓글 단계 (쌓이는 순서)
	private int comment_level; // 댓글 계층 (대댓글)
	private Date comment_date; // 댓글 작성 날짜
	private String nickname; // 닉네임
	
	public int getReadcount() {
		return readcount;
	}
	
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getBoard_comment() {
		return board_comment;
	}

	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public int getComment_step() {
		return comment_step;
	}

	public void setComment_step(int comment_step) {
		this.comment_step = comment_step;
	}

	public int getComment_level() {
		return comment_level;
	}

	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
