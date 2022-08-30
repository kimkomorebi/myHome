<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>상품 상세 정보</h2>
		<table border="1">
			<tr>
				<th>상품 번호</th>
				<td>${ITEM.id }</td>
			</tr>
			<tr>
				<th>상품 이름</th>
				<td>${ITEM.name }</td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td>${ITEM.price }</td>
			</tr>
			<tr>
				<th>원산지</th>
				<td>${ITEM.origin }</td>
			</tr>
			<tr>
				<th>설 명</th>
				<td>
					<textarea rows="5" cols="40" readonly>${ITEM.spec }</textarea>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>