package com.nike.service;

<<<<<<< HEAD
=======
import java.util.List;
>>>>>>> minhoeyk

import javax.servlet.http.HttpServletRequest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.memberInfo.MemberInfoDAO;
<<<<<<< HEAD
import com.nike.memberInfo.MemberInfoDTO;
=======
import com.nike.order.OrderCare_PagingVO;
>>>>>>> minhoeyk
import com.nike.order.OrderDAO;
import com.nike.order.OrderDTO;
import com.nike.order.Order_detailsDAO;
import com.nike.order.Order_detailsDTO;
import com.nike.product.ProductDAO;
import com.nike.order.ShoppingCartDTO;

@Service
public class OrderService {
	@Autowired
	private OrderDAO Odao;
	@Autowired
	private Order_detailsDAO Ddao;

	private String orderNum;
	
	
	/*구매후 등록*/
	public void productBuy(OrderDTO Odto,Order_detailsDTO Ddto) {
		orderNum="Order";
		SimpleDateFormat format = new SimpleDateFormat("MMddHHmmss");
		orderNum = orderNum + format.format(new Date());
		Odto.setordernum(orderNum);
		Ddto.setOrdernum(orderNum);
		Odao.buyRegister(Odto);
		Ddao.buyRegisterDetails(Ddto);

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
<<<<<<< HEAD
	
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
	
	/*장바구니 옵션 변경*/
	public void cartoptionchange(ShoppingCartDTO sdto) {
		Odao.cartoptionchange(sdto);
		
	}

=======
	/*주문 수 반환*/
	public int countOrder() {
		return Odao.countOrder();
	}
	/*모든 주문 목록 출력 일정량만*/
	public List<OrderDTO> selectorder(OrderCare_PagingVO vo) {
		return Odao.selectOrder(vo);
	}
	public void deliveryChange(OrderDTO Odto) {
		Odao.deliveryChange(Odto);
	}
	public OrderDTO orderserch(String id) {
		return Odao.orderserch(id);
	}
>>>>>>> minhoeyk
}
