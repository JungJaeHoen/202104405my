<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
아이디 : ${member.id }<br/>
패스워드 : ${member.pwd }<br/>
이메일 : ${member.email }<br/>
휴대폰번호 : <c:if test="${member.phone.length() eq 11 }">
	    	${member.phone.substring(0,3) }-${member.phone.substring(3,7) }-${member.phone.substring(7) }
	   	  </c:if>
	      <c:if test="${member.phone.length() eq 13 }">
	    	${member.phone }
	      </c:if>
	      <br/>
이름 : ${member.name }
<br/><br/>
<input type ="button" onclick="location.href='/member/remove.do?id=${member.id}'" value="삭제하기"/>
<input type ="button" onclick="location.href='/member/modifyForm.do?id=${member.id}'" value="수정하기"/>
</body>
</html>