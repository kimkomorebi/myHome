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
		<h2 align="center">ȸ�� ����</h2>
	</header>
	<section>
			<form action="memberRegister.do" method="post" onSubmit="return checkk(this)" name="frm">
				<input type="hidden" name="idChecked"/>
				<div align="center" id="secCon">
					<table border="1">
						<tr>
							<th>ȸ������</th>
							<td>
								<input type="text" name="IDD" id="IDD"/>
								<input type="button" value="�ߺ� �˻�" onClick="idCheck()"/>
							</td>
						</tr>
						<tr>
							<th>�� ȣ</th>
							<td>
								<input type="password" name="PASSWORD"/>
							</td>
						</tr>
						<tr>
							<th>��ȣ Ȯ��</th>
							<td><input type="password" name="CONFIRM"/></td>
						</tr>
						<tr>
							<th>ȸ������</th>
							<td><input type="text" name="NAME"/></td>
						</tr>
						<tr>
							<th>ȸ����ȭ</th>
							<td><input type="text" name="TEL"/></td>
						</tr>
						<tr>
							<th>ȸ���ּ�</th>
							<td><input type="text" name="ADDR"/></td>
						</tr>
						<tr>
							<th>�� ��</th>
							<td>
								�� : <input type="radio" name="GENDER" value="M"/>
								�� : <input type="radio" name="GENDER" value="F"/>
							</td>
						</tr>
						<tr>
							<th>�̸���</th>
							<td>
								<input type="text" name="EMAIL"/>
							</td>
						</tr>
						<tr>
							<th>�� ��</th>
							<td>
								<select name="JOB">
									<option>--�����ϼ���--</option>
									<option>ȸ���</option>
									<option>�л�</option>
									<option>����</option>
									<option>�ڿ���</option>
									<option>��Ÿ</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="���"/>
								<input type="reset" value="���"/>
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
				alert("�������� �Է��� �ּ���.");
				return false;
=======
			if(document.frm.IDD.value == '') {
				alert("������ �Է��ϼ���."); return false;
			}else {
				if(document.frm.IDD.length > 20) {
					alert("������ 20���� �̳���� �մϴ�.");
					return false;
				}
>>>>>>> 0cfc075444a581294642391264a0a11130860498
			}
			var url = "idCheck.do?IDD="+document.frm.IDD.value;
			window.open(url,"_blank_","width=500, height=300");
		}
		function checkk(frm){
			if(frm.IDD.value == '') {
				alert("������ �Է��ϼ���."); return false;
			}else {
				if(frm.IDD.length > 20) {
					alert("������ 20���� �̳���� �մϴ�.");
					return false;
				}
			}
			if(frm.idChecked.value == '') {
				alert("���� �ߺ� �˻縦 ���ּ���.");return false;
			}
			if(frm.PASSWORD.value == '') {
				alert("��ȣ�� �Է��ϼ���."); return false;
			}else {
				if(frm.PASSWORD.length > 20) {
					alert("��ȣ�� 20���� �̳��� �Է��ϼ���.");
					return false;
				}
			}
			if(frm.PASSWORD.value != frm.CONFIRM.value) {
				alert("��ȣ�� ��ġ���� �ʽ��ϴ�.");
				return false;
			}
			if(frm.NAME.value == ''){
				alert("�̸��� �Է��ϼ���."); return false;
			}else {
				if(frm.NAME.length > 50) {
					alert("�̸��� 50���� �̳��� �Է��ϼ���.");
					return false;
				}
			}
			if(! frm.GENDER[0].checked && ! frm.GENDER [1]) {
				alert("������ �����ϼ���.");
				return false;
			}
			if(frm.JOB.selectedIndex < 1) {
				alert("������ �����ϼ���.");
				return false;
			}
			if(confirm("�Է��� ������ �½��ϱ�?")){
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>