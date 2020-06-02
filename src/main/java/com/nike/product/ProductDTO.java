package com.nike.product;


import java.sql.Date;



public class ProductDTO {
	private String code;
	private String codename = " "; 
	private String codecolor = " "; 
	private String category = " "; 
	private String gender = " "; 
	private String image1 = " "; 
	private String image2 = " ";
	private String image3 = " ";
	private String image4 = " ";
	private String image5 = " ";
	private String image6 = " ";
	private String contents = " "; 
	private String price = "0";
	private Date joindate;
	
	
	
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodename() {
		return codename;
	}
	public void setCodename(String codename) {
		this.codename = codename;
	}
	public String getCodecolor() {
		return codecolor;
	}
	public void setCodecolor(String codecolor) {
		this.codecolor = codecolor;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public String getImage5() {
		return image5;
	}
	public void setImage5(String image5) {
		this.image5 = image5;
	}
	public String getImage6() {
		return image6;
	}
	public void setImage6(String image6) {
		this.image6 = image6;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
}
