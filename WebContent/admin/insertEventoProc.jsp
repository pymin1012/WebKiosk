<%@ page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="eMgr" class="admin.EventoMgr" />
<jsp:useBean id="eBean" class="kiosk.EventoBean" />
<jsp:setProperty name="eBean" property="*" />
<%boolean flag = eMgr.insertEvento(eBean);%>
<html>
<head>
<title>이벤트 입력</title>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#FFFFCC">
<br/><br/>
<div align="center">
<%
if(flag){
	  out.println("<b>이벤트 입력 완료.</b><p>");
	  out.println("<a href=eventoMgr.jsp>이벤트목록으로</a>");
	}else{
	  out.println("<b>다시 입력하여 주십시오.</b><p>");
	  out.println("<a href=insertEvento.jsp>다시 입력</a>");
	}
%>
</div>
</body>
</html>