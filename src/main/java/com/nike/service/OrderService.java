package com.nike.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.order.OrderCare_PagingVO;
import com.nike.order.OrderDAO;
import com.nike.order.OrderDTO;
import com.nike.order.Order_detailsDAO;
import com.nike.product.ProductDAO;

@Service
public class OrderService {
	@Autowired
	private OrderDAO Odao;
	@Autowired
	private Order_detailsDAO Ddao;
	
	/*구매후 등록*/
	public void productBuy(HttpServletRequest request,OrderDTO Odto) {
		Odao.buyRegister(Odto);
	}
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
}
