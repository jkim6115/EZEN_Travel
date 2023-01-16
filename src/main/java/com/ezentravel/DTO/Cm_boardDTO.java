package com.ezentravel.DTO;

import java.sql.Date;

// 게시판 DTO
public class Cm_boardDTO {
	private int bno; // 게시글 번호
	private int readcount; // 게시글 조회수
	private String title; // 게시글 제목
	private String content; // 게시글 본문
	private Date create_date; // 게시글 작성 날짜
	private int user_num; // 게시글 작성 유저 번호
	
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
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

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

}
