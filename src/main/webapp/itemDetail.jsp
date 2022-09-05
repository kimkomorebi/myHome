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
	<div align="center">
		<h2>상품 상세 정보</h2>

		<form action="itemUpdate.do" method="post" name="" onSubmit="return check(this)">
			<input type="hidden" name="ID" value="${ITEM.id }"/>
			<table border="1">
				<tr>
					<th>상품 번호</th>
					<td>${ITEM.id }</td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td>
						<c:if test="${sessionScope.MANAGER != null }">
							<input type="text" name="NAME" value="${ITEM.name }"/>
						</c:if>
						<c:if test="${sessionScope.MANAGER == null }">
							${ITEM.name }
						</c:if>
						
					</td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td>
						<c:if test="${sessionScope.MANAGER != null }">
							<input type="text" name="PRICE" value="${ITEM.price }"/>
						</c:if>
						<c:if test="${sessionScope.MANAGER == null }">
							${ITEM.price }
						</c:if>
						
					</td>
				</tr>
				<tr>
					<th>원산지</th>
					<td>${ITEM.origin }</td>
				</tr>
				<tr>
					<th>설 명</th>
					<td>
						<c:if test="${sessionScope.MANAGER != null }">
							<textarea rows="5" cols="40" name="SPEC" >${ITEM.spec }</textarea>
						</c:if>
						<c:if test="${sessionScope.MANAGER == null }">
							<textarea rows="5" cols="40" readOnly="readOnly"/>${ITEM.spec }</textarea>
						</c:if>
					</td>
				</tr>
				<c:if test="${sessionScope.MANAGER != null }">
					<tr align="center">
						<td colspan="2">
							<input type="submit" value="상품정보 변경"/>
							<input type="reset" value="취 소"/>
						</td>
					</tr><br/><br/>
				</c:if>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function check(f){
			if(f.NAME.value == ''){
				alert("상품 이름을 입력하세요."); 
				return false;
			}else {
				if(f.NAME.length > 20){
					alert("상품 이름을 20자 이내로 입력하세요.");
					return false;
				}
			}
			if(f.PRICE.value == ''){
				alert("상품 가격을 입력하세요.");
				return false;
			}else {
				if(isNaN(f.PRICE.value)) {
					alert("상품 가격은 숫자로 입력하세요.");
					return false;
				}else {
					if(parseInt(f.PRICE.value) < 0) {
						alert("상품 가격은 0보다 커야 합니다.");
						return false;
					}
				}
			}
			if(! confirm("정말로 변경하시겠습니까?")){
				return false;
			}
		}
	</script>
			<c:if test="${param.R == 'OK' }">
			<script type="text/javascript">
			alert("상품 정보 수정 완료하였습니다.");
			</script>
		</c:if>
		<c:if test="${param.R == 'NOK' }">
			<script type="text/javascript">
				alert("상품 정보 수정 실패!!");
			</script>
		</c:if>
</body>
</html>