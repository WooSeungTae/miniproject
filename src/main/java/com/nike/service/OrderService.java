package com.nike.service;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.order.OrderDAO;

@Service
public class OrderService {
	
	@Autowired
	OrderDAO odao;
=======
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;
import com.nike.order.OrderDAO;
import com.nike.order.OrderDTO;
import com.nike.order.Order_detailsDAO;
import com.nike.order.Order_detailsDTO;
import com.nike.product.ProductDAO;

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
>>>>>>> minhoeyk
}
