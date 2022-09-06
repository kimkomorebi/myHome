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
		<c:if test="${empty requestScope.LIST }">
			<h3>등록된 게시글이 존재하지 않습니다.</h3>
		</c:if>
		<c:if test="${ ! empty requestScope.LIST }">
			<h2>게시글 목록</h2>
			<table border="1">
				<tr>
					<th>글번호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${requestScope.LIST }" var="bbs">
					<tr>
						<td>${bbs.seqno }</td>
						<td><a href="getBBS.do?NO=${bbs.seqno }">${bbs.title }</a></td>
						<td>${bbs.writer }</td>
						<td>${bbs.date }</td>
					</tr>
				</c:forEach>
			</table>
			<c:forEach begin="1" end="${requestScope.PAGES }" var="page">
				<a href="getAllBBS.do?PAGE=${page }">${page }</a>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>