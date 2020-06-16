package com.nike.controller;


import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.apache.http.protocol.HTTP;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.nike.service.BoardService;
import com.nike.service.CommentService;
import com.nike.service.FileUploadService;
import com.nike.service.KakaoAPI;
import com.nike.service.FileUploadService2;
import com.nike.service.MemberService;
import com.nike.service.OrderService;
import com.nike.service.ProductService;
import com.nike.service.ReviewService;
import com.nike.service.ReviewUploadService;
import com.nike.board.ReviewDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nike.board.Board_PagingVO;
import com.nike.board.CommentDTO;
import com.nike.board.SearchBoardDTO;
import com.nike.board.QABoardDTO;
import com.nike.memberInfo.MemberInfoDTO;
import com.nike.memberInfo.MemberInfo_PagingVO;
import com.nike.order.OrderDTO;
import com.nike.order.Order_detailsDTO;
import com.nike.order.Cart_PagingVO;
import com.nike.order.OrderCare_PagingVO;
import com.nike.order.ShoppingCartDTO;
import com.nike.product.ProductDTO;
import com.nike.product.Product_PagingVO;
import com.nike.product.Product_sizeDTO;
import com.nike.product.*;

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
	ReviewService reviewservice;
	@Autowired
	FileUploadService fileUploadService;
	@Autowired
    private KakaoAPI kakao;
	@Autowired
	ReviewUploadService reviewUploadService;
	@Autowired
	FileUploadService2 fileUploadService2;
	@Autowired
	BoardService bservice;
	@Autowired
	CommentService cservice;

	/*파일업로드 경로 servlet-context.xml에 id가 uploadPath인값을 가져온다.*/
	@Resource(name="uploadPath")
	private String uploadPath;
	
	/*리뷰파일 업로드 경로*/
	@Resource(name="uploadPath2")
	private String uploadPath2;
	
	/*관리자 파일 수정 업로드*/
	@Resource(name="uploadPath3")
	private String uploadPath3;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, 
			@RequestParam(value="code", required=false) String code,
			HttpSession session) {
		if(code != null) {
			String access_Token = kakao.getAccessToken(code);
		    HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		    if (userInfo.get("email") != null) {
		    	session.setAttribute("id", userInfo.get("email"));
		    	session.setAttribute("name", userInfo.get("nickname"));
		    	session.setAttribute("access_Token", access_Token);
		    }
		}
		return "/sminj/main";
	}
	
		
	//최근 주문 내역 페이지
			@RequestMapping("myPage1")
			public String myPage1(HttpServletRequest request, Model model) {
				HttpSession mySession = request.getSession();
				String id = (String) mySession.getAttribute("id");
				System.out.println("====================="+id);
				orderservice.myPage1(id);
				model.addAttribute("Ddto",orderservice.myPage1(id));
				System.out.println(orderservice.myPage1(id));
				List<Order_detailsDTO> list = orderservice.myPage1(id);
				System.out.println(list.get(0).getOrderDate());
				return "product_update/myPage1";
			}
	
		//남이 나의 리뷰를 볼 때
		@RequestMapping("reviewsearch")
		public String reviewsearch(@RequestParam(value="reviewnum", required=false) int reviewnum, Model model) {
			model.addAttribute("rdto", reviewservice.reviewsearch(reviewnum));
			return "/board/review_Search";
		}
		//리뷰 등록
		@RequestMapping("reviewform")
		public String review(HttpServletRequest request, Model model) {
			HttpSession mySession = request.getSession();
			String id = (String) mySession.getAttribute("id");
			String name = (String)mySession.getAttribute("name");
			String code = request.getParameter("code");
			String codename = request.getParameter("codename");
			model.addAttribute("id", id);
			model.addAttribute("name", name);
			model.addAttribute("code", "CN9600-002");
			model.addAttribute("codename", "나이키 조이라이드 듀얼 런");
			return "board/review_Register";
		}
		//ReviewDTO rdto, HttpServletRequest request,
		
		//리뷰 저장
		@RequestMapping(value="reviewsave", method=RequestMethod.POST)
		public String reviewsave(ReviewDTO rdto, HttpServletRequest request, @RequestParam(value="file", required=false) MultipartFile file) {
			if(file.getOriginalFilename()!=null) {
				String url1 = reviewUploadService.restore(file);
				rdto.setImage(url1);
			}
			HttpSession mySession = request.getSession();
			String id = (String) mySession.getAttribute("id");
			rdto.setId(id);
			reviewservice.review_save(rdto);
			return "redirect:reviewintro";
			
		}
		
		//마이페이지 나의 리뷰 수정하기, 삭제하기 하기 위한 폼
		@RequestMapping("myreview")
		public String myreview(HttpServletRequest request, Model model, ReviewDTO rdto) {
			String reviewnum = request.getParameter("reviewnum");
			HttpSession mySession = request.getSession();
			String id = (String) mySession.getAttribute("id");
			rdto.setId(id);
			rdto.setReviewNum(Integer.parseInt(reviewnum));
			rdto.setId("hong");
			rdto.setReviewNum(9);
			model.addAttribute("rdto", reviewservice.reviewitem(rdto));
			System.out.println("====================================================="+rdto.getImage());
			return "board/reviewform";
		}
		
		//마이페이지 나의 리뷰 삭제하기
		@RequestMapping("reviewdelete")
		public String reviewdelete(HttpServletRequest request, ReviewDTO rdto) {
			String reviewnum = request.getParameter("reviewnum");
			HttpSession mySession = request.getSession();
			String id = (String) mySession.getAttribute("id");
//			rdto.setId(id);
//			rdto.setReviewNum(Integer.parseInt(reviewnum));
			rdto.setId("hong");
			rdto.setReviewNum(9);
			reviewUploadService.deletefile(rdto.getImage());
			reviewservice.reviewdelete(rdto);
			return "redirect:reviewintro";
		}
		
		//마이페이지 나의 리뷰 수정하기
		@RequestMapping("reviewmodify")
		public String reviewmodify(HttpServletRequest request, ReviewDTO rdto,  
				@RequestParam(value="file", required=false) MultipartFile file,
				@RequestParam(value="reviewnum") String reviewnum,
				@RequestParam(value="beforefile") String beforefile) {
			HttpSession mySession = request.getSession();
			String id = (String) mySession.getAttribute("id");
			rdto.setReviewNum(Integer.parseInt(reviewnum));
			rdto.setId(id);
			if(file.getOriginalFilename()!="") {
				System.out.println("========================================" + file.getOriginalFilename());
				System.out.println("=====================================파일있음");
				System.out.println("=====================================" + file);
				System.out.println("===========================beforefile+"+beforefile);
				String url1 = reviewUploadService.restore(file);
				rdto.setImage(url1);
				reviewservice.reviewmodify(rdto);
				reviewUploadService.deletefile(beforefile);
				return "redirect:reviewintro";
			}else {
				reviewservice.reviewitem(rdto);
				return "redirect:reviewintro";
			}
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

		//관리자 상품관리 - 수정기능
		@RequestMapping("productupdate")
		public String productupdate(Product_sizeDTO sizedto, ProductDTO pdto,
				@RequestParam(value="file1", required=false) MultipartFile file1,
				@RequestParam(value="file2", required=false) MultipartFile file2,
				@RequestParam(value="file3", required=false) MultipartFile file3,
				@RequestParam(value="file4", required=false) MultipartFile file4,
				@RequestParam(value="file5", required=false) MultipartFile file5,
				@RequestParam(value="file6", required=false) MultipartFile file6) {
				System.out.println("========================================pdto" + pdto.getCode());
				System.out.println("==========================================pdto" + pdto.getImage1());
				System.out.println("===========================================file1"+file1.getOriginalFilename());
				if(file1.getOriginalFilename()!="") {
					String url1 = fileUploadService2.restore(file1);
					if(url1!=pdto.getImage1()&&pdto.getImage1()!=null) {
						System.out.println("================================url1" + url1);
						System.out.println("================================beforefile1===" + pdto.getImage1());
						fileUploadService2.deletefile(pdto.getImage1());
						pdto.setImage1(url1);
					}
				}
				if(file2.getOriginalFilename()!="") {
					String url2 = fileUploadService2.restore(file2);
					if(url2!=pdto.getImage2()&&pdto.getImage2()!=null) {
						fileUploadService2.deletefile(pdto.getImage2());
						pdto.setImage2(url2);
					}
				}
				if(file3.getOriginalFilename()!="") {
					String url3 = fileUploadService2.restore(file3);
					if(url3!=pdto.getImage3()&&pdto.getImage3()!=null) {
						fileUploadService2.deletefile(pdto.getImage3());
						pdto.setImage3(url3);
					}
				}
				if(file4.getOriginalFilename()!="") {
					String url4 = fileUploadService2.restore(file4);
					if(url4!=pdto.getImage4()&&pdto.getImage4()!=null) {
						fileUploadService2.deletefile(pdto.getImage4());
						pdto.setImage4(url4);
					}
				}
				if(file5.getOriginalFilename()!="") {
					String url5 = fileUploadService2.restore(file5);
					if(url5!=pdto.getImage5()&&pdto.getImage5()!=null) {
						fileUploadService2.deletefile(pdto.getImage5());
						pdto.setImage5(url5);
					}
				}
				if(file6.getOriginalFilename()!="") {
					String url6 = fileUploadService2.restore(file6);
					if(url6!=pdto.getImage6()&&pdto.getImage6()!=null) {
						fileUploadService2.deletefile(pdto.getImage6());
						pdto.setImage6(url6);
					}
				}
				Pservice.product_update(pdto);
				Pservice.size_update(sizedto);
					
				return "redirect:inventory";
			
		}
		
		//관리자 상품관리폼(수정)
		@RequestMapping("productview")
		public String productview(@RequestParam("code") String code,Model model) {
			//관리자 상품 목록 수정, 삭제를 위한 조회(상품)
			ProductDTO pdto = Pservice.productSelect(code);
			model.addAttribute("pdto", Pservice.productSelect(code));
			System.out.println("===========================================" + pdto.getImage1());
			//관리자 상품 목록 수정, 삭제를 위한 조회(사이즈)
			model.addAttribute("sdto", Pservice.sizeSelect(code));
			return "product_update/productViewPage";
		}
		
		//마이페이지 나의 리뷰 보여주기
		@RequestMapping("reviewintro")
		public String reviewintro(HttpSession session, Model model,OrderCare_PagingVO vo
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			SearchBoardDTO searchdto = new SearchBoardDTO();
			searchdto.setSearch_key("id");
			searchdto.setSearch((String)session.getAttribute("id"));
			int total = reviewservice.searchreviewcount(searchdto);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			vo.setSearch_key("id");
			vo.setSearch((String)session.getAttribute("id"));
			model.addAttribute("paging",vo);
			model.addAttribute("viewAll",reviewservice.searchreview(vo));
			return "myPage/myPageReviewintro";
		}
		
		/*마이페이지 QnA*/
		@RequestMapping("mypageQnA")
		public String myreviewlistall(HttpSession session,Model model,OrderCare_PagingVO vo
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			SearchBoardDTO searchdto = new SearchBoardDTO();
			searchdto.setSearch_key("id");
			searchdto.setSearch((String)session.getAttribute("id"));
			int total = bservice.searchQnAcount(searchdto);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			vo.setSearch_key("id");
			vo.setSearch((String)session.getAttribute("id"));
			model.addAttribute("paging",vo);
			model.addAttribute("viewAll",bservice.searchQnA(vo));
			return "myPage/mypageQnA";
		}
		
		//관리자 상품관리(삭제)
		@RequestMapping("productDelete")
		public String productDelete(@RequestParam("code") String code) {
			System.out.println(code);
			fileUploadService2.deletefile(Pservice.productSelect(code).getImage1());
			fileUploadService2.deletefile(Pservice.productSelect(code).getImage2());
			fileUploadService2.deletefile(Pservice.productSelect(code).getImage3());
			fileUploadService2.deletefile(Pservice.productSelect(code).getImage4());
			fileUploadService2.deletefile(Pservice.productSelect(code).getImage5());
			fileUploadService2.deletefile(Pservice.productSelect(code).getImage6());
			Pservice.productDelete(code);
			Pservice.sizeDelete(code);
			return "redirect:inventory";
		}
		
		
		/*상품관리*/
		@RequestMapping("inventory")
		public String inventory(Inventory_PagingVO vo, Model model, HttpSession session
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			String id = (String) session.getAttribute("id");
			if(id != null) {
				if(id.equals("admin")) {
					int total = Pservice.countProduct();
					if (nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "5";
					} else if (nowPage == null) {
						nowPage = "1";
					} else if (cntPerPage == null) { 
						cntPerPage = "5";
					}
					vo = new Inventory_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					model.addAttribute("paging",vo);
					model.addAttribute("searchCode",Pservice.selectProduct(vo));
					return "inventory";	
				}
				else return"redirect:/";
			}
			else return"redirect:/";
		}
		/*상품 관리 페이지 검색기능*/
		@RequestMapping("productserch")
		public String productserch(InventoryCare_PagingVO vo, Model model,SearchBoardDTO searchdto
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			int total = (int)Pservice.searchShose(searchdto);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new InventoryCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			vo.setSearch_key(searchdto.getSearch_key());
			vo.setSearch(searchdto.getSearch());
			model.addAttribute("paging",vo);
			model.addAttribute("searchCode",Pservice.productserch(vo));
			return "inventory";
		}
	
	@RequestMapping("loginChk")
	public String loginChk(HttpServletRequest request, MemberInfoDTO dto) {
		if(memberservice.loginChk(dto)==0) {
			return "member/loginPage";
		}else {
			HttpSession mySession = request.getSession();
			mySession.setAttribute("id", dto.getId());
			mySession.setAttribute("name", memberservice.nameget(dto.getId()));
			mySession.setAttribute("pwd", memberservice.beforePwd(dto.getId()));
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
		String code = request.getParameter("code");
		int totalqa = bservice.qatotal(code); //Q&A게시판 코드로 검색했을경우 검색물 총 개수
		int totalrv = reviewservice.rvtotal(code); //review게시판 코드로 검색했을경우 검색물 총 개수
		model.addAttribute("totalqa", totalqa);
		model.addAttribute("totalrv", totalrv);
		model.addAttribute("pdto", Pservice.productdetail(request.getParameter("code")));
		return "jsj/product_detail";
	}

	/*남자 신발 전체목록*/
	@RequestMapping("Men")
	public String catalogMen(Product_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.genderAll("남자");
		if (nowPage == null) {nowPage = "1";}
		vo = new Product_PagingVO(total, Integer.parseInt(nowPage));
		Pservice.allListMen(model,vo);
		return "jsj/Men/men";
	}
	
	/*여자 신발 전체목록*/
	@RequestMapping("/Women")
	public String catalogWomen(Product_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.genderAll("여자");
		if (nowPage == null) {nowPage = "1";}
		vo = new Product_PagingVO(total, Integer.parseInt(nowPage));
		Pservice.allListWomen(model,vo);
		return "jsj/Women/women";
	}
	
	/*아동 신발 전체목록*/
	@RequestMapping("/Kids")
	public String catalogKids(Product_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.genderAll("키즈");
		if (nowPage == null) {nowPage = "1";}
		vo = new Product_PagingVO(total, Integer.parseInt(nowPage));
		Pservice.allListKids(model,vo);
		return "jsj/Kids/kids";
	}
	
	/*남자 신발 카테코리별 전체조회*/
	@RequestMapping("Men/category")
	public String catalogMenCategory(Model model,@RequestParam("category") String category,Product_PagingVO vo
				, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.categoryGenderAll("남자", category);
		if (nowPage == null) {nowPage = "1";}
		vo =  new Product_PagingVO(total,Integer.parseInt(nowPage),category);
		Pservice.allListMenCategory(model,vo);
		return "jsj/Men/menCategory";
	}

	/*여자 신발 카테고리별 전체조회*/
	@RequestMapping("/Women/category")
	public String catalogWomenCategory(Model model,@RequestParam("category") String category,Product_PagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="code", required=false)String code) {
		int total = Pservice.categoryGenderAll("여자", category);
		if (nowPage == null) {nowPage = "1";}
		vo =  new Product_PagingVO(total,Integer.parseInt(nowPage),category);
		Pservice.allListWomenCategory(model,vo);
		return "jsj/Women/womenCategory";
	}
	
	
	/*아동 신발 카체고리별 전체조회*/
	@RequestMapping("/Kids/category")
	public String catalogKidsCategory(Model model,@RequestParam("category") String category,Product_PagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.categoryGenderAll("키즈", category);
		if (nowPage == null) {nowPage = "1";}
		vo =  new Product_PagingVO(total,Integer.parseInt(nowPage),category);
		Pservice.allListKidsCategory(model,vo);
		return "jsj/Kids/kidsCategory";
	}
	
	/*전체 신발 검색*/
	@RequestMapping("searchCheck")
	public String catalogMenSearch(Product_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="codename", required=false) String codename) {
		Double total = (double)Pservice.searchShose(codename);
		if (nowPage == null) {nowPage = "1";}
		vo = new Product_PagingVO(total,Integer.parseInt(nowPage),codename);
		Pservice.searchCode(model,vo);
		return "jsj/search";
	}
	

	

	
	/*상품 등록 페이지*/
	@RequestMapping("product_management")
	public String product_management(HttpSession session) {
		String id = (String) session.getAttribute("id");
		if(id != null) {
			if(id.equals("admin")) {
					return "product_management";
			}
			else return"redirect:/";
		}
		else return"redirect:/";
	}
	/*고객관리*/
	@GetMapping("customer_care")
	public String customer_care(MemberInfo_PagingVO vo, Model model, HttpSession session
								, @RequestParam(value="nowPage", required=false)String nowPage
								, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		String id = (String) session.getAttribute("id");
		if(id != null) {
			if(id.equals("admin")) {
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
				model.addAttribute("viewAll",service.selectBoard(vo));
				return "customer_care";
			}
			else return"redirect:/";
		}
		else return"redirect:/";
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
	public String order_care(OrderCare_PagingVO vo, Model model, HttpSession session
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		String id = (String) session.getAttribute("id");
		if(id != null) {
			if(id.equals("admin")) {
				int total = orderservice.countOrder();
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "5";
				}
				vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("paging",vo);
				model.addAttribute("viewAll",orderservice.selectorder(vo));
				return "order_care";
			}
			else return"redirect:/";
		}
		else return"redirect:/";
	}
	@RequestMapping("deliveryChange")
	public String deliveryChange(OrderDTO Odto) {
		orderservice.deliveryChange(Odto);
		return "redirect:order_care";
	}
	@RequestMapping("orderserch")
	public String orderserch(Model model,@RequestParam("id") String id) {
		model.addAttribute("viewAll",orderservice.orderserch(id));
		return "order_care2";
	}
	/*마이페이지*/
	@RequestMapping("myPage")
	public String myPage() {
		return "redirect:myPage1";
	}
	
	/*마이페이지 사이드*/
	@RequestMapping("aside")
	public String aside(Model model, HttpServletRequest request, MemberInfoDTO dto) {
		HttpSession mySession = request.getSession();
		String name = (String) mySession.getAttribute("name");
		model.addAttribute("name", name);
		return "myPage/myPageAside";
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
	

	/*장바구니 DB에 값 저장하기*/
	@RequestMapping("cartSave")
	public String cartSave(ShoppingCartDTO sdto, HttpServletRequest request, Model model) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		String code = request.getParameter("code");
		sdto.setId(id);
		sdto.setCode(code);
		/*이미 있는 아이템은 더이상 장바구니에 추가 못함*/
		System.out.println("=========================================="+orderservice.checkitem(sdto));
		if(orderservice.checkitem(sdto)==0) {
			/*장바구니에 상품명 저장하는 기능*/
			sdto.setCodename(Pservice.codnameget(sdto.getCode()));
			/*장바구니에 대표사진 저장하는 기능*/
			sdto.setImage1(Pservice.image1get(sdto.getCode()));
			/*장바구니에 가격 저장하는 기능*/
			sdto.setPrice(Pservice.priceget(sdto.getCode()));
			/*장바구니 DB에 값을 저장*/
			orderservice.insertcart(sdto);
			return "redirect:cart";
		}else {
			model.addAttribute("noadd", -1);
			return "redirect:productdetail?code="+code;
		}
	}

	/*장바구니*/
	@RequestMapping("cart")
	public String cart(Cart_PagingVO cpvo, ShoppingCartDTO sdto, HttpServletRequest request, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage",required=false)String cntPerPage) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		int total = orderservice.countcart(id);
		if(total>0) {
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "3";
			}else if(nowPage == null) {
				nowPage = "1";
			}else if(cntPerPage == null) {
				cntPerPage = "3";
			}
			cpvo = new Cart_PagingVO(id, total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("=====================================" + orderservice.cartpaging(cpvo));
			model.addAttribute("paging", cpvo);
			/*장바구니 DB에서 회원별 리스트 가져오기*/
			model.addAttribute("cartlist", orderservice.cartpaging(cpvo));
			
		}
		
		/*장바구니 DB에서 리스트 개수 가져오기*/
		System.out.println("==========================================" + orderservice.countcart(id));
		model.addAttribute("cartcount", total);
		/*장바구니 DB에서 회원별 총 금액 가져오기*/
		model.addAttribute("totalprice", orderservice.totalprice(id));
		return "purchase/cart";
	}
	
	
	
	/*장바구니 옵션창 뜨게 함*/
	@RequestMapping("cartoption")
	public String cartoption(@RequestParam("code") String code, Model model) {
		model.addAttribute("code", code);
		return "purchase/cartoption";
	}
	
	/*장바구니 옵션 변경*/
	@RequestMapping("cartoptionchange")
	public String cartoptionchange(ShoppingCartDTO sdto, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		sdto.setId(id);
		sdto.setCode(request.getParameter("code"));
		System.out.println("==============================================="+sdto.getCode());
		System.out.println("==============================================="+sdto.getOrdersize());
		System.out.println("==============================================="+sdto.getCount());
		orderservice.cartoptionchange(sdto);
		return "redirect:cart";
	}
	/*회원별 장바구니에 있는 아이템 전부 삭제*/
	@RequestMapping("cartAlldelete")
	public String cartAlldelete(HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		orderservice.cartAlldelete(id);
		return "redirect:cart";
	}
	
	/*회원별 장바구니에서 x누른 아이템 삭제*/
	@RequestMapping("cartitemdelete")
	public String cartitemdelete(ShoppingCartDTO sdto, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		sdto.setId(id);
		sdto.setCode(request.getParameter("code"));
		orderservice.cartitemdelete(sdto);
		return "redirect:cart";
	}
	
	/*구매*/
	@RequestMapping("checkoutQuick")
	public String checkOut(Model model,@SessionAttribute(value="id",required=false) String id, @Param("code") String code
			,@Param("ordersize") String ordersize
			,@Param("count") String count) {
		if(id!=null)service.searchId(model, id);
		Pservice.codeSearch(model, code);
		model.addAttribute("ordersize", ordersize);
		model.addAttribute("count", count);
		return "purchase/checkOut";
	}
	
	/*장바구니에서 구매*/
	@RequestMapping("checkoutCart")
	public String checkoutCart(Model model,@SessionAttribute(value="id",required=false) String id) {
		if(id!=null) {service.searchId(model, id);}
		else {return "redirect:loginPage";}
		model.addAttribute("cartlist",orderservice.selectcart(id));
		model.addAttribute("totalmoney", orderservice.totalprice(id));
		return "purchase/checkOutCart";
	}

	/*구매후 등록*/
	@RequestMapping("productBuy0")
	public String productBuy(OrderDTO Odto,Order_detailsDTO Ddto,MemberInfoDTO dto,HttpServletRequest request) {
		//System.out.println("호출");
		orderservice.productBuy(Odto,Ddto,dto,request);
		return "product_update/myPage1";
	}
	
	/*구매후 등록*/
	@RequestMapping("productBuyCart")
	public String productBuyCart(OrderDTO Odto,Order_detailsDTO Ddto,MemberInfoDTO dto,HttpServletRequest request) {
		//System.out.println("호출");
		orderservice.productBuyCart(Odto,Ddto,dto,request);
		return "redirect:myPage1";
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
		if((String)mySession.getAttribute("access_Token") != null) {
			kakao.kakaoLogout((String)mySession.getAttribute("access_Token"));
		}
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
	/* 비밀번호 변경완료 페이지(쇼핑계속하기) */
	@RequestMapping("pwdSuccess")
	public String pwdSuccess(MemberInfoDTO dto, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String)mySession.getAttribute("id");
		dto.setId(id);
		memberservice.pwdModify(dto);
		return "sminj/pwd_ModifySuccess";
	}
	/* 회원탈퇴 */
	@RequestMapping("withdrawal")
	public String withdrawal() {
		return "myPage/myPageWithdrawal";
	}
	/* 회원탈퇴 완료 페이지 */
	@RequestMapping("userDelete")
	public String userDelete(MemberInfoDTO dto, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String)mySession.getAttribute("id");
		dto.setId(id);
		memberservice.userDelete(dto);
		memberservice.logout(mySession);
		return "sminj/userDelete";
	}
	/* 주문내역 및 배송현황 조회 */
	@RequestMapping("orderList")
	public String orderView(Order_detailsDTO Ddto, Model model, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		List<Order_detailsDTO> orderList = orderservice.orderList(id);
		model.addAttribute("orderList", orderList);
		return "myPage/myPageOrderDelivery";
	}
	/* 주문내역 상세페이지 - 주문자 및 결제정보 */
	@RequestMapping("orderView")
	public String orderView(OrderDTO Odto, Order_detailsDTO Ddto, Model model, HttpServletRequest request) {
		String ordernum = (String)  request.getParameter("ordernum");
		System.out.println(ordernum);
		List<Order_detailsDTO> orderList = orderservice.orderList_num(ordernum);
		System.out.println(orderList.get(0).getOrdernum());
		List<OrderDTO> orderView = orderservice.orderView_num(ordernum);
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderView", orderView);
		return "sminj/orderView";
	}
	/*	
	@RequestMapping("orderView")
	public String orderView() {
		return "sminj/orderView";
	}
*/
	/* 주문내역 및 배송현황 페이지 - 배송 상태 변경*/
	@RequestMapping(value="/myPage/myPageOrderDelivery", method=RequestMethod.POST)
	public String delivery(Order_detailsDTO Ddto) {
		orderservice.delivery(Ddto);
		return "redirect:/myPage/myPageOrderDelivery?=" + Ddto.getOrdernum();
	}
	/*Q&A 게시물 등록*/
	@RequestMapping("qaregister")
	public String qaregister(QABoardDTO Qdto) {
		bservice.qaregister(Qdto);
		System.out.println("등록 실행");
		return "myPage/myPage";
	}
	/*Q&A 게시물 수정*/
	@RequestMapping("qaupdate")
	public String qaupdate(QABoardDTO Qdto) {
		bservice.qaupdate(Qdto);
		return "myPage/myPage";
	}
	
	/*Q&A 게시물 삭제*/
	@RequestMapping("qadelete")
	public String qadelete(QABoardDTO Qdto) {
		bservice.qadelete(Qdto);
		return "myPage/myPage";
	}
	
	/*Q & A 게시판 작성화면 */
	@RequestMapping("qnawrite")
	public String qnaviewPage() {
		
		return "board/QnA_write";
	}
	/*상세 페이지에서 Q & A 게시판 보기*/
	@RequestMapping("qnaview")
	public String qnaview(Model model,HttpServletRequest request) {
		String code = request.getParameter("code");
		String indexnum = request.getParameter("indexnum");
		bservice.qnaview(model,indexnum);
		Pservice.codeSearch(model, code);	
		return "board/QnA_view";
	}
	/*상세 페이지에서 리뷰 게시판 보기*/
	@RequestMapping("Review_board")
	public String Review_board() {
		return "board/Review_board";
	}
	
	/*Q & A 게시판 전체 보기*/
	@RequestMapping("QnA_board")
	public String qnaboard(OrderCare_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = bservice.countqna();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging",vo);
		model.addAttribute("viewAll",bservice.selectqna(vo));
		return "board/QnA_board";
	}
	/*review 게시판 전체 보기*/
	@RequestMapping("review_board")
	public String review_board(OrderCare_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = reviewservice.countreview();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging",vo);
		model.addAttribute("viewAll",reviewservice.selectreview(vo));
		return "board/review_board";
	}

	/*review 페이징 ajax*/
	@PostMapping(value= "ajax_RV",produces="application/json; charset=utf8")
	@ResponseBody
	public String ajax_RV(Board_PagingVO bdto) throws JsonProcessingException {
		String code = bdto.getCode();
		int nowPage = bdto.getNowPage();
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		int total = reviewservice.rvtotal(code); //review게시판 코드로 검색했을경우 검색물 총 개수
		Board_PagingVO voRV = new Board_PagingVO();
		voRV = new Board_PagingVO(total, nowPage, code); //review게시판 voRV객체 페이징 번호 부여
		voRV.setCode(code); //review게시판 코드값 세팅
		list = reviewservice.rvlist(voRV);
		ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
		String strJson = mapper.writeValueAsString(list);
		return strJson;
	}
	
	/*Q&A 페이징 ajax*/
	@PostMapping(value= "ajax_QA",produces="application/json; charset=utf8")
	@ResponseBody
	public String ajax_QA(Board_PagingVO bdto) throws JsonProcessingException {
		String code = bdto.getCode();
		int nowPage = bdto.getNowPage();
		List<QABoardDTO> list = new ArrayList<QABoardDTO>();
		int total = bservice.qatotal(code); //Q&A게시판 코드로 검색했을경우 검색물 총 개수
		Board_PagingVO voRV = new Board_PagingVO();
		voRV = new Board_PagingVO(total, nowPage, code); //Q&A게시판 voRV객체 페이징 번호 부여
		voRV.setCode(code); //Q&A게시판 코드값 세팅
		list = bservice.qalist(voRV);
		ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
		String strJson = mapper.writeValueAsString(list);
		return strJson;
	}
	
	/*reply댓글 보기*/
	@RequestMapping("reply")
	public String reply(CommentDTO Cdto) {
		
		return "board/reply";
	}
	
	/*댓글 등록*/
	@PostMapping(value= "replyregister",produces="application/json; charset=utf8")
	@ResponseBody
	public String replyregister(Model model, CommentDTO Cdto) throws JsonProcessingException{
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월dd일 HH시mm분ss초");
		Date time = new Date(); 
		String date = format.format(time);
		String indexnum = Cdto.getIndexnum();
		Cdto.setRegisterdate(date);
		System.out.println("댓글아약스 실행");
		cservice.replyregister(Cdto);
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Cdto.setIndexnum(indexnum);
		list = cservice.searchComment(indexnum);
		ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
		String strJson = mapper.writeValueAsString(list);
		System.out.println(strJson);
		return strJson;
	}
	
	/*댓글보기*/
	@PostMapping(value= "replyview",produces="application/json; charset=utf8")
	@ResponseBody
		public String replyview(CommentDTO Cdto) throws JsonProcessingException {
			List<CommentDTO> list = new ArrayList<CommentDTO>();
			String indexnum = Cdto.getIndexnum();
			Cdto.setIndexnum(indexnum);
			list = cservice.searchComment(indexnum);
			ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
			String strJson = mapper.writeValueAsString(list);
			System.out.println(strJson);
			return strJson;
	}
	
	
	/*로그인 체크 LogChecking*/
	@RequestMapping("LogChecking")
	public String LogChecking() {
		return "LogChecking";
	}


	/*Q & A게시판 검색*/
	@RequestMapping("searchQnA")
	public String searchQnA(Model model,OrderCare_PagingVO vo,SearchBoardDTO searchdto
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = bservice.searchQnAcount(searchdto);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSearch_key(searchdto.getSearch_key());
		vo.setSearch(searchdto.getSearch());
		model.addAttribute("paging",vo);
		model.addAttribute("viewAll",bservice.searchQnA(vo));
		return "board/QnA_board";
	}
	/*review게시판 검색*/
	@RequestMapping("searchreview")
	public String searchreview(Model model,OrderCare_PagingVO vo,SearchBoardDTO searchdto
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = reviewservice.searchreviewcount(searchdto);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSearch_key(searchdto.getSearch_key());
		vo.setSearch(searchdto.getSearch());
		model.addAttribute("paging",vo);
		model.addAttribute("viewAll",reviewservice.searchreview(vo));
		return "board/review_board";
	}
	/*Q & A게시판 검색 관리자 페이지*/
	@RequestMapping("searchQnA_care")
	public String searchQnA_care(Model model,OrderCare_PagingVO vo,SearchBoardDTO searchdto
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = bservice.searchQnAcount(searchdto);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSearch_key(searchdto.getSearch_key());
		vo.setSearch(searchdto.getSearch());
		model.addAttribute("paging",vo);
		model.addAttribute("viewAll",bservice.searchQnA(vo));
		return "QnA_board_care";
	}
	/*review게시판 검색 관리자 페이지*/
	@RequestMapping("searchreview_care")
	public String searchreview_care(Model model,OrderCare_PagingVO vo,SearchBoardDTO searchdto
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = reviewservice.searchreviewcount(searchdto);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSearch_key(searchdto.getSearch_key());
		vo.setSearch(searchdto.getSearch());
		model.addAttribute("paging",vo);
		model.addAttribute("viewAll",reviewservice.searchreview(vo));
		return "review_board_care";
	}
	/*Q & A 관리자 게시판 전체 보기*/
	@RequestMapping("QnA_board_care")
	public String qnaboard_care(OrderCare_PagingVO vo, Model model, HttpSession session
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		String id = (String) session.getAttribute("id");

		if(id != null) {
					if(id.equals("admin")) {
		
				int total = bservice.countqna();
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "5";
				}
				vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("paging",vo);
				model.addAttribute("viewAll",bservice.selectqna(vo));
				return "QnA_board_care";
				}
				else return"redirect:/";
			}
			else return"redirect:/";
	}
	
	/*review 게시판 전체 보기*/
	@RequestMapping("review_board_care")
	public String review_board_care(OrderCare_PagingVO vo, Model model, HttpSession session
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		String id = (String) session.getAttribute("id");
		if(id != null) {
			if(id.equals("admin")) {
				int total = reviewservice.countreview();
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "5";
				}
				vo = new OrderCare_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("paging",vo);
				model.addAttribute("viewAll",reviewservice.selectreview(vo));
				return "review_board_care";
			}
			else return"redirect:/";
		}
		else return"redirect:/";
	}
	/*Q&A 관리자 페이지 삭제*/
	@RequestMapping("QnA_board_care_delete")
	public String QnA_board_care_delete(@RequestParam("indexnum") String indexnum) {
		bservice.QnA_board_care_delete(indexnum);
		return "redirect:QnA_board_care";
	}
	/*review 관리자 페이지 삭제*/
	@RequestMapping("review_board_care_delete")
	public String review_board_care_delete(@RequestParam("reviewnum") String reviewnum) {
		reviewservice.review_board_care_delete(reviewnum);
		return "redirect:review_board_care";
	}
}
