package com.nike.order;

import java.sql.Date;

public class OrderDTO {
	
	private String name;
	private String tel;
	private String firstAddr;
	private String secondAddr;
	private String orderMemo;
	private String orderType;
	private String bankName;
	private String bank;
	private String id;
	private int price;
	private String code;
	private int count;
	private String ordersize;
	private String orderNum;
	private String orderDate;
	private Date delivery;
	
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
	public String getFirstAddr() {
		return firstAddr;
	}
	public void setFirstAddr(String firstAddr) {
		this.firstAddr = firstAddr;
	}
	public String getSecondAddr() {
		return secondAddr;
	}
	public void setSecondAddr(String secondAddr) {
		this.secondAddr = secondAddr;
	}
	public String getOrderMemo() {
		return orderMemo;
	}
	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getOrdersize() {
		return ordersize;
	}
	public void setOrdersize(String ordersize) {
		this.ordersize = ordersize;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public Date getDelivery() {
		return delivery;
	}
	public void setDelivery(Date delivery) {
		this.delivery = delivery;
	}
	
	
	
}