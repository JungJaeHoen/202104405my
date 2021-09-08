<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form name= "regi" action="<%=request.getContextPath() %>/member/modify.do" method="post" >
		아이디 :  <input type="text" value="${member.id }" name="modid" readonly><br/>
		비밀번호:  <input type="password" value="${member.pwd }" name="pwd"><br/>
		이메일 :  <input type="text" value="${member.email }" name="eMail"><br/>
		전화번호 :  <input type="text" value="${member.phone } " name="phone"><br/>
		이름:  <input type="text" value="${member.name } " name="name" ><br/>
		권한 <br/>  
		  <select name="authority">
				<option value="ROLE_USER">일반회원</option>  
				<option value="ROLE_MANAGER">매니저</option>  
				<option value="ROLE_ADMIN">관리자</option>  
		  </select>
		  <br/><br/>
		  <input type = "submit" value="회원수정">
	</form>
</body>
</html>