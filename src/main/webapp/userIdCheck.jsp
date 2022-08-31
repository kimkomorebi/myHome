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
	<h2 align="center">아이디 중복 조회</h2>
	<form action="" name="checkFrm">
		입력한 아이디 : <input type="text" name="IDD" value="${requestScope.IDD }"/>
		<input type="submit" value="중복 체크"/>
	</form>
	<br/>
		<c:if test="${! empty requestScope.CHECKID }">
			${requestScope.IDD }는 사용 중인 아이디입니다.
			<script type="text/javascript">
				opener.document.frm.IDD.value = '';
			</script>
		</c:if>
		<c:if test="${ empty requestScope.CHECKID }">
			${requestScope.IDD }는 사용 가능합니다.
			<input type="button" value="사용하기" onClick="idOK()"/>
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