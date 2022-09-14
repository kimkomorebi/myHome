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
		<h2>이미지 게시글 작성</h2>
		<form action="" method="post" onSubmit="return check(this)" encType="multipart/form-data">
			<table border="1">
				<tr>
					<th>제 목</th>
					<td>
						<input type="text" name="TITLE"/>
					</td>
				</tr>
				<tr>
					<th>암 호</th>
					<td>
						<input type="password" name="PWD"/>
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>
						<input type="file" name="IMAGENAME"/>
					</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td>
						<textarea rows="8" cols="40" name="CONTENT"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글 올리기"/>
						<input type="reset" value="취 소"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function check(f){
			if(f.TITLE.value == '') {
				alert("글 제목을 입력하세요."); return false;
			}else{
				if(f.TITLE.value.length > 30) {
					alert("글 제목은 30자 이내로 작성하세요.");
					return false;
				}
			}
			if(f.PWD.value == ''){
				alert("암호를 입력하세요."); return false;
			}else {
				if(f.PWD.length > 20) {
					alert("암호는 20자 이내로 입력하세요."); return false;
				}
			}
			if(f.IMAGENAME.value == ''){
				alert("이미지 파일을 선택하세요."); return false;
			}
			if(f.CONTENT.value == '') {
				alert("글 내용을 입력하세요."); return false;
			}else {
				if(f.CONTENT.length > 100) {
					alert("글 내용은 100자 이내로 작성하세요.");
					return false;
				}
			}
			if( ! confirm("정말로 업로드 하시겠습니까?")){
				return false;
			}
		}
	</script>
</body>
</html>