package com.nike.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;
import org.springframework.web.bind.annotation.RequestParam;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;

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

	public void memberinfoModify(MemberInfoDTO dto, Model model) {
		dao.memberinfoModify(dto);
	}

	public String mileage() {
		return dao.mileage();
		
	}

	public MemberInfoDTO account(String id) {
		return dao.account(id);
	}
	
}
