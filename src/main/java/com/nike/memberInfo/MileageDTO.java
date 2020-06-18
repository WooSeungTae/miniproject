package com.nike.memberInfo;

import java.sql.Date;

public class MileageDTO {
	
	private String id;
	private int savemileage;
	private Date savedate;
	private String savereason;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSavemileage() {
		return savemileage;
	}
	public void setSavemileage(int savemileage) {
		this.savemileage = savemileage;
	}
	public Date getSavedate() {
		return savedate;
	}
	public void setSavedate(Date savedate) {
		this.savedate = savedate;
	}
	public String getSavereason() {
		return savereason;
	}
	public void setSavereason(String savereason) {
		this.savereason = savereason;
	}
	
	
}
