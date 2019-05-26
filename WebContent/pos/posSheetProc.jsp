<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="psMgr" class="kiosk.PosMgr" />

<%
	request.setCharacterEncoding("UTF-8");
	int oh_num = Integer.parseInt(request.getParameter("oh_num"));
	String flag = request.getParameter("flag");
	
	if (flag.equals("ready")) {
		psMgr.readyOrder(oh_num);
	} else if (flag.equals("receive")) {
		psMgr.receiveOrder(oh_num);
	} else if (flag.equals("cancle")) {
		psMgr.cancleOrder(oh_num);
	}
%>
