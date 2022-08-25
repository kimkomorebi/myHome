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
		<h2 align="center">회원 가입</h2>
	</header>
	<section>
			<form action="memberRegister.do" method="post" onSubmit="return checkk(this)">
				<div align="center" id="secCon">
					<table border="1">
						<tr>
							<th>회원번호(자동발생)</th>
							<td><input type="text" name="IDD" readonly /></td>
						</tr>
						<tr>
							<th>회원성명</th>
							<td><input type="text" name="NAME"/></td>
						</tr>
						<tr>
							<th>회원전화</th>
							<td><input type="text" name="TEL"/></td>
						</tr>
						<tr>
							<th>회원주소</th>
							<td><input type="text" name="ADDR"/></td>
						</tr>
						<tr>
							<th>가입일자</th>
							<td><input type="date" name="DATE"/></td>
						</tr>
						<tr>
							<th>고객등급[A:VIP,B:일반,C:직원]</th>
							<td>
								<select name="LEVEL">
									<option value="A">VIP</option>
									<option value="B">일반</option>
									<option value="C">직원</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>도시코드</th>
							<td>
								<select name="CITY">
									<option value="01">서울</option>
									<option value="60">제주도</option>
									<option value="30">울릉군</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="등록" name="btn"/>
								<input type="button" value="조회" onClick="doSelect()"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
	</section>
	<script type="text/javascript">
		function doSelect(){
			if(confirm("정말로 조회하시겠습니까?")){
				location.href="memberAll.do"; //조회 서블릿 호출
			}
		}
		function checkk(frm){
			if(frm.NAME.value == ''){
				alert("이름을 입력하세요."); return false;
			}
			if(frm.TEL.value == ''){
				alert("회원 전화를 입력하세요."); return false;
			}
			if(frm.ADDR.value == ''){
				alert("주소를 입력하세여."); return false;
			}
			if(frm.DATE.value == '') {
				alert("날짜를 입력하세요."); return false;
			}
			if(confirm("입력한 내용이 맞습니까?")){
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>