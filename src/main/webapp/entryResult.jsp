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
		<c:choose>
			<c:when test="${param.RESULT == 'OK' }">
				<h2>가입을 축하합니다~</h2>
			</c:when>
			<c:otherwise>
				<h2>가입시 문제가 발생했습니다.</h2>
				<h2>관리자에게 문의해 주세요.</h2>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>