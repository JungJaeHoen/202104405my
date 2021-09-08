package com.jsp.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JSONResolver {
	
	
	public static void view(HttpServletResponse response, Object target)throws Exception {//인자를 밖에서 받아쓰는놈이라서 static 리턴타입이 따로 필요없다 responseout으로 내보낼거라
        //오브젝트를 JSON데이터로 바꿔주는 것 (출력)
        ObjectMapper mapper = new ObjectMapper();
        
        //리스폰스에 대한 세팅을 먼저 해줘야함 (Content Type 결정)
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        
        //내보내기
        out.println(mapper.writeValueAsString(target));
        
        // out 객체를 종료하고 환원.
        out.close();
	}
}
