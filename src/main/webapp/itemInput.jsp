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
		<h2>��ǰ ���� ���</h2>
		<form action="putItem.do" method="post" onSubmit="return check(this)">
			<table border="1">
				<tr>
					<th>��ǰ ��ȣ</th>
					<td><input type="text" name="ID"/></td>
				</tr>
				<tr>
					<th>��ǰ �̸�</th>
					<td><input type="text" name="NAME"/></td>
				</tr>
				<tr>
					<th>��ǰ ����</th>
					<td><input type="text" name="PRICE"/></td>
				</tr>
				<tr>
					<th>������</th>
					<td>
						<select name="CODE">
							<c:forEach items="${CODES }" var="code">
								<option>${code }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>��ǰ ����</th>
					<td>
						<textarea rows="5" cols="40" name="CONTENT"></textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="��ǰ ���"/>
						<input type="reset" value="�� ��"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function check(fm){
			if(fm.ID.value == ''){
				alert("��ǰ ��ȣ�� �Է��ϼ���."); return false;
			}
			else {
				if(fm.ID.value.length > 8) {
					alert("��ǰ ��ȣ�� 8�ڸ� ���Ϸ� �Է��ϼ���");
					return false;
				}
			}
			if(fm.NAME.value == ''){
				alert("��ǰ �̸��� �Է��ϼ���.");
				return false;
			}else {
			if(fm.NAME.value.length > 20){
				alert("�̸��� 20�ڸ� �̳��� �Է��ϼ���.");
				return false;
				}
			}
			if(fm.PRICE.value == ''){
				alert("��ǰ ������ �Է��ϼ���.");
				return false;
			}else {
				if(isNaN(fm.PRICE.value)){
					alert("��ǰ ������ ���ڷ� �Է��ϼ���.");
					return false;
				}else {
					if(parseInt(fm.PRICE.value) < 0){
						alert("������ ������ �Է��� �� �����ϴ�.");
						return false;
					}
				}
			}//��ǰ ���� �Է� ���� �˻� �Ϸ�
			if(! confirm("������ ����Ͻðڽ��ϱ�?")){
				return false;
			}
		}
	</script>
</body>
</html>