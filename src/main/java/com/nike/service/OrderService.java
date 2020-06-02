package com.nike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.order.OrderDAO;

@Service
public class OrderService {
	
	@Autowired
	OrderDAO odao;
}
