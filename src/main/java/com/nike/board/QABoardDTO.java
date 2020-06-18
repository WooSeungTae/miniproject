package com.nike.board;

import java.sql.Date;

public class QABoardDTO {
	private String indexnum;
	private String id;
	private String code;
	private String codename;
	private String name;
	private String titlelist;
	private String title;
	private String content;
	private Date writeDate;
	private Date modifyDate;
	private String passwd;
	private String indexcnt;
	private int hit;
	private int rn;
	
	



	
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

	public String getIndexnum() {
		return indexnum;
	}
	public void setIndexnum(String indexnum) {
		this.indexnum = indexnum;
	}
	public String getTitlelist() {
		return titlelist;
	}
	public void setTitlelist(String titlelist) {
		this.titlelist = titlelist;
	}
	public String getCodename() {
		return codename;
	}
	public void setCodename(String codename) {
		this.codename = codename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
