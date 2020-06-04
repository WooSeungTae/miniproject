package com.nike.service;

import javax.servlet.http.HttpServletRequest;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.order.OrderDAO;
import com.nike.order.OrderDTO;
import com.nike.order.Order_detailsDAO;
import com.nike.product.ProductDAO;
import com.nike.order.ShoppingCartDTO;

@Service
public class OrderService {
	@Autowired
	private OrderDAO Odao;
	@Autowired
	private MemberInfoDAO dao;
	@Autowired
	private ProductDAO pdao;
	@Autowired
	private Order_detailsDAO Ddao;
	
	/*구매후 등록*/
	public void productBuy(HttpServletRequest request,OrderDTO Odto) {
		Odao.buyRegister(Odto);
	}
	
	
	/*장바구니 DB에 값을 저장*/
	public void insertcart(ShoppingCartDTO sdto) {
		Odao.insertcart(sdto);
	}
	
	/*장바구니 DB에서 회원별 리스트 가져오기*/
	public List<ShoppingCartDTO> selectcart(String id) {
		return Odao.selectcart(id);
	}
	
	/*장바구니 DB에서 리스트 개수 가져오기*/
	public int countcart(String id) {
		return Odao.countcart(id);
	}
	
	/*회원별 장바구니에 있는 아이템 전부 삭제*/
	public void cartAlldelete(String id) {
		Odao.cartAlldelete(id);
	}
	
	/*장바구니 DB에서 회원별 총 금액 가져오기*/
	public int totalprice(String id) {
		return Odao.totalprice(id);
	}
	
	/*회원별 장바구니에서 x누른 아이템 삭제*/
	public void cartitemdelete(ShoppingCartDTO sdto) {
		Odao.cartitemdelete(sdto);
	}

	/*이미 있는 아이템은 더이상 장바구니에 추가 못함*/
	public int checkitem(ShoppingCartDTO sdto) {
		return Odao.checkitem(sdto);
	}

}
