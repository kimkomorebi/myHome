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
		<h2 align="center" class="tit">�α��� ���</h2>
	</header>
	<section>
<%
	String result = request.getParameter("R");
	if(result.equals("OK")){
		//�α��� ���� �޼��� ���
		out.print("�α��� �Ǿ����ϴ�.<br/>");
		String id = (String)session.getAttribute("LOGINID");
		if(id == null) {
			id = (String)session.getAttribute("MANAGER");
		}
		out.print("ȯ���մϴ�~"+id+"��");
	}else if(result.equals("NOPWD")){
		//��ȣ ����ġ �޼��� ���
		out.print("��ȣ�� ��ġ���� �ʽ��ϴ�. ��ȣ�� Ȯ���ϼ���.");
	}else if(result.equals("NOID")){
		//���� ���� �޼��� ���
		out.print("������ �����ϴ�.���� �� �̿��� �ּ���.");
	}
%>
	</section>
</body>
</html>