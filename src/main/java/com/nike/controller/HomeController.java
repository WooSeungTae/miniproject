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
import com.nike.memberInfo.Mileage_PagingVO;
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

	/*�뙆�씪�뾽濡쒕뱶 寃쎈줈 servlet-context.xml�뿉 id媛� uploadPath�씤媛믪쓣 媛��졇�삩�떎.*/
	@Resource(name="uploadPath")
	private String uploadPath;
	
	/*由щ럭�뙆�씪 �뾽濡쒕뱶 寃쎈줈*/
	@Resource(name="uploadPath2")
	private String uploadPath2;
	
	/*愿�由ъ옄 �뙆�씪 �닔�젙 �뾽濡쒕뱶*/
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
		    //    �겢�씪�씠�뼵�듃�쓽 �씠硫붿씪�씠 議댁옱�븷 �븣 �꽭�뀡�뿉 �빐�떦 �씠硫붿씪怨� �넗�겙 �벑濡�
		    if (userInfo.get("email") != null) {
		    	session.setAttribute("id", userInfo.get("email"));
		    	session.setAttribute("name", userInfo.get("nickname"));
		    	session.setAttribute("access_Token", access_Token);
		    }
		}
		return "/sminj/main";
	}
		//�궓�씠 �굹�쓽 由щ럭瑜� 蹂� �븣
		@RequestMapping("reviewsearch")
		public String reviewsearch(@RequestParam(value="reviewnum", required=false) int reviewnum, Model model) {
			model.addAttribute("rdto", reviewservice.reviewsearch(reviewnum));
			return "/board/review_Search";
		}
		//由щ럭 �벑濡�
		@RequestMapping("reviewform")
		public String review(HttpServletRequest request, Model model) {
			HttpSession mySession = request.getSession();
			String id = (String) mySession.getAttribute("id");
			String name = (String)mySession.getAttribute("name");
			String code = request.getParameter("code");
			String codename = request.getParameter("codename");
			model.addAttribute("id", id);
			model.addAttribute("name", name);
			model.addAttribute("code", code);
			model.addAttribute("codename", codename);
			return "board/review_Register";
		}
		//ReviewDTO rdto, HttpServletRequest request,
		
		//由щ럭 ���옣
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
		
		//留덉씠�럹�씠吏� �굹�쓽 由щ럭 �닔�젙�븯湲�, �궘�젣�븯湲� �븯湲� �쐞�븳 �뤌
		@RequestMapping("myreview")
		public String myreview(HttpServletRequest request, Model model, ReviewDTO rdto) {
			String reviewnum = request.getParameter("reviewnum");
			HttpSession mySession = request.getSession();
			String id = (String) mySession.getAttribute("id");
			rdto.setId(id);
			rdto.setReviewNum(Integer.parseInt(reviewnum));
			//rdto.setId("hong");
			//rdto.setReviewNum(9);
			model.addAttribute("rdto", reviewservice.reviewitem(rdto));
			System.out.println("====================================================="+rdto.getImage());
			return "board/reviewform";
		}
		
		//留덉씠�럹�씠吏� �굹�쓽 由щ럭 �궘�젣�븯湲�
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
		
		//留덉씠�럹�씠吏� �굹�쓽 由щ럭 �닔�젙�븯湲�
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
				System.out.println("=====================================�뙆�씪�엳�쓬");
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
		/*�긽�뭹 �벑濡�*/
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
				System.out.println("�벑濡� �떎�뻾");
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

		//愿�由ъ옄 �긽�뭹愿�由� - �닔�젙湲곕뒫
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
		
		//愿�由ъ옄 �긽�뭹愿�由ы뤌(�닔�젙)
		@RequestMapping("productview")
		public String productview(@RequestParam("code") String code,Model model) {
			//愿�由ъ옄 �긽�뭹 紐⑸줉 �닔�젙, �궘�젣瑜� �쐞�븳 議고쉶(�긽�뭹)
			ProductDTO pdto = Pservice.productSelect(code);
			model.addAttribute("pdto", Pservice.productSelect(code));
			System.out.println("===========================================" + pdto.getImage1());
			//愿�由ъ옄 �긽�뭹 紐⑸줉 �닔�젙, �궘�젣瑜� �쐞�븳 議고쉶(�궗�씠利�)
			model.addAttribute("sdto", Pservice.sizeSelect(code));
			return "product_update/productViewPage";
		}
		
		//留덉씠�럹�씠吏� �굹�쓽 由щ럭 蹂댁뿬二쇨린
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
		
		/*留덉씠�럹�씠吏� QnA*/
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
		
		//愿�由ъ옄 �긽�뭹愿�由�(�궘�젣)
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
		
		
		/*�긽�뭹愿�由�*/
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
		/*�긽�뭹 愿�由� �럹�씠吏� 寃��깋湲곕뒫*/
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
			System.out.println("=================================" + dto.getId());
			memberservice.loginmileage(dto.getId());
			/*memberinfo 테이블 마일리지 업데이트*/
			memberservice.mileageupdate2(dto);
			return "sminj/main";
		}
	}
	@RequestMapping("/saveUserInfo") //�쉶�썝媛��엯 �젙蹂� �엯�젰 
	public String saveUserInfo(MemberInfoDTO dto) {
		memberservice.saveUserInfo(dto);
		/*회원가입 마일리지 2000점*/
		memberservice.joinmileage(dto);
		/*memberinfo 테이블 마일리지 업데이트*/
		memberservice.mileageupdate(dto);
		return "redirect:loginPage";
	}

	/*�꽭遺� �긽�뭹 議고쉶*/
	@RequestMapping("/productdetail")
	public String productdetail(Model model, HttpServletRequest request) {
		String code = request.getParameter("code");
		int totalqa = bservice.qatotal(code); //Q&A寃뚯떆�뙋 肄붾뱶濡� 寃��깋�뻽�쓣寃쎌슦 寃��깋臾� 珥� 媛쒖닔
		int totalrv = reviewservice.rvtotal(code); //review寃뚯떆�뙋 肄붾뱶濡� 寃��깋�뻽�쓣寃쎌슦 寃��깋臾� 珥� 媛쒖닔
		model.addAttribute("totalqa", totalqa);
		model.addAttribute("totalrv", totalrv);
		model.addAttribute("pdto", Pservice.productdetail(request.getParameter("code")));
		model.addAttribute("sdto", Pservice.sizeSelect(request.getParameter("code")));
		return "jsj/product_detail";
	}

	/*�궓�옄 �떊諛� �쟾泥대ぉ濡�*/
	@RequestMapping("Men")
	public String catalogMen(Product_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.genderAll("�궓�옄");
		if (nowPage == null) {nowPage = "1";}
		vo = new Product_PagingVO(total, Integer.parseInt(nowPage));
		Pservice.allListMen(model,vo);
		return "jsj/Men/men";
	}
	
	/*�뿬�옄 �떊諛� �쟾泥대ぉ濡�*/
	@RequestMapping("/Women")
	public String catalogWomen(Product_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.genderAll("�뿬�옄");
		if (nowPage == null) {nowPage = "1";}
		vo = new Product_PagingVO(total, Integer.parseInt(nowPage));
		Pservice.allListWomen(model,vo);
		return "jsj/Women/women";
	}
	
	/*�븘�룞 �떊諛� �쟾泥대ぉ濡�*/
	@RequestMapping("/Kids")
	public String catalogKids(Product_PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.kisdAll("�궎利�");
		if (nowPage == null) {nowPage = "1";}
		vo = new Product_PagingVO(total, Integer.parseInt(nowPage));
		Pservice.allListKids(model,vo);
		return "jsj/Kids/kids";
	}
	
	/*�궓�옄 �떊諛� 移댄뀒肄붾━蹂� �쟾泥댁“�쉶*/
	@RequestMapping("Men/category")
	public String catalogMenCategory(Model model,@RequestParam("category") String category,Product_PagingVO vo
				, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.categoryGenderAll("�궓�옄", category);
		if (nowPage == null) {nowPage = "1";}
		vo =  new Product_PagingVO(total,Integer.parseInt(nowPage),category);
		Pservice.allListMenCategory(model,vo);
		return "jsj/Men/menCategory";
	}

	/*�뿬�옄 �떊諛� 移댄뀒怨좊━蹂� �쟾泥댁“�쉶*/
	@RequestMapping("/Women/category")
	public String catalogWomenCategory(Model model,@RequestParam("category") String category,Product_PagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="code", required=false)String code) {
		int total = Pservice.categoryGenderAll("�뿬�옄", category);
		if (nowPage == null) {nowPage = "1";}
		vo =  new Product_PagingVO(total,Integer.parseInt(nowPage),category);
		Pservice.allListWomenCategory(model,vo);
		return "jsj/Women/womenCategory";
	}
	
	
	/*�븘�룞 �떊諛� 移댁껜怨좊━蹂� �쟾泥댁“�쉶*/
	@RequestMapping("/Kids/category")
	public String catalogKidsCategory(Model model,@RequestParam("category") String category,Product_PagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage) {
		int total = Pservice.categoryGenderAll("�궎利�", category);
		if (nowPage == null) {nowPage = "1";}
		vo =  new Product_PagingVO(total,Integer.parseInt(nowPage),category);
		Pservice.allListKidsCategory(model,vo);
		return "jsj/Kids/kidsCategory";
	}
	
	/*�쟾泥� �떊諛� 寃��깋*/
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
	

	

	
	/*�긽�뭹 �벑濡� �럹�씠吏�*/
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
	/*怨좉컼愿�由�*/
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
	/*怨좉컼愿�由� �럹�씠吏� 寃��깋湲곕뒫*/
	@RequestMapping("memberserch")
	public String memberserch(Model model,HttpServletRequest request) {
		model.addAttribute("request",request);
		service.memberserchlist(model);
		return "customer_care2";
	}
	/*怨좉컼愿�由� �럹�씠吏� �궘�젣湲곕뒫*/
	@RequestMapping("memberdelete")
	public String memberdelete(@RequestParam("id") String id) {
		service.memberdelete(id);
		return "redirect:customer_care";
	}
	/*寃뚯떆�뙋愿�由�*/
	@RequestMapping("board_care")
	public String board_care() {
		return "board_care";
	}
	/*二쇰Ц愿�由�*/
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
	/*留덉씠�럹�씠吏�*/
	@RequestMapping("myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	
	/*留덉씠�럹�씠吏� �궗�씠�뱶*/
	@RequestMapping("aside")
	public String aside(Model model, HttpServletRequest request, MemberInfoDTO dto) {
		HttpSession mySession = request.getSession();
		String name = (String) mySession.getAttribute("name");
		model.addAttribute("name", name);
		return "myPage/myPageAside";
	}
	/*�쉶�썝媛��엯*/
	@RequestMapping("memberJoin")
	public String memberJoin() {
		return "member/memberJoin";
	}
	
	/*濡쒓렇�씤�럹�씠吏�*/
	@RequestMapping("loginPage")
	public String loginPage() {
		return "member/loginPage";
	}
	
	/*鍮꾨�踰덊샇 李얠쓣�븣 �쟾�솕踰덊샇 or �븘�씠�뵒濡� 寃��깋*/
	@RequestMapping("userSearch")
	public String userSearch(Model model, HttpServletRequest request) {
		String idtel = request.getParameter("idtel");
		service.searchId(model,idtel);
		return "member/userUpdate";
	}
	
	/*�쉶�썝�젙蹂� 鍮꾨�踰덊샇 �닔�젙*/
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
	
	/*留덉씪由ъ� 議고쉶*/
	@RequestMapping("mileage")
	public String mileage(Mileage_PagingVO mvo, Model model, HttpServletRequest request,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		model.addAttribute("mile", service.mileage(id));
		int total = service.mileagelistcount(id);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		System.out.println("=============================================================" + total);
		mvo = new Mileage_PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", mvo);
		model.addAttribute("milelist", service.mileagelist(mvo));
		return "myPage/myPageMileage";
	}
	
	/*�쉶�썝�젙蹂� �닔�젙�쓣 �쐞�븳 �쉶�썝�젙蹂� 議고쉶*/
	@RequestMapping("account")
	public String account(Model model, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		model.addAttribute("dto", service.account(id));
		return "myPage/myPageAccount";
	}
	/*�쉶�썝�젙蹂� �닔�젙*/
	@RequestMapping("memberinfoModify")
	public String memberinfoModify(MemberInfoDTO dto, Model model) {
		service.memberinfoModify(dto, model);
		return "redirect:account";
	}
	

	/*�옣諛붽뎄�땲 DB�뿉 媛� ���옣�븯湲�*/
	@RequestMapping("cartSave")
	public String cartSave(ShoppingCartDTO sdto, HttpServletRequest request, Model model) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		if(id!=null) {
			String code = request.getParameter("code");
			sdto.setId(id);
			sdto.setCode(code);
			/*�씠誘� �엳�뒗 �븘�씠�뀥�� �뜑�씠�긽 �옣諛붽뎄�땲�뿉 異붽� 紐삵븿*/
			System.out.println("=========================================="+orderservice.checkitem(sdto));
			if(orderservice.checkitem(sdto)==0) {
				/*�옣諛붽뎄�땲�뿉 �긽�뭹紐� ���옣�븯�뒗 湲곕뒫*/
				sdto.setCodename(Pservice.codnameget(sdto.getCode()));
				/*�옣諛붽뎄�땲�뿉 ���몴�궗吏� ���옣�븯�뒗 湲곕뒫*/
				sdto.setImage1(Pservice.image1get(sdto.getCode()));
				/*�옣諛붽뎄�땲�뿉 媛�寃� ���옣�븯�뒗 湲곕뒫*/
				sdto.setPrice(Pservice.priceget(sdto.getCode())*sdto.getCount());
				/*�옣諛붽뎄�땲 DB�뿉 媛믪쓣 ���옣*/
				orderservice.insertcart(sdto);
				return "redirect:cart";
			}else {
				model.addAttribute("noadd", "-1");
				return "redirect:productdetail?code="+code;
			}
		}else {
			return "redirect:loginPage";
		}
	}

	/*�옣諛붽뎄�땲*/
	@RequestMapping("cart")
	public String cart(Cart_PagingVO cpvo, ShoppingCartDTO sdto, HttpServletRequest request, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage",required=false)String cntPerPage) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		if(id!=null) {
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
				/*�옣諛붽뎄�땲 DB�뿉�꽌 �쉶�썝蹂� 由ъ뒪�듃 媛��졇�삤湲�*/
				model.addAttribute("cartlist", orderservice.cartpaging(cpvo));
				
			}
			
			/*�옣諛붽뎄�땲 DB�뿉�꽌 由ъ뒪�듃 媛쒖닔 媛��졇�삤湲�*/
			System.out.println("==========================================" + orderservice.countcart(id));
			model.addAttribute("cartcount", total);
			/*�옣諛붽뎄�땲 DB�뿉�꽌 �쉶�썝蹂� 珥� 湲덉븸 媛��졇�삤湲�*/
			model.addAttribute("totalprice", orderservice.totalprice(id));
			return "purchase/cart";
		}else {
			return "redirect:loginPage";
		}
	}
	
	
	
	/*�옣諛붽뎄�땲 �샃�뀡李� �쑉寃� �븿*/
	@RequestMapping("cartoption")
	public String cartoption(@RequestParam("code") String code, Model model) {
		model.addAttribute("code", code);
		return "purchase/cartoption";
	}
	
	/*�옣諛붽뎄�땲 �샃�뀡 蹂�寃�*/
	@RequestMapping("cartoptionchange")
	public String cartoptionchange(ShoppingCartDTO sdto, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		sdto.setId(id);
		sdto.setCode(request.getParameter("code"));
		sdto.setPrice(Pservice.priceget(sdto.getCode())*sdto.getCount());
		System.out.println("==============================================="+sdto.getCode());
		System.out.println("==============================================="+sdto.getOrdersize());
		System.out.println("==============================================="+sdto.getCount());
		orderservice.cartoptionchange(sdto);
		return "redirect:cart";
	}
	/*�쉶�썝蹂� �옣諛붽뎄�땲�뿉 �엳�뒗 �븘�씠�뀥 �쟾遺� �궘�젣*/
	@RequestMapping("cartAlldelete")
	public String cartAlldelete(HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		orderservice.cartAlldelete(id);
		return "redirect:cart";
	}
	
	/*�쉶�썝蹂� �옣諛붽뎄�땲�뿉�꽌 x�늻瑜� �븘�씠�뀥 �궘�젣*/
	@RequestMapping("cartitemdelete")
	public String cartitemdelete(ShoppingCartDTO sdto, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		sdto.setId(id);
		sdto.setCode(request.getParameter("code"));
		orderservice.cartitemdelete(sdto);
		return "redirect:cart";
	}
	
	/*援щℓ*/
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
	
	/*�옣諛붽뎄�땲�뿉�꽌 援щℓ*/
	@RequestMapping("checkoutCart")
	public String checkoutCart(Model model,@SessionAttribute(value="id",required=false) String id) {
		if(id!=null) {service.searchId(model, id);}
		model.addAttribute("cartlist",orderservice.selectcart(id));
		model.addAttribute("totalmoney", orderservice.totalprice(id));
		return "purchase/checkOutCart";
	}

	/*援щℓ�썑 �벑濡�*/
	@RequestMapping("productBuy0")
	public String productBuy(OrderDTO Odto,Order_detailsDTO Ddto,MemberInfoDTO dto,HttpServletRequest request) {
		//System.out.println("�샇異�");
		orderservice.productBuy(Odto,Ddto,dto,request);
		//memberservice.buymileage(dto);
		return "myPage/myPage";
	}
	
	/*援щℓ�썑 �벑濡�*/
	@RequestMapping("productBuyCart")
	public String productBuyCart(ShoppingCartDTO sdto,OrderDTO Odto,Order_detailsDTO Ddto,MemberInfoDTO dto,HttpServletRequest request) {
		//System.out.println("�샇異�");
		orderservice.productBuyCart(Odto,Ddto,dto,request,sdto);
		return "myPage/myPage";
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

	/* 濡쒓렇�븘�썐 */
	@RequestMapping("logout")
	public String logout(HttpSession mySession) {
		if((String)mySession.getAttribute("access_Token") != null) {
			kakao.kakaoLogout((String)mySession.getAttribute("access_Token"));
		}
		memberservice.logout(mySession);
		return "sminj/main";
	}
	/* �쉶�썝鍮꾨�踰덊샇 蹂�寃� */
	@RequestMapping("password")
	public String password(Model model, HttpServletRequest request, MemberInfoDTO dto) {
		HttpSession mySession = request.getSession();
		String pwd = (String)mySession.getAttribute("pwd");
		model.addAttribute("pwd", pwd);
		return "myPage/myPagePassword";
	}
	/* 鍮꾨�踰덊샇 蹂�寃쎌셿猷� �럹�씠吏�(�눥�븨怨꾩냽�븯湲�) */
	@RequestMapping("pwdSuccess")
	public String pwdSuccess(MemberInfoDTO dto, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String)mySession.getAttribute("id");
		dto.setId(id);
		memberservice.pwdModify(dto);
		return "sminj/pwd_ModifySuccess";
	}
	/* �쉶�썝�깉�눜 */
	@RequestMapping("withdrawal")
	public String withdrawal() {
		return "myPage/myPageWithdrawal";
	}
	/* �쉶�썝�깉�눜 �셿猷� �럹�씠吏� */
	@RequestMapping("userDelete")
	public String userDelete(MemberInfoDTO dto, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String)mySession.getAttribute("id");
		dto.setId(id);
		memberservice.userDelete(dto);
		memberservice.logout(mySession);
		return "sminj/userDelete";
	}
	/* 二쇰Ц�궡�뿭 諛� 諛곗넚�쁽�솴 議고쉶 */
	@RequestMapping("orderList")
	public String orderView(Order_detailsDTO Ddto, Model model, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("id");
		List<Order_detailsDTO> orderList = orderservice.orderList(id);
		model.addAttribute("orderList", orderList);
		return "myPage/myPageOrderDelivery";
	}
	/* 二쇰Ц�궡�뿭 �긽�꽭�럹�씠吏� - 二쇰Ц�옄 諛� 寃곗젣�젙蹂� */
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
	/* 二쇰Ц�궡�뿭 諛� 諛곗넚�쁽�솴 �럹�씠吏� - 諛곗넚 �긽�깭 蹂�寃�*/
	@RequestMapping(value="/myPage/myPageOrderDelivery", method=RequestMethod.POST)
	public String delivery(Order_detailsDTO Ddto) {
		orderservice.delivery(Ddto);
		return "redirect:/myPage/myPageOrderDelivery?=" + Ddto.getOrdernum();
	}
	/*Q&A 寃뚯떆臾� �벑濡�*/
	@RequestMapping("qaregister")
	public String qaregister(QABoardDTO Qdto) {
		bservice.qaregister(Qdto);
		System.out.println("�벑濡� �떎�뻾");
		return "myPage/myPage";
	}
	/*Q&A 寃뚯떆臾� �닔�젙*/
	@RequestMapping("qaupdate")
	public String qaupdate(QABoardDTO Qdto) {
		bservice.qaupdate(Qdto);
		return "myPage/myPage";
	}
	
	/*Q&A 寃뚯떆臾� �궘�젣*/
	@RequestMapping("qadelete")
	public String qadelete(QABoardDTO Qdto) {
		bservice.qadelete(Qdto);
		return "myPage/myPage";
	}
	
	/*Q & A 寃뚯떆�뙋 �옉�꽦�솕硫� */
	@RequestMapping("qnawrite")
	public String qnaviewPage() {
		
		return "board/QnA_write";
	}
	/*�긽�꽭 �럹�씠吏��뿉�꽌 Q & A 寃뚯떆�뙋 蹂닿린*/
	@RequestMapping("qnaview")
	public String qnaview(Model model,HttpServletRequest request) {
		String code = request.getParameter("code");
		String indexnum = request.getParameter("indexnum");
		bservice.qnaview(model,indexnum);
		Pservice.codeSearch(model, code);	
		return "board/QnA_view";
	}
	/*�긽�꽭 �럹�씠吏��뿉�꽌 由щ럭 寃뚯떆�뙋 蹂닿린*/
	@RequestMapping("Review_board")
	public String Review_board() {
		return "board/Review_board";
	}
	
	/*Q & A 寃뚯떆�뙋 �쟾泥� 蹂닿린*/
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
	/*review 寃뚯떆�뙋 �쟾泥� 蹂닿린*/
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

	/*review �럹�씠吏� ajax*/
	@PostMapping(value= "ajax_RV",produces="application/json; charset=utf8")
	@ResponseBody
	public String ajax_RV(Board_PagingVO bdto) throws JsonProcessingException {
		String code = bdto.getCode();
		int nowPage = bdto.getNowPage();
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		int total = reviewservice.rvtotal(code); //review寃뚯떆�뙋 肄붾뱶濡� 寃��깋�뻽�쓣寃쎌슦 寃��깋臾� 珥� 媛쒖닔
		Board_PagingVO voRV = new Board_PagingVO();
		voRV = new Board_PagingVO(total, nowPage, code); //review寃뚯떆�뙋 voRV媛앹껜 �럹�씠吏� 踰덊샇 遺��뿬
		voRV.setCode(code); //review寃뚯떆�뙋 肄붾뱶媛� �꽭�똿
		list = reviewservice.rvlist(voRV);
		ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
		String strJson = mapper.writeValueAsString(list);
		return strJson;
	}
	
	/*Q&A �럹�씠吏� ajax*/
	@PostMapping(value= "ajax_QA",produces="application/json; charset=utf8")
	@ResponseBody
	public String ajax_QA(Board_PagingVO bdto) throws JsonProcessingException {
		String code = bdto.getCode();
		int nowPage = bdto.getNowPage();
		List<QABoardDTO> list = new ArrayList<QABoardDTO>();
		int total = bservice.qatotal(code); //Q&A寃뚯떆�뙋 肄붾뱶濡� 寃��깋�뻽�쓣寃쎌슦 寃��깋臾� 珥� 媛쒖닔
		Board_PagingVO voRV = new Board_PagingVO();
		voRV = new Board_PagingVO(total, nowPage, code); //Q&A寃뚯떆�뙋 voRV媛앹껜 �럹�씠吏� 踰덊샇 遺��뿬
		voRV.setCode(code); //Q&A寃뚯떆�뙋 肄붾뱶媛� �꽭�똿
		list = bservice.qalist(voRV);
		ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
		String strJson = mapper.writeValueAsString(list);
		return strJson;
	}
	
	/*reply�뙎湲� 蹂닿린*/
	@RequestMapping("reply")
	public String reply(CommentDTO Cdto) {
		
		return "board/reply";
	}
	
	/*�뙎湲� �벑濡�*/
	@PostMapping(value= "replyregister",produces="application/json; charset=utf8")
	@ResponseBody
	public String replyregister(Model model, CommentDTO Cdto) throws JsonProcessingException{
		SimpleDateFormat format = new SimpleDateFormat("yyyy�뀈 MM�썡dd�씪 HH�떆mm遺꼜s珥�");
		Date time = new Date(); 
		String date = format.format(time);
		String indexnum = Cdto.getIndexnum();
		Cdto.setRegisterdate(date);
		cservice.replyregister(Cdto);
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Cdto.setIndexnum(indexnum);
		list = cservice.searchComment(indexnum);
		ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
		String strJson = mapper.writeValueAsString(list);
		return strJson;
	}
	
	/*�뙎湲�蹂닿린*/
	@PostMapping(value= "replyview",produces="application/json; charset=utf8")
	@ResponseBody
		public String replyview(CommentDTO Cdto) throws JsonProcessingException {
			List<CommentDTO> list = new ArrayList<CommentDTO>();
			String indexnum = Cdto.getIndexnum();
			Cdto.setIndexnum(indexnum);
			list = cservice.searchComment(indexnum);
			ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
			String strJson = mapper.writeValueAsString(list);
			return strJson;
	}
	
	/*�뙎湲� �닔�젙*/
	@PostMapping(value= "replyUpdate", produces="application/json; charset=utf8")
	@ResponseBody
		public String replyUpdate(CommentDTO Cdto) throws JsonProcessingException {
		System.out.println("�뙎湲��궡�슜 : "+Cdto.getContentComment());
		System.out.println("�뙎湲�踰덊샇 : "+Cdto.getNumComment());
		System.out.println("�씤�럠�뒪�꽆 : "+Cdto.getIndexnum());
		cservice.replyUpdate(Cdto);
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		list = cservice.searchComment(Cdto.getIndexnum());
		ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
		String strJson = mapper.writeValueAsString(list);
		System.out.println(strJson);
		return strJson;
		
	}
	
	/*�뙎湲� �궘�젣*/
	@PostMapping(value= "replyDelete", produces="application/json; charset=utf8")
	@ResponseBody
	public String replyDelete(CommentDTO Cdto) throws JsonProcessingException {
		System.out.println("�떎�뻾�릺�굹??�솢�븞�맖?");
		System.out.println("踰덊샇 : " +Cdto.getNumComment());
		cservice.replyDelete(Cdto);
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		list = cservice.searchComment(Cdto.getIndexnum());
		ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
		String strJson = mapper.writeValueAsString(list);
		System.out.println(strJson);
		return strJson;
		
	}
	
	
	
	/*濡쒓렇�씤 泥댄겕 LogChecking*/
	@RequestMapping("LogChecking")
	public String LogChecking() {
		return "LogChecking";
	}


	/*Q & A寃뚯떆�뙋 寃��깋*/
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
	/*review寃뚯떆�뙋 寃��깋*/
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
	/*Q & A寃뚯떆�뙋 寃��깋 愿�由ъ옄 �럹�씠吏�*/
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
	/*review寃뚯떆�뙋 寃��깋 愿�由ъ옄 �럹�씠吏�*/
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
	/*Q & A 愿�由ъ옄 寃뚯떆�뙋 �쟾泥� 蹂닿린*/
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
	
	/*review 寃뚯떆�뙋 �쟾泥� 蹂닿린*/
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
	/*Q&A 愿�由ъ옄 �럹�씠吏� �궘�젣*/
	@RequestMapping("QnA_board_care_delete")
	public String QnA_board_care_delete(@RequestParam("indexnum") String indexnum) {
		bservice.QnA_board_care_delete(indexnum);
		return "redirect:QnA_board_care";
	}
	/*review 愿�由ъ옄 �럹�씠吏� �궘�젣*/
	@RequestMapping("review_board_care_delete")
	public String review_board_care_delete(@RequestParam("reviewnum") String reviewnum) {
		reviewservice.review_board_care_delete(reviewnum);
		return "redirect:review_board_care";
	}
}
