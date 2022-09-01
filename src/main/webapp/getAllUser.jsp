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
		<table border="1">
			<tr>
				<th width="11%">아이디</th>
				<th width="11%">비밀번호</th>
				<th width="11%">이름</th>
				<th width="11%">전화번호</th>
				<th width="11%">주소</th>
				<th width="11%">성별</th>
				<th width="11%">이메일</th>
				<th width="11%">직업</th>
				<th width="11%">가입일</th>
			</tr>
				<c:forEach items="${requestScope.AL }" var="list">
				<tr>
						<td>${list.id }</td>
						<td>${list.pwd }</td>
						<td>${list.name }</td>
						<td>${list.tel }</td>
						<td>${list.addr }</td>
						<td>${list.gender }</td>
						<td>${list.email }</td>
						<td>${list.job }</td>
						<td>${list.entry_date }</td>
				</tr>
					</c:forEach>
		</table>
	</div>
</body>
</html>