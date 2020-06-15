package com.nike.board;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentDTO {
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+9")
	private int numComment;
	private String indexnum ;
	private String contentComment;
	private String writer;
	private String registerdate;
	
	
	
	public String getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}
	public String getIndexnum() {
		return indexnum;
	}
	public void setIndexnum(String indexnum) {
		this.indexnum = indexnum;
	}
	public int getNumComment() {
		return numComment;
	}
	public void setNumComment(int numComment) {
		this.numComment = numComment;
	}
	public String getContentComment() {
		return contentComment;
	}
	public void setContentComment(String contentComment) {
		this.contentComment = contentComment;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
