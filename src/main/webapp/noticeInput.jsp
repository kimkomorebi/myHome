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
		<h2>공지사항 쓰기</h2>
		<form action="noticeInput.do" method="post" onSubmit="return check(this)">
			<table>
				<tr>
					<th>제 목</th>
					<td><input type="text" name="TITLE"/></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea rows="6" cols="40" name="CONTENT"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글 올리기"/>
						<input type="reset" value="취 소"/>
					</td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	function check(f) {
		if(f.TITLE.value == ''){
			alert("제목을 입력하세요."); return false;
		}else {
			if(f.TITLE.value.length > 30) {
				alert("제목이 너무 깁니다."); return false;
			}
		}
		if(f.CONTENT.value == '') {
			alert("내용을 입력하세요."); return false;
		}else {
			if(f.CONTENT.value.length > 100) {
				alert("내용이 너무 깁니다."); return false;
			}
		}
		if( ! confirm("정말로 작성하시겠습니까?")) { return false; }
	}
</script>
</body>
</html>