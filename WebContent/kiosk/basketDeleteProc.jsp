<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int or_basket = Integer.parseInt(request.getParameter("or_basket"));
	bMgr.deleteBasket(or_basket);
%>