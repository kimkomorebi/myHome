<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<%
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
		out.print("계정이 업습니다.가입 후 이용해 주세요.");
	}
%>
	</section>
</body>
</html>