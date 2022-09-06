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
			alert("게시글이 등록되었습니다.");
			location.href="getAllBBS.do";
		</script>
	</c:if>
	<c:if test="${param.R < 1 }">
		<script type="text/javascript">
			alert("게시글 등록에 실패하였습니다. 관리자에게 문의해 주세요");
			location.href="getAllBBS.do";
		</script>
	</c:if>
</body>
</html>