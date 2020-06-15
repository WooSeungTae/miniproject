package com.nike.order;

import java.sql.Date;

public class OrderDTO {
	private String name;
	private String tel;
	private String addr;
	private String ordermemo;
	private String ordertype;
	private String bankname;
	private String bank;
	private String id;
	private String totalprice;
	private String ordernum;
	private String delivery;
	private Date orderdate;
	private String mile="0";
	private String cancelPrice;
	

	public String getCancelPrice() {
		return cancelPrice;
	}
	public void setCancelPrice(String cancelPrice) {
		this.cancelPrice = cancelPrice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getordermemo() {
		return ordermemo;
	}
	public void setordermemo(String ordermemo) {
		this.ordermemo = ordermemo;
	}
	public String getOrdertype() {
		return ordertype;
	}
	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}
	public String getbankname() {
		return bankname;
	}
	public void setbankname(String bankname) {
		this.bankname = bankname;

	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String gettotalprice() {
		return totalprice;
	}
	public void settotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getordernum() {
		return ordernum;
	}
	public void setordernum(String ordernum) {
		this.ordernum = ordernum;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getMile() {
		return mile;
	}
	public void setMile(String mile) {
		this.mile = mile;
	}

}