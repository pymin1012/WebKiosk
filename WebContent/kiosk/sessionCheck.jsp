<%
	if (session.getAttribute("mb_num") == null || session.getAttribute("oh_io") == null) {
%>
<script>
	location.href = "../index.jsp";
</script>
<%
	}
%>