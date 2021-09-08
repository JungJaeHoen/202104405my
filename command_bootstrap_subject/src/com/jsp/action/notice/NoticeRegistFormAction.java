package com.jsp.action.notice;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;

public class NoticeRegistFormAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String sdate = fm.format(date);
		
		
		request.setAttribute("nowDate", sdate);
		String url = "notice/regist";
		return url;
	}

}
