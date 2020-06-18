package com.nike.board;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentDTO {
	private String numComment;
	private String indexnum ;
	private String contentComment;
	private String writer;
	private String registerdate;
	private String id;
	private String commentcnt;
	
	
	
	public String getCommentcnt() {
		return commentcnt;
	}
	public void setCommentcnt(String commentcnt) {
		this.commentcnt = commentcnt;
	}
	public String getNumComment() {
		return numComment;		
	}
	public void setNumComment(String numComment) {
		this.numComment = numComment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
