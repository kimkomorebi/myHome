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
	<div align="center">
		<h2>공지사항 목록</h2>
		<table border="1">
			<tr>
				<th width="10%">글번호</th>
				<th width="20%">작성자</th>
				<th width="50%">제 목</th>
				<th width="20%">작성일</th>
			</tr>
			<c:forEach items="${LIST }" var="notice">
				<tr>
					<td>${notice.seqno }</td>
					<td>${notice.id }</td>
					<td>${notice.title }</td>
					<td>${notice.date }</td>
				</tr>
			</c:forEach>
		</table>
		<c:forEach begin="1" end="${PAGES }" var="page">
			<a href="#">${page }</a>
		</c:forEach>
	</div>
</body>
</html>