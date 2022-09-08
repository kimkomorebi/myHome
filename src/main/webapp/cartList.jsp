<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>��ٱ��� ���</h2>
		<c:if test="${ empty requestScope.LISTS }">
			<h3>��ٱ��ϰ� ������ϴ�.</h3>
		</c:if>
		<c:if test="${ ! empty requestScope.LISTS }">
			<table border="1">
				<tr>
					<th>��ǰ��ȣ</th>
					<th>��ǰ�̸�</th>
					<th>��ǰ����</th>
					<th>������</th>
					<th>��ǰ����</th>
					<th>�� ��</th>
					<th>����/����</th>
				</tr>
				<c:forEach items="${requestScope.LISTS }" var="item">
					<form action="" onSubmit="return check(this)">
						<tr>
							<td>${item.id }</td>
							<td>${item.name }</td>
							<td><fmt:formatNumber groupingUsed="true">${item.price }</fmt:formatNumber> </td>
							<td>${item.origin }</td>
							<td><input type="text" name="NUM" value="${item.num }" size="2"/></td>
							<td><fmt:formatNumber groupingUsed="true">${item.price * item.num }</fmt:formatNumber></td>
							<td>
								<input type="submit" value="����"/>
								<input type="submit" value="����"/>
							</td>
						</tr>
					</form>
				</c:forEach>
			</table>
			<form action="">
				�Ѱ� : <fmt:formatNumber groupingUsed="true"> ${requestScope.TOTAL }</fmt:formatNumber>��<input type="submit" value="�����ϱ�"/>
			</form>
		</c:if>
	</div>
	<script type="text/javascript">
		function check(f) {
			if(f.NUM.value == '') {
				alert("������ �Է��� �ּ���.");
				return false;
			}else {
				if(isNaN(f.NUM.value)) {
					alert("������ ���ڷ� �Է��� �ּ���.");
					return false;
				}
			}
			if( ! confirm("�۾��� �����Ͻðڽ��ϱ�?")){
				return false;
			}
		}
	</script>
</body>
</html>