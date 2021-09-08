package com.jsp.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;

public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HandlerMapper handlerMapper;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String handlerMapperType  =  config.getInitParameter("handlerMapper"); 
		
		try {
			this.handlerMapper = (HandlerMapper) injectionBean(handlerMapperType);
			System.out.println("[FrontServlet] handlerMapper가 준비되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[FrontServlet] handlerMapper가 준비되지 않았습니다.");
		}
		
	}
	
	private Object injectionBean(String classType) throws Exception{
		Class<?> cls = Class.forName(classType);
		return cls.newInstance();
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
		
		//사용자  url 검출
		String command = request.getRequestURI(); //contextPath 포함.
		if  (command.indexOf(request.getContextPath()) == 0 ) {// contextpath 삭제
			command = command.substring(request.getContextPath().length());
		}
		
		//commandHandler 실행 (HandlerMapper 의뢰 handler할당)
		Action action = null;
		String view = null;
		
		if(handlerMapper != null) {
			action = handlerMapper.getAction(command);
			if(action!=null) {//올바른 문장
				
				try {
					view = action.process(request, response);
					request.setAttribute("viewname", view);
					ViewResolver.view(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					response.sendError(HttpServletResponse.SC_NOT_FOUND);
				}
				
			}else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		}else {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
		
		
	}
	
	
}
