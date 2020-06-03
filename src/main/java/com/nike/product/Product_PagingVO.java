package com.nike.product;

public class Product_PagingVO {
	private int nowPage,startPage,lastPage,endPage,total,start,end;
	private int cntPerPage=6;
	private int cntPage=5;
	private String category;
	private String codename;



	public Product_PagingVO() {}

	public Product_PagingVO(int total, int nowPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal());
		calcStartEndPage(getNowPage());
		calcStartEnd(getNowPage());
	}
	
	public Product_PagingVO(int total, int nowPage, String category) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal());
		calcStartEndPage(getNowPage());
		calcStartEnd(getNowPage());
		setCategory(category);
	}
	
	public Product_PagingVO(Double total, int nowPage, String codename) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal((int)Math.round(total));
		calcLastPage(getTotal());
		calcStartEndPage(getNowPage());
		calcStartEnd(getNowPage());
		setCodename(codename);
	}




	// 제일 마지막 페이지 계산
	public void calcLastPage(int total) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

	
	
	
	
	
	
	
	
	
	public String getCodename() {
		return codename;
	}
	
	public void setCodename(String codename) {
		this.codename = codename.toUpperCase();
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getNowPage() {
		return nowPage;
	}


	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getCntPerPage() {
		return cntPerPage;
	}


	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}


}
