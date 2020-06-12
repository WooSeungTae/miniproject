package com.nike.board;

import java.sql.Date;

public class QacommentDTO {
	private int qanum;
	private int indexnum ;
	private String content;
	private String writer;
	private Date reg_date;
	
	
	public int getQanum() {
		return qanum;
	}
	public void setQanum(int qanum) {
		this.qanum = qanum;
	}
	public int getIndexnum() {
		return indexnum;
	}
	public void setIndexnum(int indexnum) {
		this.indexnum = indexnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}



}
