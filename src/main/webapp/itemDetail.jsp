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
		<h2>��ǰ �� ����</h2>
		<table border="1">
			<tr>
				<th>��ǰ ��ȣ</th>
				<td>${ITEM.id }</td>
			</tr>
			<tr>
				<th>��ǰ �̸�</th>
				<td>${ITEM.name }</td>
			</tr>
			<tr>
				<th>��ǰ ����</th>
				<td>${ITEM.price }</td>
			</tr>
			<tr>
				<th>������</th>
				<td>${ITEM.origin }</td>
			</tr>
			<tr>
				<th>�� ��</th>
				<td>
					<textarea rows="5" cols="40" readonly>${ITEM.spec }</textarea>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>