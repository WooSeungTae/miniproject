package com.nike.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;
import org.springframework.web.bind.annotation.RequestParam;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;
import com.nike.memberInfo.MemberInfo_PagingVO;
import com.nike.product.ProductDTO;
import com.nike.memberInfo.MemberInfoDAO;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;

@Service
public class MemberService {
	@Autowired
	MemberInfoDAO dao;
	
	public void saveUserInfo(MemberInfoDTO dto) {
		dao.saveUserInfo(dto);
	}

	public int loginChk(MemberInfoDTO dto) {
		if(dao.loginChk(dto)==0) {
			return 0;
		}else{
			return 1;
		}
		
	}
	public void searchId(Model model,String idtel) {
		model.addAttribute("searchId", dao.searchId(idtel));
	}
	
	public void pwdUpdate(MemberInfoDTO dto) {
		dao.pwdUpdate(dto);
	}
	/*모든 회원목록 출력*/
	public void memberlist(Model model) {
		model.addAttribute("memberlists",dao.memberlists());
	}
	/*멤버 수 반환*/
	public int countBoard() {
		return dao.countBoard();
	}
	/*모든 회원목록 출력 일정량만*/
	public List<MemberInfoDTO> selectBoard(MemberInfo_PagingVO vo){
		return dao.selectBoard(vo);
	}
	/*아이디를 토대로 검색 회원목록 출력*/
	public void memberserchlist(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = 
				(HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		model.addAttribute("memberlist",dao.memberlist(id));
	}
	/*아이디를 토대로 회원 삭제*/
	public void memberdelete(String id) {
		dao.memberdelete(id);
	}
	
	/*회원정보 수정*/
	public void memberinfoModify(MemberInfoDTO dto, Model model) {
		dao.memberinfoModify(dto);
	}
	
	/*마일리지 조회*/
	public String mileage(String id) {
		return dao.mileage(id);
		
	}
	
	/*회원정보 수정을 위한 회원정보 조회*/
	public MemberInfoDTO account(String id) {
		return dao.account(id);
	}
	/* 마이페이지 회원 기존비밀번호 조회 */
	public String beforePwd(String id) {
		return dao.beforePwd(id);
	}
	/* 마이페이지 회원 비밀번호 변경 */
	public void pwdModify(String id) {
		dao.pwdModify(id);
	}
	/* 마이페이지 회원탈퇴 */
	public void userDelete(String id) {
		dao.userDelete(id);
	}
	/* 로그아웃 */
	public void logout(HttpSession mySession) {
		mySession.invalidate();
	}
	/* 로그인한 회원이름 출력 */
	public String nameget(String id) {
		return dao.nameget(id);
	}
}
