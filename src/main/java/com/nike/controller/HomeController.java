package com.nike.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nike.memberInfo.MemberInfoDTO;
import com.nike.product.ProductDTO;
import com.nike.service.MemberService;
import com.nike.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	MemberService service;
	@Autowired
	ProductService Pservice;
	
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

	@RequestMapping("/productdetail")
	public String productdetail() {
		return "jsj/product_detail";
	}
	
	@RequestMapping("/catalogMen")
	public String catalogMen(Model model) {
		Pservice.allListMen(model);
		return "jsj/Men/catalogMen";
	}
	@RequestMapping("/catalogMenRun")
	public String catalogMenRun(Model model) {
		Pservice.allListMenRun(model);
		return "jsj/Men/catalogMenRun";
	}
	@RequestMapping("/catalogMenBasket")
	public String catalogMenBasket(Model model) {
		Pservice.allListMenBasket(model);
		return "jsj/Men/catalogMenBasket";
	}
	@RequestMapping("/catalogMenSoccer")
	public String catalogMenSoccer(Model model) {
		Pservice.allListMenSoccer(model);
		return "jsj/Men/catalogMenSoccer";
	}
	
	@RequestMapping("/catalogWomen")
	public String catalogWomen() {
		return "jsj/Women/catalogWomen";
	}
	
	@RequestMapping("/catalogWomenRun")
	public String catalogWomenRun() {
		return "jsj/Women/catalogWomenRun";
		
	}	@RequestMapping("/catalogWomenBasket")
	public String catalogWomenBasket() {
		return "jsj/Women/catalogWomenBasket";
		
	}	@RequestMapping("/catalogWomenSoccer")
	public String catalogWomenSoccer() {
		return "jsj/Women/catalogWomenSoccer";
	}
	
	@RequestMapping("/catalogKids")
	public String catalogKids() {
		return "jsj/Kids/catalogKids";
	}
	
	@RequestMapping("/catalogKidsRun")
	public String catalogKidsRun() {
		return "jsj/Kids/catalogKidsRun";
	}
	@RequestMapping("/catalogKidsBasket")
	public String catalogKidsBasket() {
		return "jsj/Kids/catalogKidsBasket";
	}
	@RequestMapping("/catalogKidsSoccer")
	public String catalogKidsSoccer() {
		return "jsj/Kids/catalogKidsSoccer";
	}
	
	

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
	}
	@RequestMapping("inventory")
	public String inventory() {
		return "inventory";
	}
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
	@RequestMapping("memberJoin")
	public String memberJoin() {
		return "member/memberJoin";
	}
	@RequestMapping("loginPage")
	public String loginPage() {
		return "member/loginPage";
	}
	@RequestMapping("userSearch")
	public String userSearch(Model model, HttpServletRequest request) {
		String idtel = request.getParameter("idtel");
		service.searchId(model,idtel);
		return "member/userUpdate";
	}
	@RequestMapping("userUpdate")
	public String userUpdate(MemberInfoDTO dto) {
		service.pwdUpdate(dto);
		return "member/loginPage";
	}
	
	@RequestMapping("TestMainPage")
	public String TestMainPage() {
		return "member/TestMainPage";
	}
	@RequestMapping("userReset")
	public String userReset() {
		return "member/userReset";
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
	
	@RequestMapping("reviewintro")
	public String reviewintro() {
		return "myPage/myPageReviewintro";
	}
	@RequestMapping("cart")
	public String cart() {
		return "purchase/cart";
	}
	@RequestMapping("checkout")
	public String checkOut() {
		return "purchase/checkOut";
	}
	@RequestMapping("myreviewlistall")
	public String myreviewlistall() {
		return "myPage/myPagemyReviewlistall";
	}
	
	@RequestMapping("towritelistall")
	public String myPageTowritelistall() {
		return "myPage/myPageTowritelistall";
	}
	@RequestMapping("header")
	public String header() {
		return "sminj/header";
	}
	@RequestMapping("footer")
	public String footer() {
		return "sminj/footer";
	}
	@RequestMapping("main")
	public String main() {
		return "sminj/main";
	}
}
