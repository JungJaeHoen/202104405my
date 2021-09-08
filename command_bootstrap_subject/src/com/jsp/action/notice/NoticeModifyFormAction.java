package com.jsp.action.notice;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.NoticeVO;
import com.jsp.request.PageMaker;
import com.jsp.request.SearchCriteria;
import com.jsp.service.NoticeService;

public class NoticeModifyFormAction implements Action {
	
	private NoticeService noticeService;
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "notice/list";
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String sdate = fm.format(date);
		
		
		int nno = Integer.parseInt(request.getParameter("modifynno"));
		
		String page = request.getParameter("page");
		String perPageNum = request.getParameter("perPageNum");
		String searchType = request.getParameter("searchType");
		String keyword =  request.getParameter("keyword");
		
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		NoticeVO notice = noticeService.getNotice(nno);
		
		Map<String, Object> dataMap = noticeService.getNoticeList(cri);
		
		request.setAttribute("pageMaker", dataMap.get("pageMaker"));
		request.setAttribute("modifyFlag", true);
		request.setAttribute("modifynno", nno);
		request.setAttribute("modifyNotice", notice);
		request.setAttribute("nowDate", sdate);
		
		
		return url;
	}

}
