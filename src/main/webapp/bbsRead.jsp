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
		<c:if test="${ empty BBS }">
			<h3>존재하지 않는 글입니다.</h3>
		</c:if>
		<c:if test="${ ! empty BBS }">
			<h2>게시글 상세</h2>
			<table border="1">
				<tr>
					<th>글번호</th>
					<td>${BBS.seqno }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${BBS.writer }</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td>${BBS.title }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${BBS.date }</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>
						<textarea rows="5" cols="40">${BBS.content }</textarea>
					</td>
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>