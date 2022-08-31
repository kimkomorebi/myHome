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
<h2 align="center">상품 번호 중복 확인</h2>

<form action="itemIdCheck.do" name="frm">
	상품 번호 : <input type="text" name="ID" value="${ID }"/>
	<input type="submit" value="중복 검사"/>
</form>
<c:if test="${ ! empty DUP }">
	${ID }는 이미 사용 중입니다.
	<script type="text/javascript">
		opener.document.frm.ID.value = '';
	</script>
</c:if>
<c:if test="${ empty DUP }">
	${ID }는 사용 가능합니다.
	<input type="button" value="사용" onClick="idOK()"/>
</c:if>
<script type="text/javascript">
	function idOK(){
		opener.document.frm.ID.value = document.frm.ID.value;
		opener.document.frm.idChecked.value = "OK";
		opener.document.getElementById("ID").readOnly = true;
		self.close();
	}
</script>
</body>
</html>