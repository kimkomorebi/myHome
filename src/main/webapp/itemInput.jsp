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
	<div align="center">
		<h2>상품 정보 등록</h2>
		<form action="putItem.do" method="post" onSubmit="return check(this)" name="frm">
		<input type="hidden" name="idChecked"/>
			<table border="1">
				<tr>
					<th>상품 번호</th>
					<td>
					<input type="text" name="ID"/>
					<input type="button" value="중복 검사" onClick="idCheck()"/>
					</td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td><input type="text" name="NAME"/></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input type="text" name="PRICE"/></td>
				</tr>
				<tr>
					<th>원산지</th>
					<td>
						<select name="CODE">
							<c:forEach items="${CODES }" var="code">
								<option>${code }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td>
						<textarea rows="5" cols="40" name="CONTENT"></textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="상품 등록"/>
						<input type="reset" value="취 소"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function idCheck(){
			if(document.frm.ID.value == '') {
				alert("상품 번호를 입력하세요."); return false;
			}
			var url = "itemIdCheck.do?ID="+document.frm.ID.value;
			window.open(url,"_blank_","width=450, height=200");
		}
		function check(fm){
			if(fm.ID.value == ''){
				alert("상품 번호르 입력하세요."); return false;
			}
			else {
				if(fm.ID.value.length > 8) {
					alert("상품 번호는 8자리 이하로 입력하세요");
					return false;
				}
			}//상품 번호 입력 유무 검사 완료
			if(fm.idChecked.value == ''){
				alert("중복 검사를 해야 합니다."); return false;
			}//상품 번호 중복 검사 유무 확인
			if(fm.NAME.value == ''){
				alert("상품 이름을 입력하세요.");
				return false;
			}else {
			if(fm.NAME.value.length > 20){
				alert("이름은 20자리 이내로 입력하세요.");
				return false;
				}
			}
			if(fm.PRICE.value == ''){
				alert("상품 가격을 입력하세요.");
				return false;
			}else {
				if(isNaN(fm.PRICE.value)){
					alert("상품 가격은 숫자로 입력하세요.");
					return false;
				}else {
					if(parseInt(fm.PRICE.value) < 0){
						alert("가격은 음수로 입력할 수 없습니다.");
						return false;
					}
				}
			}//상품 가격 입력 유무 검사 완료
			if(! confirm("정말로 등록하시겠습니까?")){
				return false;
			}
		}
	</script>
</body>
</html>