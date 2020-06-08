package com.nike.board;

import java.sql.Date;

public class ReviewDTO {
	
	private int reviewNum;
	private String reviewTitle;
	private String reviewContents;
	private String id;
	private String name;
	private Date writeDate;
	private String code;
	private String codename;
	private int star_input;
	private int rating;
	private int rating2;
	private int rating3;
	private int rating4;
	private String image;
	
	
	public String getCodename() {
		return codename;
	}
	public void setCodename(String codename) {
		this.codename = codename;
	}
	public int getStar_input() {
		return star_input;
	}
	public void setStar_input(int star_input) {
		this.star_input = star_input;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getRating2() {
		return rating2;
	}
	public void setRating2(int rating2) {
		this.rating2 = rating2;
	}
	public int getRating3() {
		return rating3;
	}
	public void setRating3(int rating3) {
		this.rating3 = rating3;
	}
	public int getRating4() {
		return rating4;
	}
	public void setRating4(int rating4) {
		this.rating4 = rating4;
	}
	
	
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
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	
	
}
