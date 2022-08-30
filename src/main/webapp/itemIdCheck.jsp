<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">상품 번호 중복 확인</h2>
<c:if test="${ empty DUP }">
${ID }는 사용가능합니다.

</c:if>
<c:if test="${! empty DUP }">
	${ID }는 이미 사용 중입니다.
</c:if>
</body>
</html>