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
		<h2>��ǰ �� ����</h2>

		<form action="itemUpdate.do" method="post" name="" onSubmit="return check(this)">
			<input type="hidden" name="ID" value="${ITEM.id }"/>
			<table border="1">
				<tr>
					<th>��ǰ ��ȣ</th>
					<td>${ITEM.id }</td>
				</tr>
				<tr>
					<th>��ǰ �̸�</th>
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
					<th>��ǰ ����</th>
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
					<th>������</th>
					<td>${ITEM.origin }</td>
				</tr>
				<tr>
					<th>�� ��</th>
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
							<input type="submit" value="��ǰ���� ����"/>
							<input type="reset" value="�� ��"/>
						</td>
					</tr><br/><br/>
				</c:if>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function check(f){
			if(f.NAME.value == ''){
				alert("��ǰ �̸��� �Է��ϼ���."); 
				return false;
			}else {
				if(f.NAME.length > 20){
					alert("��ǰ �̸��� 20�� �̳��� �Է��ϼ���.");
					return false;
				}
			}
			if(f.PRICE.value == ''){
				alert("��ǰ ������ �Է��ϼ���.");
				return false;
			}else {
				if(isNaN(f.PRICE.value)) {
					alert("��ǰ ������ ���ڷ� �Է��ϼ���.");
					return false;
				}else {
					if(parseInt(f.PRICE.value) < 0) {
						alert("��ǰ ������ 0���� Ŀ�� �մϴ�.");
						return false;
					}
				}
			}
			if(! confirm("������ �����Ͻðڽ��ϱ�?")){
				return false;
			}
		}
	</script>
			<c:if test="${param.R == 'OK' }">
			<script type="text/javascript">
			alert("��ǰ ���� ���� �Ϸ��Ͽ����ϴ�.");
			</script>
		</c:if>
		<c:if test="${param.R == 'NOK' }">
			<script type="text/javascript">
				alert("��ǰ ���� ���� ����!!");
			</script>
		</c:if>
</body>
</html>