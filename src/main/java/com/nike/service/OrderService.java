package com.nike.service;

<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
<<<<<<< HEAD
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
=======
=======

import java.util.List;
>>>>>>> jsj
>>>>>>> 2cea2c58b142cb5b3f1b34a9c821cee968b30e49

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;
import com.nike.order.OrderDAO;
<<<<<<< HEAD
import com.nike.order.OrderDTO;
import com.nike.order.Order_detailsDAO;
import com.nike.order.Order_detailsDTO;
import com.nike.product.ProductDAO;
=======
import com.nike.order.ShoppingCartDTO;
>>>>>>> jsj

@Service
public class OrderService {
	@Autowired
<<<<<<< HEAD
	private OrderDAO Odao;
	@Autowired
	private MemberInfoDAO dao;
	@Autowired
	private ProductDAO pdao;
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
=======
	OrderDAO odao;
	
	/*장바구니 DB에 값을 저장*/
	public void insertcart(ShoppingCartDTO sdto) {
		odao.insertcart(sdto);
	}
	
	/*장바구니 DB에서 회원별 리스트 가져오기*/
	public List<ShoppingCartDTO> selectcart(String id) {
		return odao.selectcart(id);
	}
	
	/*장바구니 DB에서 리스트 개수 가져오기*/
	public int countcart(String id) {
		return odao.countcart(id);
	}
	
	/*회원별 장바구니에 있는 아이템 전부 삭제*/
	public void cartAlldelete(String id) {
		odao.cartAlldelete(id);
	}
	
	/*장바구니 DB에서 회원별 총 금액 가져오기*/
	public int totalprice(String id) {
		return odao.totalprice(id);
	}
	
	/*회원별 장바구니에서 x누른 아이템 삭제*/
	public void cartitemdelete(ShoppingCartDTO sdto) {
		odao.cartitemdelete(sdto);
	}

	
>>>>>>> jsj
}
