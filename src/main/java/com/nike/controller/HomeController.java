package com.nike.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
<<<<<<< HEAD
	@RequestMapping("product_management")
	public String product_management() {
		return "product_management";
	}
	@RequestMapping("customer_care")
	public String customer_care() {
		return "customer_care";
	}
	@RequestMapping("board_care")
	public String board_care() {
		return "board_care";
	}
	@RequestMapping("order_care")
	public String order_care() {
		return "order_care";
=======
	
	@RequestMapping("myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	@RequestMapping("aside")
	public String aside() {
		return "myPage/myPageAside";
	}
	@RequestMapping("orders")
	public String myOrder() {
		return "myPage/myPageOrderDelivery";
	}
	
	@RequestMapping("returnable")
	public String myPageReturn() {
		return "myPage/myPageReturn";
	}
	@RequestMapping("mileage")
	public String mileage() {
		return "myPage/myPageMileage";
	}
	
	@RequestMapping("account")
	public String account() {
		return "myPage/myPageAccount";
	}
	
	@RequestMapping("password")
	public String password() {
		return "myPage/myPagePassword";
	}
	
	@RequestMapping("withdrawal")
	public String withdrawal() {
		return "myPage/myPageWithdrawal";
	}
	@RequestMapping("cart")
	public String cart() {
		return "cart";
	}
	
	@RequestMapping("reviewintro")
	public String reviewintro() {
		return "myPage/myPageReviewintro";
>>>>>>> branch 'master' of https://github.com/WooSeungTae/miniproject.git
	}
}
