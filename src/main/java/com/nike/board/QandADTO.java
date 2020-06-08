package com.nike.board;

import java.sql.Date;

public class QandADTO {
	
	private int qandaNum;
	private String id;
	private String name;
	private Date writeDate;
	private String code;
	private String qandaTitle;
	private String qandaContents;
	
	public int getQandaNum() {
		return qandaNum;
	}
	public void setQandaNum(int qandaNum) {
		this.qandaNum = qandaNum;
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
	public String getQandaTitle() {
		return qandaTitle;
	}
	public void setQandaTitle(String qandaTitle) {
		this.qandaTitle = qandaTitle;
	}
	public String getQandaContents() {
		return qandaContents;
	}
	public void setQandaContents(String qandaContents) {
		this.qandaContents = qandaContents;
	}
	
}
