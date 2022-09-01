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
			<form action="memberRegister.do" method="post" onSubmit="return checkk(this)" name="frm">
				<input type="hidden" name="idChecked"/>
				<div align="center" id="secCon">
					<table border="1">
						<tr>
							<th>회원계정</th>
							<td>
								<input type="text" name="IDD" id="IDD"/>
								<input type="button" value="중복 검사" onClick="idCheck()"/>
							</td>
						</tr>
						<tr>
							<th>암 호</th>
							<td>
								<input type="password" name="PASSWORD"/>
							</td>
						</tr>
						<tr>
							<th>암호 확인</th>
							<td><input type="password" name="CONFIRM"/></td>
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
							<th>성 별</th>
							<td>
								남 : <input type="radio" name="GENDER" value="M"/>
								여 : <input type="radio" name="GENDER" value="F"/>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="EMAIL"/>
							</td>
						</tr>
						<tr>
							<th>직 업</th>
							<td>
								<select name="JOB">
									<option>--선택하세요--</option>
									<option>회사원</option>
									<option>학생</option>
									<option>가사</option>
									<option>자영업</option>
									<option>기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="등록"/>
								<input type="reset" value="취소"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
	</section>
	<script type="text/javascript">
		function idCheck() {
<<<<<<< HEAD
			if(frm.IDD.value == '') {
				alert("계정명을 입력해 주세요.");
				return false;
=======
			if(document.frm.IDD.value == '') {
				alert("계정을 입력하세요."); return false;
			}else {
				if(document.frm.IDD.length > 20) {
					alert("계정은 20글자 이내어야 합니다.");
					return false;
				}
>>>>>>> 0cfc075444a581294642391264a0a11130860498
			}
			var url = "idCheck.do?IDD="+document.frm.IDD.value;
			window.open(url,"_blank_","width=500, height=300");
		}
		function checkk(frm){
			if(frm.IDD.value == '') {
				alert("계정을 입력하세요."); return false;
			}else {
				if(frm.IDD.length > 20) {
					alert("계정은 20글자 이내어야 합니다.");
					return false;
				}
			}
			if(frm.idChecked.value == '') {
				alert("계정 중복 검사를 해주세요.");return false;
			}
			if(frm.PASSWORD.value == '') {
				alert("암호를 입력하세요."); return false;
			}else {
				if(frm.PASSWORD.length > 20) {
					alert("암호는 20글자 이내로 입력하세요.");
					return false;
				}
			}
			if(frm.PASSWORD.value != frm.CONFIRM.value) {
				alert("암호가 일치하지 않습니다.");
				return false;
			}
			if(frm.NAME.value == ''){
				alert("이름을 입력하세요."); return false;
			}else {
				if(frm.NAME.length > 50) {
					alert("이름은 50글자 이내로 입력하세요.");
					return false;
				}
			}
			if(! frm.GENDER[0].checked && ! frm.GENDER [1]) {
				alert("성별을 선택하세요.");
				return false;
			}
			if(frm.JOB.selectedIndex < 1) {
				alert("직업을 선택하세요.");
				return false;
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