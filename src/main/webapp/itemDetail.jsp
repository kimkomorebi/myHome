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
		<form action="itemUpdate.do" method="post">
		<input type="hidden" name="ID" value="${ITEM.id }"/>
			<table border="1">
				<tr>
					<th>��ǰ ��ȣ</th>
					<td>${ITEM.id }</td>
				</tr>
				<tr>
					<th>��ǰ �̸�</th>
					<td><input type="text" name="NAME" value="${ITEM.name }"/></td>
				</tr>
				<tr>
					<th>��ǰ ����</th>
					<td><input type="text" name="PRICE" value="${ITEM.price }"/></td>
				</tr>
				<tr>
					<th>������</th>
					<td>${ITEM.origin }</td>
				</tr>
				<tr>
					<th>�� ��</th>
					<td>
						<textarea rows="5" cols="40" name="SPEC=${ITEM.spec }">${ITEM.spec }</textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="����"/>
						<input type="reset" value="���"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>