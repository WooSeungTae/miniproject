package com.nike.board;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	
	private int reviewnum = 0;
	private String reviewtitle = " ";;
	private String reviewcontents = " ";;
	private String id = " ";;
	private String name = " ";
	private Date writeDate;
	private String code;
	private String codename = " " ;
	private int star_input = 0;
	private int rating = 0;
	private int rating2 = 0;
	private int rating3 = 0;
	private int rating4 = 0;
	private String image = " ";
	private int rn;
	private String indexcnt;
	
	
	
	public String getIndexcnt() {
		return indexcnt;
	}
	public void setIndexcnt(String indexcnt) {
		this.indexcnt = indexcnt;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}
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
	
	
	public String getReviewtitle() {
		return reviewtitle;
	}
	public void setReviewtitle(String reviewtitle) {
		this.reviewtitle = reviewtitle;
	}
	public String getReviewcontents() {
		return reviewcontents;
	}
	public void setReviewcontents(String reviewcontents) {
		this.reviewcontents = reviewcontents;
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
	
	
	public int getReviewNum() {
		return reviewnum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewnum = reviewNum;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
