package com.nike.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;


import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;

@Service
public class MemberService {
<<<<<<< HEAD

	public void memberinfoModify(MemberInfoDTO dto) {
		
		MemberInfoDAO dao = new MemberInfoDAO();
		dao.memberinfoModify(dto);
		
	}

=======
	@Autowired
	private MemberInfoDAO dao;
	public void searchId(Model model,String idtel) {
		model.addAttribute("searchId", dao.searchId(idtel));
	}
	
	public void pwdUpdate(MemberInfoDTO dto) {
		dao.pwdUpdate(dto);
		System.out.println(dto.getPwd());
	}
>>>>>>> refs/heads/master
}
