package com.nike.order;

public class ShoppingCartDTO {
	private String id;
	private String code;
	private int count;
	private String ordersize;
	
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
	
	
	
}
