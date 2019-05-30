<%@page import="kiosk.EventoBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="eMgr" class="admin.EventoMgr" />
<jsp:useBean id="eBean" class="kiosk.EventoBean" />
<jsp:setProperty name="eBean" property="*" />
<% 
boolean flag = eMgr.updateEvento(eBean);
	if(flag){
%>
		<script>
			location.href="eventoMgr.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("수정에 실패했습니다.");
			history.back();
		</script>
<%}%>