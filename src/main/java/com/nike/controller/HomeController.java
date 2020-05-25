package com.nike.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nike.service.MemberService;

import com.nike.memberInfo.MemberInfoDTO;
import com.nike.service.MemberService;

import com.nike.memberInfo.MemberInfoDTO;
import com.nike.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	MemberService service;
	
	@Autowired
	MemberService memberservice;
	
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
	
	
	@RequestMapping("loginChk")
	public String loginChk(HttpServletRequest request, MemberInfoDTO dto) {
		if(memberservice.loginChk(dto)==0) {
			return "member/loginPage";
		}else {
			HttpSession mySession = request.getSession();
			mySession.setAttribute("id", dto.getId());
			return "sminj/main";
		}
	}
	
	@RequestMapping("/saveUserInfo") //회원가입 정보 입력 
	public String saveUserInfo(MemberInfoDTO dto) {
		memberservice.saveUserInfo(dto);
		return "redirect:loginPage";
	}

	@RequestMapping("/productdetail")
	public String productdetail() {
		return "jsj/product_detail";
	}
	
	@RequestMapping("/catalog")
	public String catalog() {
		return "jsj/catalog";
	}
	/*상품 등록*/
	@RequestMapping("product_management")
	public String product_management() {
		return "product_management";
	}
	/*고객관리*/
	@RequestMapping("customer_care")
	public String customer_care(Model model) {
		service.memberlist(model);
		return "customer_care";
	}
	/*고객관리 페이지 검색기능*/
	@RequestMapping("memberserch")
	public String memberserch(Model model,HttpServletRequest request) {
		model.addAttribute("request",request);
		service.memberserchlist(model);
		return "customer_care2";
	}
	/*고객관리 페이지 삭제기능*/
	@RequestMapping("memberdelete")
	public String memberdelete(@RequestParam("id") String id) {
		service.memberdelete(id);
		return "redirect:customer_care";
	}
	/*게시판관리*/
	@RequestMapping("board_care")
	public String board_care() {
		return "board_care";
	}
	/*주문관리*/
	@RequestMapping("order_care")
	public String order_care() {
		return "order_care";
	}
	/*상품관리*/
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
	public String mileage(Model model, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		model.addAttribute("mile", service.mileage(id));
		System.out.println("======================="+service.mileage(id));
		
		return "myPage/myPageMileage";
	}
	
	@RequestMapping("account")
	public String account(Model model, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		model.addAttribute("dto", service.account(id));
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
	
	@RequestMapping("memberinfoModify")
	public String memberinfoModify(MemberInfoDTO dto, Model model) {
		service.memberinfoModify(dto, model);
		return "redirect:account";
	}
}
