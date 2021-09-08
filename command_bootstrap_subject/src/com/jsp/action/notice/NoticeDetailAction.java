package com.jsp.action.notice;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jsp.action.Action;
import com.jsp.controller.JSONResolver;
import com.jsp.dto.NoticeVO;
import com.jsp.service.NoticeService;

public class NoticeDetailAction implements Action {
	
	private NoticeService noticeService;
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		NoticeVO notice = null;
		
		try {
			noticeService.view(nno);
			notice = noticeService.getNotice(nno);
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        ObjectMapper mapper = new ObjectMapper();
	        mapper.setDateFormat(df);
	        //리스폰스에 대한 세팅을 먼저 해줘야함 (Content Type 결정)
	        response.setContentType("application/json;charset=utf-8");
	        PrintWriter out = response.getWriter();
	        
	        //내보내기
	        out.println(mapper.writeValueAsString(notice));
	        
	        // out 객체를 종료하고 환원.
	        out.close();
			
		} catch (Exception e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	         e.printStackTrace();
		}		
		
		return url;
	}

}
