package com.jsp.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;

public class MyMemberModifyAction implements Action {
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = null;
		
		String modid = request.getParameter("modid");
		String pwd = request.getParameter("pwd");
		String eMail = request.getParameter("eMail");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String authority = request.getParameter("authority");
		
		try {
			MemberVO member =  new MemberVO();
			member.setId(modid);
			member.setPwd(pwd);
			member.setEmail(eMail);
			member.setPhone(phone);
			member.setPicture("noImage.jpg");
			member.setName(name);
			member.setAuthority(authority);
			
			memberService.modify(member);
			
			request.setAttribute("message", "수정완료!");
			url = "member/modifySuccess";
		}catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		
		
		return url;
		
	}

}
