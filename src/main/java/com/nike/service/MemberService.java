package com.nike.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.memberInfo.MemberInfoDAO;


@Service
public class MemberService {
	@Autowired
	private MemberInfoDAO dao;
	public void searchId(Model model,HttpServletRequest request) {
		String id = request.getParameter("id");
		model.addAttribute("searchId", dao.searchId(id));
		
		
		
	}
}
