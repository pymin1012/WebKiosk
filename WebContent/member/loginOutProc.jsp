<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	session.invalidate();
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>

<script>
    alert("�α׾ƿ� �Ǿ����ϴ�.");
	location.replace("../index.jsp");
</script>