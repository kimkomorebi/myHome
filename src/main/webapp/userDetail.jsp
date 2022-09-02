<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>가입자 상세 정보</h2>
		<c:if test="${param.R == 'OK' }">
			<script type="text/javascript">
				alert("고객 정보가 수정되었습니다.");
			</script>
		</c:if>
		<c:if test="${param.R == 'NOK' }">
			<script type="text/javascript">
				alert("고객 정보 수정에 문제가 발생했습니다.");
			</script>
		</c:if>
		<form action="userUpdate.do" method="post" onSubmit="return check()">
			<table border="1">
				<tr>
					<th>계 정</th>
					<td>
						<input type="text" name="ID" value="${USER.id }" readOnly="readonly"/>
					</td>
				</tr>
				<tr>
					<th>이 름</th>
					<td>
						<input type="text" name="NAME" value="${USER.name }" readOnly="readonly"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="TEL" value="${USER.tel }"/>
					</td>
				</tr>
				<tr>
					<th>주 소</th>
					<td>
						<input type="text" name="ADDR" value="${USER.addr }"/>
					</td>
				</tr>
				<tr>
					<th>성 별</th>
					<td>
						<c:if test="${USER.gender == 'M'.charAt(0) }">남자</c:if>
						<c:if test="${USER.gender eq 'F'.charAt(0) }">여자</c:if>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="EMAIL" value="${USER.email }" />
					</td>
				</tr>
				<tr>
					<th>직 업</th>
					<td>
						<input type="text" name="JOB" value="${USER.job }"/>
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>
						<input type="text" value="${USER.entry_date }" readOnly="readonly"/>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="수 정"/>
						<input type="reset" value="취 소"/>
					</td>
				</tr>
			</table><br/><br/>
		</form>
	</div>
	<script type="text/javascript">
		function check(){
			if(! confirm("정말로 수정하시겠습니까?")){
				return false;
			}
		}
	</script>
</body>
</html>