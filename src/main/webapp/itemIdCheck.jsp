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
<h2 align="center">��ǰ ��ȣ �ߺ� Ȯ��</h2>
<c:if test="${ empty DUP }">
${ID }�� ��밡���մϴ�.

</c:if>
<c:if test="${! empty DUP }">
	${ID }�� �̹� ��� ���Դϴ�.
</c:if>
</body>
</html>