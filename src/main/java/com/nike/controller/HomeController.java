package com.nike.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nike.service.MemberService;
import com.nike.service.ProductService;
import com.nike.utils.UploadFileUtils;
import com.nike.memberInfo.MemberInfoDTO;
import com.nike.memberInfo.MemberInfo_PagingVO;
import com.nike.product.ProductDTO;
import com.nike.product.Product_sizeDTO;
import com.nike.service.MemberService;

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
	@Autowired
	MemberService memberservice;

	/*파일업로드 경로 servlet-context.xml에 id가 uploadPath인값을 가져온다.*/
	@Resource(name="uploadPath")
	private String uploadPath;

	
	
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
	
	/*남자 신발 전체목록*/
	@RequestMapping("Men")
	public String catalogMen(Model model) {
		Pservice.allListMen(model);
		
		return "jsj/Men/men";
	}
	
	/*남자 신발 카테코리별 전체조회*/
	@RequestMapping("Men/category")
	public String catalogMenCategory(Model model,@RequestParam("category") String category) {
		Pservice.allListMenCategory(model,category);
		return "jsj/Men/menCategory";
	}

	
	/*전체 신발 검색*/
	@RequestMapping("searchCheck")
	public String catalogMenSearch(Model model,@RequestParam("codename") String codename) {
		Pservice.searchCode(model,codename);
		return "jsj/search";
	}
	

	/*여자 신발 전체*/
	@RequestMapping("/Women")
	public String catalogWomen(Model model) {
		Pservice.allListWomen(model);
		return "jsj/Women/women";
	}
	
	/*여자 신발 카테고리별 전체조회*/
	@RequestMapping("/Women/category")
	public String catalogWomenCategory(Model model,@RequestParam("category") String category) {
		Pservice.allListWomenCategory(model,category);
		return "jsj/Women/womenCategory";
	}

	/*아동 신발 전체*/
	@RequestMapping("/Kids")
	public String catalogKids(Model model) {
		Pservice.allListKids(model);
		return "jsj/Kids/kids";
	}
	
	/*아동 신발 카체고리별 전체조회*/
	@RequestMapping("/Kids/category")
	public String catalogKidsCategory(Model model,@RequestParam("category") String category) {
		Pservice.allListKidsCategory(model,category);
		return "jsj/Kids/kidsCategory";
	}


	@RequestMapping("product_input")
	public String product_input(Product_sizeDTO sizedto, ProductDTO dto) throws Exception{
		Pservice.product_input(sizedto,dto);
		
		return "";
	}
	
	/*상품 등록*/

	@RequestMapping("product_management")
	public String product_management() {
		return "product_management";
	}
	/*고객관리*/
	@GetMapping("customer_care")
	public String customer_care(MemberInfo_PagingVO vo, Model model
								, @RequestParam(value="nowPage", required=false)String nowPage
								, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = service.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new MemberInfo_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging",vo);
		System.out.println(vo);
		model.addAttribute("viewAll",service.selectBoard(vo));
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
	/*마이페이지*/
	@RequestMapping("myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	
	/*마이페이지 사이드*/
	@RequestMapping("aside")
	public String aside() {
		return "myPage/myPageAside";
	}
	/*주문내역 배송현황*/
	@RequestMapping("orders")
	public String myOrder() {
		return "myPage/myPageOrderDelivery";
	}
	
	/*회원가입*/
	@RequestMapping("memberJoin")
	public String memberJoin() {
		return "member/memberJoin";
	}
	
	/*로그인페이지*/
	@RequestMapping("loginPage")
	public String loginPage() {
		return "member/loginPage";
	}
	
	/*비밀번호 찾을때 전화번호 or 아이디로 검색*/
	@RequestMapping("userSearch")
	public String userSearch(Model model, HttpServletRequest request) {
		String idtel = request.getParameter("idtel");
		service.searchId(model,idtel);
		return "member/userUpdate";
	}
	
	/*회원정보 비밀번호 수정*/
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
	
	/*마일리지 조회*/
	@RequestMapping("mileage")
	public String mileage(Model model, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		model.addAttribute("mile", service.mileage(id));
		return "myPage/myPageMileage";
	}
	
	/*회원정보 수정을 위한 회원정보 조회*/
	@RequestMapping("account")
	public String account(Model model, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		model.addAttribute("dto", service.account(id));
		return "myPage/myPageAccount";
	}
	/*회원정보 수정*/
	@RequestMapping("memberinfoModify")
	public String memberinfoModify(MemberInfoDTO dto, Model model) {
		service.memberinfoModify(dto, model);
		return "redirect:account";
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
	
	/*장바구니*/
	@RequestMapping("cart")
	public String cart() {
		return "purchase/cart";
	}
	/*구매*/
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
	@RequestMapping("/header")
	public String header() {
		return "sminj/header";
	}
	@RequestMapping("/footer")
	public String footer() {
		return "sminj/footer";
	}
	@RequestMapping("/main")
	public String main() {
		return "sminj/main";
	}
	
}
