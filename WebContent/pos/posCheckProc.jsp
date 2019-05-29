<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="psMgr" class="kiosk.PosMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int oh_tnum = Integer.parseInt(request.getParameter("oh_tnum"));

	String flag = request.getParameter("flag");
	
	if (flag.equals("check")) {
		psMgr.checkOrder(oh_tnum);
	} else if (flag.equals("cancle")) {
		psMgr.cancleOrder(oh_tnum);
	}
%>
