<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	session.removeAttribute("bMgr");
	session.removeAttribute("oh_io");
%>

<script>
	location.href = "../index.jsp";
</script>