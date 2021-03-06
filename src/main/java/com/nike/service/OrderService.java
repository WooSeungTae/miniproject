package com.nike.service;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.order.Cart_PagingVO;
import com.nike.order.OrderCare_PagingVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;
import com.nike.order.OrderDAO;
import com.nike.order.OrderDTO;
import com.nike.order.Order_detailsDAO;
import com.nike.order.Order_detailsDTO;
import com.nike.order.ShoppingCartDTO;
import com.nike.product.ProductDAO;

@Service
public class OrderService {
	@Autowired
	private OrderDAO Odao;
	@Autowired
	private Order_detailsDAO Ddao;
	@Autowired
	private MemberInfoDAO dao;
	@Autowired
	private ProductDAO Pdao;
	@Autowired
	private OrderService orderservice;
	private String orderNum;
	
	/*구매후 등록*/
	public void productBuy(OrderDTO Odto,Order_detailsDTO Ddto,MemberInfoDTO dto,HttpServletRequest request){
		orderNum="Order";
		SimpleDateFormat format = new SimpleDateFormat("MMddHHmmss");
		orderNum = orderNum + format.format(new Date());
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String code = request.getParameter("code");
		String ordersize = request.getParameter("ordersize");
		String count=request.getParameter("count");
//		if(Pdao.searchSizecode(Ddto)<1) {
//			System.out.println("작은거 확인");
//			return;
//		}
		if(id!=null) {
			dao.mileageModify(dto);
			//구매시 마일리지 테이블에 insert
			dao.mileagetablebuy(Odto);
			dao.mileagetablebuy2(Odto);
		}
		Odto.setordernum(orderNum);
		Ddto.setOrdernum(orderNum);
		Odao.buyRegister(Odto);
		Ddao.buyRegisterDetails(Ddto);
		Ddao.sizeDelete(Ddto);
	}
	
	/*구매후 등록*/
	public void productBuyCart(OrderDTO Odto,Order_detailsDTO Ddto,MemberInfoDTO dto,HttpServletRequest request,ShoppingCartDTO sdto) {
		orderNum="Order";
		SimpleDateFormat format = new SimpleDateFormat("MMddHHmmss");
		orderNum = orderNum + format.format(new Date());
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id!=null) {dao.mileageModify(dto);
					dao.mileageBuy(Odto);
					//구매시 마일리지 테이블에 insert
					dao.mileagetablebuy(Odto);
					dao.mileagetablebuy2(Odto);
		}
		Odto.setordernum(orderNum);
		Ddto.setOrdernum(orderNum);
		Odao.buyRegister(Odto);
		String code[]=Ddto.getCode().split(",");
		String codename[]=Ddto.getCodename().split(",");
		String count[]=Ddto.getCount().split(",");
		String image1[]=Ddto.getImage1().split(",");
		String ordersize[]=Ddto.getOrdersize().split(",");
		String price[]=Ddto.getPrice().split(",");
		for(int i = 0 ; i<code.length;i++) {
			Ddto.setCode(code[i]);
			Ddto.setCodename(codename[i]);
			Ddto.setCount(count[i]);
			Ddto.setId(id);
			Ddto.setImage1(image1[i]);
			Ddto.setOrdernum(orderNum);
			Ddto.setOrdersize(ordersize[i]);
			Ddto.setPrice(price[i]);
			Ddao.sizeDelete(Ddto);
			sdto.setCode(code[i]);
			sdto.setId(id);
			orderservice.cartitemdelete(sdto);
			Ddao.buyRegisterDetails(Ddto);
		}
	}
	
	/*장바구니 DB에 값을 저장*/
	public void insertcart(ShoppingCartDTO sdto) {
		Odao.insertcart(sdto);
	}
	
	/*장바구니 DB에서 회원별 리스트 가져오기*/
	public List<ShoppingCartDTO> selectcart(String id) {
		
		return Odao.selectcart(id);
	}
	
	/*장바구니 DB에서 리스트 개수 가져오기*/
	public int countcart(String id) {
		return Odao.countcart(id);
	}
	
	/*회원별 장바구니에 있는 아이템 전부 삭제*/
	public void cartAlldelete(String id) {
		Odao.cartAlldelete(id);
	}
	
	/*장바구니 DB에서 회원별 총 금액 가져오기*/
	public int totalprice(String id) {
		return Odao.totalprice(id);
	}
	
	/*회원별 장바구니에서 x누른 아이템 삭제*/
	public void cartitemdelete(ShoppingCartDTO sdto) {
		Odao.cartitemdelete(sdto);
	}

	/*이미 있는 아이템은 더이상 장바구니에 추가 못함*/
	public int checkitem(ShoppingCartDTO sdto) {
		return Odao.checkitem(sdto);
	}
	/*장바구니 옵션 변경*/
	public void cartoptionchange(ShoppingCartDTO sdto) {
		Odao.cartoptionchange(sdto);
	}

	/*주문 수 반환*/
	public int countOrder() {
		return Odao.countOrder();
	}
	/*모든 주문 목록 출력 일정량만*/
	public List<OrderDTO> selectorder(OrderCare_PagingVO vo) {
		return Odao.selectOrder(vo);
	}
	/*주문 관리 물품 확인, 취소 기능*/
	public void deliveryChange(OrderDTO Odto) {
		Odao.deliveryChange(Odto);
	}
	/*주문 취소시에 물품 추가*/
	public void deliveryCancel(Order_detailsDTO Ddto) {
		String code[]=Ddto.getCode().split(",");
		String ordersize[]=Ddto.getOrdersize().split(",");
		String count[]=Ddto.getCount().split(",");
		for(int i = 0 ; i<code.length;i++) {
		Ddto.setCode(code[i]);
		Ddto.setOrdersize(ordersize[i]);
		Ddto.setCount(count[i]);
		Odao.deliveryCancel(Ddto);
		}
	}
	
	/*주문 관리 물품 하나만 검색해 가져오기*/
	public OrderDTO orderserch(String id) {
		return Odao.orderserch(id);
	}
	
	/* 주문내역 및 배송현황 조회 */
	public List<Order_detailsDTO> orderList(String id) {
		return Ddao.orderList(id);
	}
	/* 주문내역 상세페이지 - 주문자 및 결제정보 */
	public List<OrderDTO> orderView(String id){
		return Odao.orderView(id);
	}
	/* 주문내역 및 배송현황 조회 */
	public List<Order_detailsDTO> orderList_num(String ordernum) {
		return Ddao.orderList_num(ordernum);
	}
	/* 주문내역 상세페이지 - 주문자 및 결제정보 */
	public List<OrderDTO> orderView_num(String ordernum){
		return Odao.orderView_num(ordernum);
	}
	/* 주문내역 및 배송현황 페이지 - 배송 상태 */
	public void delivery(OrderDTO odto) {
		Ddao.delivery(odto);
	}
	/*장바구니 관리 물품 일정량만 가져옴(페이징 기능)*/
	public List<ShoppingCartDTO> cartpaging(Cart_PagingVO cpvo) {
		return Odao.cartpaing(cpvo);
	}

	//최근 주문 내역 페이지
		public List<Order_detailsDTO> myPage1(String id) {
			return Ddao.myPage1(id);
		}
	
}
