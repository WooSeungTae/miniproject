package com.nike.board;

public class Boardqa_PagingVO {
	private int nowPageqa,startPageqa,lastPageqa,endPageqa,totalqa,startqa,endqa;
	private int cntPerPage=3;
	private int cntPage=5;
	private String category;
	private String codename;
	private String code;




	public Boardqa_PagingVO() {}
		
	public Boardqa_PagingVO(int totalqa, int nowPageqa) {
		setnowPageqa(nowPageqa);
		setCntPerPage(cntPerPage);
		settotalqa(totalqa);
		calclastPageqa(gettotalqa());
		calcstartqaendqaPageqa(getnowPageqa());
		calcstartqaendqa(getnowPageqa());
	}
	public Boardqa_PagingVO(int totalqa, int nowPageqa, String code) {
		setnowPageqa(nowPageqa);
		setCntPerPage(cntPerPage);
		settotalqa(totalqa);
		calclastPageqa(gettotalqa());
		calcstartqaendqaPageqa(getnowPageqa());
		calcstartqaendqa(getnowPageqa());
		setCodename(code);
	}





	// 제일 마지막 페이지 계산
	public void calclastPageqa(int totalqa) {
		setlastPageqa((int) Math.ceil((double)totalqa / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcstartqaendqaPageqa(int nowPageqa) {
		setendqaPageqa(((int)Math.ceil((double)nowPageqa / (double)cntPage)) * cntPage);
		if (getlastPageqa() < getendPageqa()) {
			setendqaPageqa(getlastPageqa());
		}
		setstartqaPageqa(getendPageqa() - cntPage + 1);
		if (getstartPageqa() < 1) {
			setstartqaPageqa(1);
		}
	}
	// DB 쿼리에서 사용할 startqa, endqa값 계산
	public void calcstartqaendqa(int nowPageqa) {
		setendqa(nowPageqa * cntPerPage);
		setstartqa(getendqa() - cntPerPage + 1);
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
	public int getlastPageqa() {
		return lastPageqa;
	}

	public void setlastPageqa(int lastPageqa) {
		this.lastPageqa = lastPageqa;
	}

	public int getnowPageqa() {
		return nowPageqa;
	}


	public void setnowPageqa(int nowPageqa) {
		this.nowPageqa = nowPageqa;
	}


	public int getstartPageqa() {
		return startPageqa;
	}


	public void setstartqaPageqa(int startPageqa) {
		this.startPageqa = startPageqa;
	}


	public int getendPageqa() {
		return endPageqa;
	}


	public void setendqaPageqa(int endPageqa) {
		this.endPageqa = endPageqa;
	}


	public int gettotalqa() {
		return totalqa;
	}


	public void settotalqa(int totalqa) {
		this.totalqa = totalqa;
	}


	public int getCntPerPage() {
		return cntPerPage;
	}


	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}


	public int getstartqa() {
		return startqa;
	}


	public void setstartqa(int startqa) {
		this.startqa = startqa;
	}


	public int getendqa() {
		return endqa;
	}


	public void setendqa(int endqa) {
		this.endqa = endqa;
	}


}
