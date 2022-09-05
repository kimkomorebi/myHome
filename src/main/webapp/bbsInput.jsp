<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<header>
			<h2>게시판 글 쓰기</h2>
		</header>
		<section>
			<form action="bbsPost.do" method="post" onSubmit="return check(this)">
				제 목 : <input type="text" name="TITLE"
				 placeHolder="제목을 입력 하세요" size="20"/><br/>
				내 용 : <br/>
				<textarea rows="5" cols="40" name="CONTENT"></textarea>
				<br/>
				<input type="submit" value="글 올리기"/>
				<input type="reset" value="취소"/>
			</form>
		</section>
	</div>
	<script type="text/javascript">
		function check(f){
			if(f.TITLE.value == ''){
				alert("제목을 입력하세요."); return false;
			}else {
				if(f.TITLE.value.length > 30){
					alert("제목을 30자 이내로 작성하세요.");
					return false;
				}
			}
			if(f.CONTENT.value ==''){
				alert("내용을 입력하세요."); return false;
			}else {
				if(f.CONTENT.value.length > 100){
					alert("내용은 100자 이내로 작성하세요."); return false;
				}
			}
			if(! confirm("정말로 올리시겠습니까?")) return false;
		}
	</script>
</body>
</html>