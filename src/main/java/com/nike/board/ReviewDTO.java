package com.nike.board;

import java.sql.Date;

public class ReviewDTO {
	
	private String reviewTitle;
	private String reviewContents;
	private String id;
	private String name;
	private Date writeDate;
	private String code;
	private String reviewComfort;
	private String reviewSize;
	private String reviewDurable;
	private String reviewWidth;
	
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getReviewComfort() {
		return reviewComfort;
	}
	public void setReviewComfort(String reviewComfort) {
		this.reviewComfort = reviewComfort;
	}
	public String getReviewSize() {
		return reviewSize;
	}
	public void setReviewSize(String reviewSize) {
		this.reviewSize = reviewSize;
	}
	public String getReviewDurable() {
		return reviewDurable;
	}
	public void setReviewDurable(String reviewDurable) {
		this.reviewDurable = reviewDurable;
	}
	public String getReviewWidth() {
		return reviewWidth;
	}
	public void setReviewWidth(String reviewWidth) {
		this.reviewWidth = reviewWidth;
	}
	
	
}
