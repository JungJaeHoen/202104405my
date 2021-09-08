package com.jsp.action.notice;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.NoticeVO;
import com.jsp.service.NoticeService;

public class NoticeRegistAction implements Action {
	
	private NoticeService noticeService;
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String sdate = fm.format(date);
		date = fm.parse(sdate);
		
		
		
		String url = null;
		
		String title = request.getParameter("title");	
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		
		System.out.println(endDate);
		System.out.println(sdate);
		
		NoticeVO notice = new NoticeVO();
		notice.setTitle(title);
		notice.setWriter(writer);
		notice.setContent(content);
		
		if(!startDate.equals("")) {
			notice.setStartDate(fm.parse(startDate));
		}else {
			notice.setStartDate(date);
		}
		
		
		if(!endDate.equals("")) {
			notice.setEndDate(fm.parse(endDate));
		}
		
		
		int result = noticeService.regist(notice); 
		
		if(result==0) {
			request.setAttribute("message", "게시글 등록을 실패했습니다.");
			url="notice/registFail";
		}else {
			request.setAttribute("message", "게시글 등록을 성공했습니다.");
			url="notice/registSuccess";
		}
		
		return url;
	}

}
