<%@ page contentType="text/html; charset=UTF-8" %>
<%
	session.invalidate();
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>

<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>
	swal({title: "로그아웃 되었습니다.", icon: "warning", timer: 2000}).then(function() {
		location.replace("../index.jsp");
	});
</script>
</body>
</html>