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
				<th width="11%">���̵�</th>
				<th width="11%">��й�ȣ</th>
				<th width="11%">�̸�</th>
				<th width="11%">��ȭ��ȣ</th>
				<th width="11%">�ּ�</th>
				<th width="11%">����</th>
				<th width="11%">�̸���</th>
				<th width="11%">����</th>
				<th width="11%">������</th>
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