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
	<h2 align="center">���̵� �ߺ� ��ȸ</h2>
	<form action="" name="checkFrm">
		�Է��� ���̵� : <input type="text" name="IDD" value="${requestScope.IDD }"/>
		<input type="submit" value="�ߺ� üũ"/>
	</form>
	<br/>
		<c:if test="${! empty requestScope.CHECKID }">
			${requestScope.IDD }�� ��� ���� ���̵��Դϴ�.
			<script type="text/javascript">
				opener.document.frm.IDD.value = '';
			</script>
		</c:if>
		<c:if test="${ empty requestScope.CHECKID }">
			${requestScope.IDD }�� ��� �����մϴ�.
			<input type="button" value="����ϱ�" onClick="idOK()"/>
		</c:if>
	<script type="text/javascript">
		function idOK(){
			opener.document.frm.IDD.value = document.checkFrm.IDD.value;
			opener.document.frm.idChecked.value = "GOOD";
			opener.document.getElementById("IDD").readOnly = true;
			self.close();
		}
	</script>
</body>
</html>