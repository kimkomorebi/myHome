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
	<c:if test="${param.R > 0 }">
		<script type="text/javascript">
			alert("�Խñ��� ��ϵǾ����ϴ�.");
			location.href="getAllBBS.do";
		</script>
	</c:if>
	<c:if test="${param.R < 1 }">
		<script type="text/javascript">
			alert("�Խñ� ��Ͽ� �����Ͽ����ϴ�. �����ڿ��� ������ �ּ���");
			location.href="getAllBBS.do";
		</script>
	</c:if>
</body>
</html>