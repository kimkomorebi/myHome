<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>������ �� ����</h2>
		<c:if test="${param.R == 'OK' }">
			<script type="text/javascript">
				alert("�� ������ �����Ǿ����ϴ�.");
			</script>
		</c:if>
		<c:if test="${param.R == 'NOK' }">
			<script type="text/javascript">
				alert("�� ���� ������ ������ �߻��߽��ϴ�.");
			</script>
		</c:if>
		<form action="userUpdate.do" method="post" onSubmit="return check()">
			<table border="1">
				<tr>
					<th>�� ��</th>
					<td>
						<input type="text" name="ID" value="${USER.id }" readOnly="readonly"/>
					</td>
				</tr>
				<tr>
					<th>�� ��</th>
					<td>
						<input type="text" name="NAME" value="${USER.name }" readOnly="readonly"/>
					</td>
				</tr>
				<tr>
					<th>����ó</th>
					<td>
						<input type="text" name="TEL" value="${USER.tel }"/>
					</td>
				</tr>
				<tr>
					<th>�� ��</th>
					<td>
						<input type="text" name="ADDR" value="${USER.addr }"/>
					</td>
				</tr>
				<tr>
					<th>�� ��</th>
					<td>
						<c:if test="${USER.gender == 'M'.charAt(0) }">����</c:if>
						<c:if test="${USER.gender eq 'F'.charAt(0) }">����</c:if>
					</td>
				</tr>
				<tr>
					<th>�̸���</th>
					<td>
						<input type="text" name="EMAIL" value="${USER.email }" />
					</td>
				</tr>
				<tr>
					<th>�� ��</th>
					<td>
						<input type="text" name="JOB" value="${USER.job }"/>
					</td>
				</tr>
				<tr>
					<th>������</th>
					<td>
						<input type="text" value="${USER.entry_date }" readOnly="readonly"/>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="�� ��"/>
						<input type="reset" value="�� ��"/>
					</td>
				</tr>
			</table><br/><br/>
		</form>
	</div>
	<script type="text/javascript">
		function check(){
			if(! confirm("������ �����Ͻðڽ��ϱ�?")){
				return false;
			}
		}
	</script>
</body>
</html>