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
		<form action="itemUpdate.do" method="post">
		<input type="hidden" name="ID" value="${ITEM.id }"/>
			<table border="1">
				<tr>
					<th>상품 번호</th>
					<td>${ITEM.id }</td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td><input type="text" name="NAME" value="${ITEM.name }"/></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input type="text" name="PRICE" value="${ITEM.price }"/></td>
				</tr>
				<tr>
					<th>원산지</th>
					<td>${ITEM.origin }</td>
				</tr>
				<tr>
					<th>설 명</th>
					<td>
						<textarea rows="5" cols="40" name="SPEC=${ITEM.spec }">${ITEM.spec }</textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="수정"/>
						<input type="reset" value="취소"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>