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
	<header>
		<h2 align="center" class="tit">로그인 결과</h2>
	</header>
	<section>
	<c:if test="${param.R == 'OK' }">
		로그인 되었습니다.<br/>
		환영합니다.~
		<c:if test="${ ! empty sessionScope.LOGINID }">
			${sessionScope.LOGINID } 님~
		</c:if>
		<c:if test="${ ! empty sessionScope.MANAGER }">
			${sessionScope.MANAGER } 님~
		</c:if>
		<c:if test="${ ! empty param. POPUP}">
			<br/><input type="button" value="닫 기" onClick="doIt()"/>
			<script type="text/javascript">
				function doIt(){
					self.close();
					opener.document.location.reload();
					opener.popupAlert();
				}
			</script>
		</c:if>
	</c:if>
	<c:if test="${param.R == 'NOPWD' }">
		암호가 일치하지 않습니다. 암호를 확인하세요.
	</c:if>
	<c:if test="${param.R == 'NOID' }">
		계정이 없습니다.가입 후 이용해 주세요.	
	</c:if>

<%-- <%
	String result = request.getParameter("R");
	if(result.equals("OK")){
		//로그인 성공 메세지 출력
		out.print("로그인 되었습니다.<br/>");
		String id = (String)session.getAttribute("LOGINID");
		if(id == null) {
			id = (String)session.getAttribute("MANAGER");
		}
		out.print("환영합니다~"+id+"님");
	}else if(result.equals("NOPWD")){
		//암호 불일치 메세지 출력
		out.print("암호가 일치하지 않습니다. 암호를 확인하세요.");
	}else if(result.equals("NOID")){
		//계정 없음 메세지 출력
		out.print("계정이 없습니다.가입 후 이용해 주세요.");
	}
%> --%>
	</section>
</body>
</html>