<%@ page contentType="text/html; charset=UTF-8" %>
<%
	session.invalidate();
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>

<script>
    alert("로그아웃 되었습니다.");
	location.replace("../index.jsp");
</script>
