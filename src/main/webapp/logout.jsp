<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form action="logout.do">
			환영합니다~ <br/>
			<c:if test="${sessionScope.LOGINID != null }">
				${sessionScope.LOGINID } 
			</c:if>
			<c:if test="${sessionScope.MANAGER != null }">
				${sessionScope.MANAGER }
			</c:if>
			님~<br/><br/>
			<input type="submit" value="로그아웃"/>
		</form>
	</div>
</body>
</html>