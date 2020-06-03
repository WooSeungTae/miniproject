package com.nike.controller;

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

import com.nike.service.FileUploadService;
import com.nike.service.MemberService;
import com.nike.service.OrderService;
import com.nike.service.ProductService;
import com.nike.memberInfo.MemberInfoDTO;
import com.nike.memberInfo.MemberInfo_PagingVO;
import com.nike.order.ShoppingCartDTO;
import com.nike.product.ProductDTO;
import com.nike.product.Product_sizeDTO;

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
	@Autowired
	OrderService orderservice;
	@Autowired
	FileUploadService fileUploadService;

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
	
	//관리자 상품관리(수정)
		@RequestMapping("productUpdate")
		public String productUpdate(ProductDTO pdto, HttpServletRequest request) {
			return null;
		}
		
		//관리자 상품관리(삭제)
		@RequestMapping("productDelete")
		public String productDelete(@RequestParam("code") String code) {
			Pservice.productDelete(code);
			return "productUpdate_Delete/productSelect";
		}
		
		//관리자 상품 목록 수정, 삭제를 위한 조회
		@RequestMapping("productSelect")
		public String productSelect(ProductDTO pdto , Model model) {
			model.addAttribute("pdto", Pservice.productSelect("CD4373-002"));
			return "productUpdate_Delete/productSelect";
		}
		
	@RequestMapping("loginChk")
	public String loginChk(HttpServletRequest request, MemberInfoDTO dto) {
		if(memberservice.loginChk(dto)==0) {
			return "member/loginPage";
		}else {
			HttpSession mySession = request.getSession();
			mySession.setAttribute("id", dto.getId());
			mySession.setAttribute("pwd", memberservice.beforePwd(dto.getPwd()));
			mySession.setAttribute("name", memberservice.nameget(dto.getId()));
			return "sminj/main";
		}
	}
	@RequestMapping("/saveUserInfo") //회원가입 정보 입력 
	public String saveUserInfo(MemberInfoDTO dto) {
		memberservice.saveUserInfo(dto);
		return "redirect:loginPage";
	}
	
	/*세부 상품 조회*/
	@RequestMapping("/productdetail")
	public String productdetail(Model model, HttpServletRequest request) {
		System.out.println("===============================" + request.getParameter("code"));
		model.addAttribute("pdto", Pservice.productdetail(request.getParameter("code")));
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

	/*상품 등록*/
	@RequestMapping("product_input")
	public String product_input(Product_sizeDTO sizedto, ProductDTO pdto,
			@RequestParam(value="file1", required=false) MultipartFile file1,
			@RequestParam(value="file2", required=false) MultipartFile file2,
			@RequestParam(value="file3", required=false) MultipartFile file3,
			@RequestParam(value="file4", required=false) MultipartFile file4,
			@RequestParam(value="file5", required=false) MultipartFile file5,
			@RequestParam(value="file6", required=false) MultipartFile file6, Model model){
		String code = pdto.getCode();
		if(Pservice.codeSearch(model, code) == 1) {
			System.out.println("등록 실행");
			if(pdto.getImage1().equals("image1")) {String url1 = fileUploadService.restore(file1);pdto.setImage1(url1);}
			if(pdto.getImage2().equals("image2")) {String url2 = fileUploadService.restore(file2);pdto.setImage2(url2);}
			if(pdto.getImage3().equals("image3")) {String url3 = fileUploadService.restore(file3);pdto.setImage3(url3);}
			if(pdto.getImage4().equals("image4")) {String url4 = fileUploadService.restore(file4);pdto.setImage4(url4);}
			if(pdto.getImage5().equals("image5")) {String url5 = fileUploadService.restore(file5);pdto.setImage5(url5);}
			if(pdto.getImage6().equals("image6")) {String url6 = fileUploadService.restore(file6);pdto.setImage6(url6);}
			Pservice.product_input(pdto);
			Pservice.product_size(sizedto);
		}
		return "redirect:product_management";
	}
	
	/*상품 등록 페이지*/
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
	public String aside(Model model, HttpServletRequest request, MemberInfoDTO dto) {
		HttpSession mySession = request.getSession();
		String name = (String) mySession.getAttribute("name");
		model.addAttribute("name", name);
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
	@RequestMapping("reviewintro")
	public String reviewintro() {
		return "myPage/myPageReviewintro";
	}
	/*장바구니*/
	@RequestMapping("cart")
	public String cart(ShoppingCartDTO sdto) {
		
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
	public String header(Model model, HttpServletRequest request, MemberInfoDTO dto) {
		HttpSession mySession = request.getSession();
		String name = (String)mySession.getAttribute("name");
		model.addAttribute("name", name);
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
	/* 로그아웃 */
	@RequestMapping("logout")
	public String logout(HttpSession mySession) {
		memberservice.logout(mySession);
		return "sminj/main";
	}
	/* 회원비밀번호 변경 */
	@RequestMapping("password")
	public String password(Model model, HttpServletRequest request, MemberInfoDTO dto) {
		HttpSession mySession = request.getSession();
		String pwd = (String)mySession.getAttribute("pwd");
		model.addAttribute("pwd", pwd);
		return "myPage/myPagePassword";
	}
	/* 회원탈퇴 */
	@RequestMapping("withdrawal")
	public String withdrawal() {
		return "myPage/myPageWithdrawal";
	}
	
}
