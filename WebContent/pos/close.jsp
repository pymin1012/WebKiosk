<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="psMgr" class="kiosk.PosMgr" />

<% 
	psMgr.closeCaffe();
%>
<script>
	location.href = "pos.jsp";
</script>