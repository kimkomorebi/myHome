<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<section>
		<div align="right"><a href="template.jsp?BODY=entry.jsp">가입하기</a></div>
		<div align="center">
			<form action="login.do" method="post" name="login" onSubmit="return check(this)">
				계 정 : <input type="text" name="ID" size="10"/><br/>
				암 호 : <input type="password" name="PWD" size="10"/><br/><br/>
				<input type="submit" value="로그인"/>
				<input type="reset" value="취 소"/>
			</form>
		</div>
	</section>
	<script type="text/javascript">
		function check(f){
			if(f.ID.value == ''){
				alert("계정을 입력하세요."); return false;
			}
			if(f.PWD.value == '') {
				alert("암호를 입력하세요."); return false;
			}
		}
	</script>
</body>
</html>

	