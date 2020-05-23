package com.nike.service;

import org.springframework.stereotype.Service;

import com.nike.memberInfo.MemberInfoDAO;
import com.nike.memberInfo.MemberInfoDTO;

@Service
public class MemberService {

	public void memberinfoModify(MemberInfoDTO dto) {
		
		MemberInfoDAO dao = new MemberInfoDAO();
		dao.memberinfoModify(dto);
		
	}

}
