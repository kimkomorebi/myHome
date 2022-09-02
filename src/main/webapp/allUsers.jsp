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
		<h2>가입자 목록</h2>
		<table border="1">
			<tr>
				<th width="10%">계 정</th>
				<th width="20%">이 름</th>
				<th width="15">연락처</th>
				<th width="5%">성 별</th>
				<th width="15%">이메일</th>
				<th width="10%">직 업</th>
				<th width="20%">가입일</th>
			</tr>
			<c:forEach items="${USERS }" var="user">
				<tr>
					<td><a href="userDetail.do?ID=${user.id }">${user.id }</a></td>
					<td>${user.name }</td>
					<td>${user.tel }</td>
					<td>${user.gender }</td>
					<td>${user.email }</td>
					<td>${user.job }</td>
					<td>${user.entry_date }</td>
				</tr>
			</c:forEach>
		</table>
		<c:forEach begin="1" end="${PAGES }" var="page">
			<a href="UserSelectAllServlet?PAGENO=${page }">${page }</a>
		</c:forEach><br/>
	</div>
</body>
</html>