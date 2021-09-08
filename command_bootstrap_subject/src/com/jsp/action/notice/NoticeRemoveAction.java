package com.jsp.action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.NoticeService;

public class NoticeRemoveAction implements Action {
	
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		
		int nno = Integer.parseInt(request.getParameter("removenno"));
		
		int result = noticeService.remove(nno);
		
		if(result == 0) {
			request.setAttribute("message", "게시글삭제를 실패했습니다");
			url = "notice/removeFail";
		}else {
			request.setAttribute("message", "게시글이 삭제되었습니다");
			url = "notice/removeSuccess";
		}
		
		return url;
	}

}
