package com.jsp.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;

public class MyRegistFormAction implements Action {

	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String eMail = request.getParameter("eMail");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String authority = request.getParameter("authority");
		
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("eMail : " + eMail);
		System.out.println("phone : " + phone);
		System.out.println("name : " + name);
		System.out.println("authority : " + authority);
		
		if(id == null) {
			url = "member/registForm";
//			System.out.println(url);
		}
		
		try {
				
			if(id != null) {
					MemberVO memberCheck = memberService.getMember(id);
				if(memberCheck !=null ) {
					request.setAttribute("message", "이미 존재하는 아이디입니다.");
					url = "member/registFail";
				}else {
					MemberVO member = new MemberVO();
					member.setId(id);
					member.setPwd(pwd);
					member.setEmail(eMail);
					member.setPhone(phone);
					member.setPicture("noImage.jpg");
					member.setName(name);
					member.setAuthority(authority);
					
					System.out.println(member.getId());
					System.out.println(member.getPwd());
					System.out.println(member.getEmail());
					System.out.println(member.getPhone());
					System.out.println(member.getPicture());
					System.out.println(member.getName());
					System.out.println(member.getAuthority());
					
						memberService.regist(member);
					
					request.setAttribute("message", "등록완료!");
					url = "member/registSuccess";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		}
		
		
		
		
		return url;
	}

}
