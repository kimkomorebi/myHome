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
	<header>
		<h2 align="center" class="tit">�α��� ���</h2>
	</header>
	<section>
	<c:if test="${param.R == 'OK' }">
		�α��� �Ǿ����ϴ�.<br/>
		ȯ���մϴ�.~
		<c:if test="${ ! empty sessionScope.LOGINID }">
			${sessionScope.LOGINID } ��~
		</c:if>
		<c:if test="${ ! empty sessionScope.MANAGER }">
			${sessionScope.MANAGER } ��~
		</c:if>
		<c:if test="${ ! empty param. POPUP}">
			<br/><input type="button" value="�� ��" onClick="doIt()"/>
			<script type="text/javascript">
				function doIt(){
					self.close();
					opener.document.location.reload();
					opener.popupAlert();
				}
			</script>
		</c:if>
	</c:if>
	<c:if test="${param.R == 'NOPWD' }">
		��ȣ�� ��ġ���� �ʽ��ϴ�. ��ȣ�� Ȯ���ϼ���.
	</c:if>
	<c:if test="${param.R == 'NOID' }">
		������ �����ϴ�.���� �� �̿��� �ּ���.	
	</c:if>

<%-- <%
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
%> --%>
	</section>
</body>
</html>