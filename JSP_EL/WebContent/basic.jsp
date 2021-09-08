<%@page import="com.jsp.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	MemberVO member = new MemberVO("mimi","mimi");
	
	pageContext.setAttribute("member", member);

%>

<%
	pageContext.setAttribute("msg", "안녕하세요.");
	request.setAttribute("msg", "msg는 맛소금입니다.");
	session.setAttribute("msg", "msg는 몸에 나쁘지 않습니다.");
	application.setAttribute("msg", "다시다 맛있어요");
	
	pageContext.setAttribute("num", 10);
	pageContext.setAttribute("num+1", 1);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<ul>//Attribute
		<li>pageScope EL: ${sessionScope.msg }</li>
		<li>pageScope 표현식: <%=pageContext.getAttribute("msg") %></li>
		<li>MemberVO id 표현식 : <%=((MemberVO)pageContext.getAttribute("member")).getId() %>
		<li>MemberVO id EL : ${member.id }
	</ul>
	
	<ul>// Parameter
		<li>표현식 : <%=request.getParameter("name") %></li>
		<li>EL : ${param.name }</li>
	</ul>
	
	
	<ul>//연산자
		<li>산술연산 : ${num+1 }</li>
		<li>문자열 더하기 : ${num+1 }${msg }</li>
		<li>비교연산 : ${num ge 3 }</li>
		<li>유무연산 : ${empty num },${not empty requestScope.member }</li>
	</ul>
	
	<ul>//일반 메소드 호출
		<li>member.getTime() : ${member.getTime() }</li>
		<li>member.time : ${member.time }</li>
	</ul>
</body>
</html>